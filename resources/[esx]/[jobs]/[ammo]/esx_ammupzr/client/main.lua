local PlayerData              = {}
local HasAlreadyEnteredMarker = false
local LastStation             = nil
local LastPart                = nil
local LastPartNum             = nil
local LastEntity              = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local IsHandcuffed            = false
local HandcuffTimer           = {}
local DragStatus              = {}
DragStatus.IsDragged          = false
local hasAlreadyJoined        = false
local blipsCops               = {}
local isDead                  = false
local CurrentTask             = {}
local playerInService         = false

ESX                           = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

function SetVehicleMaxMods(vehicle)
	local props = {
		modEngine       = 0,
		modBrakes       = 0,
		modTransmission = 0,
		modSuspension   = 0,
		modTurbo        = false
	}

	ESX.Game.SetVehicleProperties(vehicle, props)
end

function cleanPlayer(playerPed)
	SetPedArmour(playerPed, 0)
	ClearPedBloodDamage(playerPed)
	ResetPedVisibleDamage(playerPed)
	ClearPedLastWeaponDamage(playerPed)
	ResetPedMovementClipset(playerPed, 0)
end

function setUniform(job, playerPed)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			if Config.Uniforms[job].male ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].male)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end

			if job == 'bullet_wear' then
				SetPedArmour(playerPed, 100)
			end
		else
			if Config.Uniforms[job].female ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].female)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end

			if job == 'bullet_wear' then
				SetPedArmour(playerPed, 100)
			end
		end
	end)
end

function OpenCloakroomMenu()

	local playerPed = PlayerPedId()
	local grade = PlayerData.job.grade_name

	local elements = {
		{ label = _U('citizen_wear'), value = 'citizen_wear' },
		{ label = _U('bullet_wear'), value = 'bullet_wear' },
		{ label = _U('gilet_wear'), value = 'gilet_wear' }
	}

	-- if grade == 'recruit' then
	-- 	table.insert(elements, {label = _U('ammu_wear'), value = 'recruit_wear'})
	-- elseif grade == 'officer' then
	-- 	table.insert(elements, {label = _U('ammu_wear'), value = 'ammu_wear'})
	-- elseif grade == 'sergeant' then
	-- 	table.insert(elements, {label = _U('ammu_wear'), value = 'ammu_wear'})
	-- elseif grade == 'intendent' then
	-- 	table.insert(elements, {label = _U('ammu_wear'), value = 'ammu_wear'})
	-- elseif grade == 'lieutenant' then
	-- 	table.insert(elements, {label = _U('ammu_wear'), value = 'ammu_wear'})
	-- elseif grade == 'chef' then
	-- 	table.insert(elements, {label = _U('ammu_wear'), value = 'ammu_wear'})
	-- elseif grade == 'boss' or grade == 'lowerboss1' then
	-- 	table.insert(elements, {label = _U('ammu_wear'), value = 'boss_wear'})
	-- end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom',
	{
		title    = _U('cloakroom'),
		align    = 'left',
		elements = elements
	}, function(data, menu)

		cleanPlayer(playerPed)

		if data.current.value == 'citizen_wear' then
			
			if Config.EnableNonFreemodePeds then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					local isMale = skin.sex == 0

					TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
						ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
							TriggerEvent('skinchanger:loadSkin', skin)
							TriggerEvent('esx:restoreLoadout')
						end)
					end)

				end)
			else
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin)
				end)
			end

			if Config.MaxInService ~= -1 then

				ESX.TriggerServerCallback('esx_service:isInService', function(isInService)
					if isInService then

						playerInService = false

						local notification = {
							title    = _U('service_anonunce'),
							subject  = '',
							msg      = _U('service_out_announce', GetPlayerName(PlayerId())),
							iconType = 1
						}

						TriggerServerEvent('esx_service:notifyAllInService', notification, 'ammu')

						TriggerServerEvent('esx_service:disableService', 'ammu')
						TriggerEvent('esx_ammujob:updateBlip')
						ESX.ShowNotification(_U('service_out'))
					end
				end, 'ammu')
			end

		end

		if
			data.current.value == 'recruit_wear' or
			data.current.value == 'ammu_wear' or
			data.current.value == 'boss_wear' or
			data.current.value == 'bullet_wear' or
			data.current.value == 'gilet_wear'
		then
			setUniform(data.current.value, playerPed)
		end


	end, function(data, menu)
		menu.close()

		CurrentAction     = 'menu_cloakroom'
		CurrentActionData = {}
	end)
end

function OpenBuyItemsMenu ()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner',
	{
		title    = _U('vehicle_menu'),
		align    = 'left',
		elements = {
			{label = 'Krabicka s nabojema (500$)', value = 'ammo-box'},
			{label = 'Neprustrelna vesta (5000$)', value = 'bulletproof'},
			{label = 'Padak (2500$)', value = 'gadget_parachute'},
		}
	}, function(data, menu)
		TriggerServerEvent('esx_ammujob:buyItemFromList', data.current.value)
	end, function(data, menu)
		menu.close()
	end)
end

function OpenArmoryMenu(station)
	
	if Config.EnableArmoryManagement then

		local elements = {
			{label = _U('get_weapon'),     value = 'get_weapon'},
			{label = _U('put_weapon'),     value = 'put_weapon'},
			{label = _U('remove_object'),  value = 'get_stock'},
			{label = _U('deposit_object'), value = 'put_stock'},
		}
		if PlayerData.job.name == 'ammu' and (PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'lowerboss1') then
			table.insert(elements, {label = 'Koupit veci', value = 'buy_items'})
			-- table.insert(elements, {label = _U('buy_weapons'), value = 'buy_weapons'})
		end

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory',
		{
			title    = _U('armory'),
			align    = 'left',
			elements = elements
		}, function(data, menu)

			if data.current.value == 'get_weapon' then
				OpenGetWeaponMenu()
			elseif data.current.value == 'put_weapon' then
				OpenPutWeaponMenu()
			elseif data.current.value == 'put_stock' then
				OpenPutStocksMenu()
			elseif data.current.value == 'get_stock' then
				OpenGetStocksMenu()
			elseif data.current.value == 'buy_weapons' then
				OpenBuyWeaponsMenu(station)
			elseif data.current.value == 'buy_items' then
				OpenBuyItemsMenu()
			end
			
		end, function(data, menu)
			menu.close()

			CurrentAction     = 'menu_armory'
			CurrentActionData = {station = station}
		end)

	else

		local elements = {}

		for i=1, #Config.PoliceStations[station].AuthorizedWeapons, 1 do
			local weapon = Config.PoliceStations[station].AuthorizedWeapons[i]
			table.insert(elements, {label = ESX.GetWeaponLabel(weapon.name), value = weapon.name})
		end

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory',
		{
			title    = _U('armory'),
			align    = 'left',
			elements = elements
		}, function(data, menu)
			local weapon = data.current.value
			TriggerServerEvent('esx_ammujob:giveWeapon', weapon, Config.Bullets)
		end, function(data, menu)
			menu.close()

			CurrentAction     = 'menu_armory'
			CurrentActionData = {station = station}
		end)

	end

end

function OpenVehicleSpawnerMenu(station, partNum)

	ESX.UI.Menu.CloseAll()

	if Config.EnableSocietyOwnedVehicles then

		local elements = {}

		ESX.TriggerServerCallback('esx_society:getVehiclesInGarage', function(garageVehicles)

			for i=1, #garageVehicles, 1 do
				table.insert(elements, {
					label = GetDisplayNameFromVehicleModel(garageVehicles[i].model) .. ' [' .. garageVehicles[i].plate .. ']',
					value = garageVehicles[i]
				})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner',
			{
				title    = _U('vehicle_menu'),
				align    = 'left',
				elements = elements
			}, function(data, menu)
				menu.close()

				local vehicleProps = data.current.value
				local foundSpawnPoint, spawnPoint = GetAvailableVehicleSpawnPoint(station, partNum)

				if foundSpawnPoint then
					ESX.Game.SpawnVehicle(vehicleProps.model, spawnPoint, spawnPoint.heading, function(vehicle)
						ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
					end)

					TriggerServerEvent('esx_society:removeVehicleFromGarage', 'ammu', vehicleProps)
				end
			end, function(data, menu)
				menu.close()

				CurrentAction     = 'menu_vehicle_spawner'
				CurrentActionData = {station = station, partNum = partNum}
			end)

		end, 'ammu')

	else

		local elements = {}

		local sharedVehicles = Config.AuthorizedVehicles.Shared
		for i=1, #sharedVehicles, 1 do
			table.insert(elements, { label = sharedVehicles[i].label, model = sharedVehicles[i].model})
		end

		local authorizedVehicles = Config.AuthorizedVehicles[PlayerData.job.grade_name]
		for i=1, #authorizedVehicles, 1 do
			table.insert(elements, { label = authorizedVehicles[i].label, model = authorizedVehicles[i].model})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner',
		{
			title    = _U('vehicle_menu'),
			align    = 'left',
			elements = elements
		}, function(data, menu)
			menu.close()

			local foundSpawnPoint, spawnPoint = GetAvailableVehicleSpawnPoint(station, partNum)

			if foundSpawnPoint then
				if Config.MaxInService == -1 then
					ESX.Game.SpawnVehicle(data.current.model, spawnPoint, spawnPoint.heading, function(vehicle)
						SetVehicleMaxMods(vehicle)
					end)
				else

					ESX.TriggerServerCallback('esx_service:isInService', function(isInService)

						if isInService then
							ESX.Game.SpawnVehicle(data.current.model, spawnPoint, spawnPoint.heading, function(vehicle)
								SetVehicleMaxMods(vehicle)
							end)
						else
							ESX.ShowNotification(_U('service_not'))
						end

					end, 'ammu')
				end
			end

		end, function(data, menu)
			menu.close()

			CurrentAction     = 'menu_vehicle_spawner'
			CurrentActionData = {station = station, partNum = partNum}
		end)

	end
end

function GetAvailableVehicleSpawnPoint(station, partNum)
	local spawnPoints = Config.PoliceStations[station].Vehicles[partNum].SpawnPoints
	local found, foundSpawnPoint = false, nil

	for i=1, #spawnPoints, 1 do
		if ESX.Game.IsSpawnPointClear(spawnPoints[i], spawnPoints[i].radius) then
			found, foundSpawnPoint = true, spawnPoints[i]
			break
		end
	end

	if found then
		return true, foundSpawnPoint
	else
		ESX.ShowNotification(_U('vehicle_blocked'))
		return false
	end
end

function OpenammuActionsMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ammu_actions',
	{
		title    = 'ammu',
		align    = 'top-left',
		elements = {
			{label = _U('citizen_interaction'),	value = 'citizen_interaction'},
			{label = _U('object_spawner'), value = 'object_spawner'}
		}
	}, function(data, menu)

		if data.current.value == 'citizen_interaction' then
			local elements = {
				-- {label = _U('id_card'),			value = 'idcard'},
				{label = _U('search'),			value = 'body_search'},
				{label = _U('handcuff'),		value = 'handcuff'},
				{label = _U('drag'),			value = 'drag'},
				{label = _U('put_in_vehicle'),	value = 'put_in_vehicle'},
				{label = _U('out_the_vehicle'),	value = 'out_the_vehicle'},
				{label = _U('fine'),			value = 'fine'},
			}
		
			-- if Config.EnableLicenses then
			-- 	table.insert(elements, { label = _U('license_check'), value = 'license' })
			-- end
		
			ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'citizen_interaction',
			{
				title    = _U('citizen_interaction'),
				align    = 'top-left',
				elements = elements
			}, function(data2, menu2)
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				if closestPlayer ~= -1 and closestDistance <= 3.0 then
					local action = data2.current.value

				    	if action == 'body_search' then
						TriggerServerEvent('esx_ammujob:message', GetPlayerServerId(closestPlayer), _U('being_searched'))
						OpenBodySearchMenu(closestPlayer)
					elseif action == 'idcard' then
						OpenIdentityCardMenu(closestPlayer)
					elseif action == 'handcuff' then
						TriggerServerEvent('esx_ammujob:handcuff', GetPlayerServerId(closestPlayer))
					elseif action == 'drag' then
						TriggerServerEvent('esx_ammujob:drag', GetPlayerServerId(closestPlayer))
					elseif action == 'put_in_vehicle' then
						TriggerServerEvent('esx_ammujob:putInVehicle', GetPlayerServerId(closestPlayer))
					elseif action == 'out_the_vehicle' then
						TriggerServerEvent('esx_ammujob:OutVehicle', GetPlayerServerId(closestPlayer))
					elseif action == 'fine' then
						OpenBillingMenu(closestPlayer)
					elseif action == 'license' then
						ShowPlayerLicense(closestPlayer)
					end

				else
					ESX.ShowNotification(_U('no_players_nearby'))
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		elseif data.current.value == 'object_spawner' then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
				title    = _U('traffic_interaction'),
				align    = 'top-left',
				elements = {
					{label = _U('cone'), model = 'gr_prop_gr_target_05a'},
					{label = _U('barrier'), model = 'gr_prop_gr_target_05b'}
			}}, function(data2, menu2)
				local playerPed = PlayerPedId()
				local coords, forward = GetEntityCoords(playerPed), GetEntityForwardVector(playerPed)
				local objectCoords = (coords + forward * 1.0)

				ESX.Game.SpawnObject(data2.current.model, objectCoords, function(obj)
					SetEntityHeading(obj, GetEntityHeading(playerPed))
					PlaceObjectOnGroundProperly(obj)
				end)
			end, function(data2, menu2)
				menu2.close()
			end)
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenIdentityCardMenu(player)
	ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)
		local elements = {
			{label = 'OOC Nick: ' .. data.name},
			{label = _U('name', ('%s %s'):format(data.firstname, data.lastname))},
			{label = _U('job', ('%s - %s'):format(data.job, data.grade))}
		}

		if Config.EnableESXIdentity then
			table.insert(elements, {label = _U('sex', _U(data.sex))})
			table.insert(elements, {label = _U('dob', data.dob)})
			table.insert(elements, {label = _U('height', data.height)})
		end

		if data.drunk then
			table.insert(elements, {label = _U('bac', data.drunk)})
		end

		if data.licenses then
			table.insert(elements, {label = _U('license_label')})

			for i=1, #data.licenses, 1 do
				table.insert(elements, {label = data.licenses[i].label})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
			title    = _U('citizen_interaction'),
			align    = 'top-left',
			elements = elements
		}, nil, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(player))
end

function OpenBodySearchMenu(player)

	ESX.TriggerServerCallback('esx_ammujob:getOtherPlayerData', function(data)

		local elements = {}

		for i=1, #data.accounts, 1 do

			if data.accounts[i].name == 'black_money' and data.accounts[i].money > 0 then

				table.insert(elements, {
					label    = _U('confiscate_dirty', ESX.Round(data.accounts[i].money)),
					value    = 'black_money',
					itemType = 'item_account',
					amount   = data.accounts[i].money
				})

				break
			end

		end

		table.insert(elements, {label = _U('guns_label'), value = nil})

		for i=1, #data.weapons, 1 do
			table.insert(elements, {
				label    = _U('confiscate_weapon', ESX.GetWeaponLabel(data.weapons[i].name), data.weapons[i].ammo),
				value    = data.weapons[i].name,
				itemType = 'item_weapon',
				amount   = data.weapons[i].ammo
			})
		end

		table.insert(elements, {label = _U('inventory_label'), value = nil})

		for i=1, #data.inventory, 1 do
			if data.inventory[i].count > 0 then
				table.insert(elements, {
					label    = _U('confiscate_inv', data.inventory[i].count, data.inventory[i].label),
					value    = data.inventory[i].name,
					itemType = 'item_standard',
					amount   = data.inventory[i].count
				})
			end
		end


		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'body_search',
		{
			title    = _U('search'),
			align    = 'left',
			elements = elements,
		},
		function(data, menu)

			local itemType = data.current.itemType
			local itemName = data.current.value
			local amount   = data.current.amount

			if data.current.value ~= nil then
				TriggerServerEvent('esx_ammujob:confiscatePlayerItem', GetPlayerServerId(player), itemType, itemName, amount)
				OpenBodySearchMenu(player)
			end

		end, function(data, menu)
			menu.close()
		end)

	end, GetPlayerServerId(player))

end

function OpenBillingMenu()

  ESX.UI.Menu.Open(
    'dialog', GetCurrentResourceName(), 'billing',
    {
      title = _U('billing_amount')
    },
    function(data, menu)
    
      local amount = tonumber(data.value)
      local player, distance = ESX.Game.GetClosestPlayer()

      if player ~= -1 and distance <= 3.0 then

        menu.close()
        if amount == nil then
            ESX.ShowNotification(_U('amount_invalid'))
        else
            TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_ammu', _U('billing'), amount)
        end

      else
        ESX.ShowNotification(_U('no_players_nearby'))
      end

    end,
    function(data, menu)
        menu.close()
    end
  )
end

function ShowPlayerLicense(player)
	local elements = {}
	local targetName
	ESX.TriggerServerCallback('esx_ammujob:getOtherPlayerData', function(data)
		if data.licenses ~= nil then
			for i=1, #data.licenses, 1 do
				if data.licenses[i].label ~= nil and data.licenses[i].type ~= nil then
					table.insert(elements, {label = data.licenses[i].label, value = data.licenses[i].type})
				end
			end
		end
		
		if Config.EnableESXIdentity then
			targetName = data.firstname .. ' ' .. data.lastname
		else
			targetName = data.name
		end
		
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_license',
		{
			title    = _U('license_revoke'),
			align    = 'left',
			elements = elements,
		}, function(data, menu)
			ESX.ShowNotification(_U('licence_you_revoked', data.current.label, targetName))
			TriggerServerEvent('esx_ammujob:message', GetPlayerServerId(player), _U('license_revoked', data.current.label))
			
			TriggerServerEvent('esx_license:removeLicense', GetPlayerServerId(player), data.current.value)
			
			ESX.SetTimeout(300, function()
				ShowPlayerLicense(player)
			end)
		end, function(data, menu)
			menu.close()
		end)

	end, GetPlayerServerId(player))
end

function OpenGetWeaponMenu()

	ESX.TriggerServerCallback('esx_ammujob:getArmoryWeapons', function(weapons)
		local elements = {}

		for i=1, #weapons, 1 do
			if weapons[i].count > 0 then
				table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_get_weapon',
		{
			title    = _U('get_weapon_menu'),
			align    = 'left',
			elements = elements
		}, function(data, menu)

			menu.close()

			ESX.TriggerServerCallback('esx_ammujob:removeArmoryWeapon', function()
				OpenGetWeaponMenu()
			end, data.current.value, Config.Bullets)

		end, function(data, menu)
			menu.close()
		end)
	end)

end

function OpenPutWeaponMenu()
	local elements   = {}
	local playerPed  = PlayerPedId()
	local weaponList = ESX.GetWeaponList()

	for i=1, #weaponList, 1 do
		local weaponHash = GetHashKey(weaponList[i].name)

		if HasPedGotWeapon(playerPed, weaponHash, false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
			table.insert(elements, {label = weaponList[i].label, value = weaponList[i].name})
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_put_weapon',
	{
		title    = _U('put_weapon_menu'),
		align    = 'left',
		elements = elements
	}, function(data, menu)

		menu.close()

		ESX.TriggerServerCallback('esx_ammujob:addArmoryWeapon', function()
			OpenPutWeaponMenu()
		end, data.current.value, true)

	end, function(data, menu)
		menu.close()
	end)
end

function OpenBuyWeaponsMenu(station)
	local money = false
	ESX.TriggerServerCallback('esx_ammujob:getArmoryWeapons', function(weapons)

		local elements = {}

		for i=1, #Config.PoliceStations[station].AuthorizedWeapons, 1 do
			local weapon = Config.PoliceStations[station].AuthorizedWeapons[i]
			local count  = 0

			for i=1, #weapons, 1 do
				if weapons[i].name == weapon.name then
					count = weapons[i].count
					break
				end
			end

			table.insert(elements, {
				label = 'x' .. count .. ' ' .. ESX.GetWeaponLabel(weapon.name) .. ' $' .. weapon.price .. ' x ' .. weapon.piece,
				value = weapon.name,
				price = weapon.price,
				piece = weapon.piece
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_buy_weapons',
		{
			title    = _U('buy_weapon_menu'),
			align    = 'left',
			elements = elements,
		}, function(data, menu)

			ESX.TriggerServerCallback('esx_ammujob:buy', function(hasEnoughMoney)
				if hasEnoughMoney then
					ESX.TriggerServerCallback('esx_ammujob:addArmoryWeapon', function()
						OpenBuyWeaponsMenu(station)
					end, data.current.value, false)
				else
					ESX.ShowNotification(_U('not_enough_money'))
				end
			end, data.current.price, data.current.piece)

		end, function(data, menu)
			menu.close()
		end)

	end)

end

function OpenGetStocksMenu()

	ESX.TriggerServerCallback('esx_ammujob:getStockItems', function(items)


		local elements = {}

		for i=1, #items, 1 do
			table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu',
		{
			title    = _U('ammu_stock'),
			align    = 'left',
			elements = elements
		}, function(data, menu)

			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)

				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification(_U('quantity_invalid'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_ammujob:getStockItem', itemName, count)

					Citizen.Wait(300)
					OpenGetStocksMenu()
				end

			end, function(data2, menu2)
				menu2.close()
			end)

		end, function(data, menu)
			menu.close()
		end)

	end)

end

function OpenPutStocksMenu()

	ESX.TriggerServerCallback('esx_ammujob:getPlayerInventory', function(inventory)

		local elements = {}

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu',
		{
			title    = _U('inventory'),
			align    = 'left',
			elements = elements
		}, function(data, menu)

			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)

				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification(_U('quantity_invalid'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_ammujob:putStockItems', itemName, count)

					Citizen.Wait(300)
					OpenPutStocksMenu()
				end

			end, function(data2, menu2)
				menu2.close()
			end)

		end, function(data, menu)
			menu.close()
		end)
	end)

end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	TriggerEvent('esx_ammujob:handleBlips', xPlayer.job.name)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	TriggerEvent('esx_ammujob:handleBlips', job.name)
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = _U('phone_ammu'),
		number     = 'ammu',
		base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDFGQTJDRkI0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDFGQTJDRkM0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0MUZBMkNGOTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0MUZBMkNGQTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoW66EYAAAjGSURBVHjapJcLcFTV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'
	}

	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

-- don't show dispatches if the player isn't in service
AddEventHandler('esx_phone:cancelMessage', function(dispatchNumber)
	if type(PlayerData.job.name) == 'string' and PlayerData.job.name == 'ammu' and PlayerData.job.name == dispatchNumber then
		-- if esx_service is enabled
		if Config.MaxInService ~= -1 and not playerInService then
			CancelEvent()
		end
	end
end)


AddEventHandler('esx_ammujob:hasEnteredMarker', function(station, part, partNum)

	if part == 'Cloakroom' then
		CurrentAction     = 'menu_cloakroom'
		CurrentActionData = {}

	elseif part == 'Armory' then

		CurrentAction     = 'menu_armory'
		CurrentActionData = {station = station}

	elseif part == 'VehicleSpawner' then

		CurrentAction     = 'menu_vehicle_spawner'
		CurrentActionData = {station = station, partNum = partNum}

		
	elseif part == 'Selling' then

		CurrentAction     = 'menu_selling'
		CurrentActionData = {station = station, partNum = partNum}


	elseif part == 'HelicopterSpawner' then

		local helicopters = Config.PoliceStations[station].Helicopters

		if not IsAnyVehicleNearPoint(helicopters[partNum].SpawnPoint.x, helicopters[partNum].SpawnPoint.y, helicopters[partNum].SpawnPoint.z,  3.0) then
			ESX.Game.SpawnVehicle('polmav', helicopters[partNum].SpawnPoint, helicopters[partNum].Heading, function(vehicle)
				SetVehicleModKit(vehicle, 0)
				SetVehicleLivery(vehicle, 0)
			end)
		end

	elseif part == 'VehicleDeleter' then

		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)

		if IsPedInAnyVehicle(playerPed,  false) then

			local vehicle = GetVehiclePedIsIn(playerPed, false)

			if DoesEntityExist(vehicle) then
				CurrentAction     = 'delete_vehicle'
				CurrentActionData = {vehicle = vehicle}
			end

		end
	elseif part == 'BossActions' then

		CurrentAction     = 'menu_boss_actions'
		CurrentActionData = {}
		
	elseif part == 'WeaponPartsHarvets' then
		CurrentAction     = 'ammu_harvest_menu'
		CurrentActionData = {}
	end

end)

AddEventHandler('esx_ammujob:hasExitedMarker', function(station, part, partNum)
	if part == 'WeaponPartsHarvets' then
		TriggerServerEvent('esx_ammujob:stopHarvest')
	end

	if part == 'Selling' then
		TriggerServerEvent('esx_ammujob:stopSell')
	end


	CurrentAction = nil
	if part ~= 'VehicleSpawner' then
		ESX.UI.Menu.CloseAll()
	end
end)

AddEventHandler('esx_ammujob:hasEnteredEntityZone', function(entity)
	local playerPed = PlayerPedId()

	if PlayerData.job ~= nil and PlayerData.job.name == 'ammu' and IsPedOnFoot(playerPed) then
		CurrentAction     = 'remove_entity'
		CurrentActionData = {entity = entity}
	end

	if GetEntityModel(entity) == GetHashKey('p_ld_stinger_s') then
		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)

		if IsPedInAnyVehicle(playerPed, false) then
			local vehicle = GetVehiclePedIsIn(playerPed)

			for i=0, 7, 1 do
				SetVehicleTyreBurst(vehicle, i, true, 1000)
			end
		end
	end
end)

AddEventHandler('esx_ammujob:hasExitedEntityZone', function(entity)
	if CurrentAction == 'remove_entity' then
		CurrentAction = nil
	end
end)

RegisterNetEvent('esx_ammujob:handcuff')
AddEventHandler('esx_ammujob:handcuff', function()
	IsHandcuffed    = not IsHandcuffed
	local playerPed = PlayerPedId()

	Citizen.CreateThread(function()
		if IsHandcuffed then

			RequestAnimDict('mp_arresting')
			while not HasAnimDictLoaded('mp_arresting') do
				Citizen.Wait(100)
			end

			TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)

			SetEnableHandcuffs(playerPed, true)
			DisablePlayerFiring(playerPed, true)
			SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
			SetPedCanPlayGestureAnims(playerPed, false)
			FreezeEntityPosition(playerPed, true)
			DisplayRadar(false)

			if Config.EnableHandcuffTimer then

				if HandcuffTimer.Active then
					ESX.ClearTimeout(HandcuffTimer.Task)
				end

				StartHandcuffTimer()
			end

		else

			if Config.EnableHandcuffTimer and HandcuffTimer.Active then
				ESX.ClearTimeout(HandcuffTimer.Task)
			end

			ClearPedSecondaryTask(playerPed)
			SetEnableHandcuffs(playerPed, false)
			DisablePlayerFiring(playerPed, false)
			SetPedCanPlayGestureAnims(playerPed, true)
			FreezeEntityPosition(playerPed, false)
			DisplayRadar(true)
		end
	end)

end)





-- APANHAS
function OpenAmmuHarvestMenu()
	PlayerData = ESX.GetPlayerData()
	
	if Config.EnablePlayerManagement and PlayerData.job.name == "ammu" then --and ESX.PlayerData.job
		local elements = {
			{label = _U('weapon_piece'), value = 'weapon_piece'}
		}

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ammu_harvest', {
			title    = _U('harvest'),
			align    = 'left',
			elements = elements
		}, function(data, menu)
			menu.close()

			if data.current.value == 'weapon_piece' then
				TriggerServerEvent('esx_ammujob:startHarvest')
			end
		end, function(data, menu)
			menu.close()
			CurrentAction     = 'ammu_harvest_menu'
			CurrentActionData = {}
		end)
	else
		ESX.ShowNotification(_U('not_experienced_enough'))
	end
end
	
--[[AddEventHandler('esx_ammujob:hasExitedMarker', function(zone)
	if zone == 'Craft' then
		TriggerServerEvent('esx_ammujob:stopCraft')
	elseif zone == 'WeaponPartsHarvets' then
		TriggerServerEvent('esx_ammujob:stopHarvest')
	end

	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)]]

-- FIM DAS APANHAS






RegisterNetEvent('esx_ammujob:unrestrain')
AddEventHandler('esx_ammujob:unrestrain', function()
	if IsHandcuffed then
		local playerPed = PlayerPedId()
		IsHandcuffed = false

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(true)

		-- end timer
		if Config.EnableHandcuffTimer and HandcuffTimer.Active then
			ESX.ClearTimeout(HandcuffTimer.Task)
		end
	end
end)

RegisterNetEvent('esx_ammujob:drag')
AddEventHandler('esx_ammujob:drag', function(copID)
	if not IsHandcuffed then
		return
	end

	DragStatus.IsDragged = not DragStatus.IsDragged
	DragStatus.CopId     = tonumber(copID)
end)

Citizen.CreateThread(function()
	local playerPed
	local targetPed

	while true do
		Citizen.Wait(1)

		if IsHandcuffed then
			playerPed = PlayerPedId()

			if DragStatus.IsDragged then
				targetPed = GetPlayerPed(GetPlayerFromServerId(DragStatus.CopId))

				-- undrag if target is in an vehicle
				if not IsPedSittingInAnyVehicle(targetPed) then
					AttachEntityToEntity(playerPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
				else
					DragStatus.IsDragged = false
					DetachEntity(playerPed, true, false)
				end

			else
				DetachEntity(playerPed, true, false)
			end
		else
			Citizen.Wait(500)
		end
	end
end)

RegisterNetEvent('esx_ammujob:putInVehicle')
AddEventHandler('esx_ammujob:putInVehicle', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

	if not IsHandcuffed then
		return
	end

	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
		local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)

		if DoesEntityExist(vehicle) then
			local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
			local freeSeat = nil

			for i=maxSeats - 1, 0, -1 do
				if IsVehicleSeatFree(vehicle, i) then
					freeSeat = i
					break
				end
			end

			if freeSeat ~= nil then
				TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
				DragStatus.IsDragged = false
			end
		end
	end
end)

RegisterNetEvent('esx_ammujob:OutVehicle')
AddEventHandler('esx_ammujob:OutVehicle', function()
	local playerPed = PlayerPedId()

	if not IsPedSittingInAnyVehicle(playerPed) then
		return
	end

	local vehicle = GetVehiclePedIsIn(playerPed, false)
	TaskLeaveVehicle(playerPed, vehicle, 16)
end)

-- Handcuff
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local playerPed = PlayerPedId()

		if IsHandcuffed then
			DisableControlAction(0, 1, true) -- Disable pan
			DisableControlAction(0, 2, true) -- Disable tilt
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1
			DisableControlAction(0, 32, true) -- W
			DisableControlAction(0, 34, true) -- A
			DisableControlAction(0, 31, true) -- S (fault in Keys table!)
			DisableControlAction(0, 30, true) -- D (fault in Keys table!)

			DisableControlAction(0, 45, true) -- Reload
			DisableControlAction(0, 22, true) -- Jump
			DisableControlAction(0, 44, true) -- Cover
			DisableControlAction(0, 37, true) -- Select Weapon
			DisableControlAction(0, 23, true) -- Also 'enter'?

			DisableControlAction(0, 288, true) -- Disable phone
			DisableControlAction(0, 289, true) -- Inventory
			DisableControlAction(0, 170, true) -- Animations
			DisableControlAction(0, 167, true) -- Job

			DisableControlAction(0, 0, true) -- Disable changing view
			DisableControlAction(0, 73, true) -- Disable looking behind
			DisableControlAction(0, 199, true) -- Disable clearing animation
			DisableControlAction(2, 245, true) -- Disable pause screen

			DisableControlAction(0, 59, true) -- Disable steering in vehicle
			DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
			DisableControlAction(0, 72, true) -- Disable reversing in vehicle

			DisableControlAction(2, 36, true) -- Disable going stealth

			DisableControlAction(0, 47, true)  -- Disable weapon
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle
			if IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3) ~= 1 then
				ESX.Streaming.RequestAnimDict('mp_arresting', function()
					TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
				end)
			end
		else
			Citizen.Wait(500)
		end
	end
end)

-- Create blips
function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

-- Display markers
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(10)

		if PlayerData.job ~= nil and PlayerData.job.name == 'ammu' then

			local playerPed = PlayerPedId()
			local coords    = GetEntityCoords(playerPed)

			for k,v in pairs(Config.PoliceStations) do

				for i=1, #v.Cloakrooms, 1 do
					if GetDistanceBetweenCoords(coords, v.Cloakrooms[i].x, v.Cloakrooms[i].y, v.Cloakrooms[i].z, true) < Config.DrawDistance then
						--DrawText3Ds(v.Cloakrooms[i].x, v.Cloakrooms[i].y, v.Cloakrooms[i].z, 'Press ~g~[E]~s~ to change clothes')
						DrawText3Ds(v.Cloakrooms[i].x, v.Cloakrooms[i].y, v.Cloakrooms[i].z, _U('changecloth'))
					end
				end

				for i=1, #v.Armories, 1 do
					if GetDistanceBetweenCoords(coords, v.Armories[i].x, v.Armories[i].y, v.Armories[i].z, true) < Config.DrawDistance then
						DrawText3Ds(v.Armories[i].x, v.Armories[i].y, v.Armories[i].z, _U('Arsenal'))
					end
				end

				for i=1, #v.Vehicles, 1 do
					if GetDistanceBetweenCoords(coords, v.Vehicles[i].Spawner.x, v.Vehicles[i].Spawner.y, v.Vehicles[i].Spawner.z, true) < Config.DrawDistance then
						DrawText3Ds(v.Vehicles[i].Spawner.x, v.Vehicles[i].Spawner.y, v.Vehicles[i].Spawner.z, _U('garage'))
					end
				end

				for i=1, #v.VehicleDeleters, 1 do
					if GetDistanceBetweenCoords(coords, v.VehicleDeleters[i].x, v.VehicleDeleters[i].y, v.VehicleDeleters[i].z, true) < Config.DrawDistance then
						DrawText3Ds(v.VehicleDeleters[i].x, v.VehicleDeleters[i].y, v.VehicleDeleters[i].z, _U('storeveh'))
					end
				end
				
				for i=1, #v.WeaponPartsHarvets, 1 do
					if GetDistanceBetweenCoords(coords, v.WeaponPartsHarvets[i].x, v.WeaponPartsHarvets[i].y, v.WeaponPartsHarvets[i].z, true) < Config.DrawDistance then
						DrawText3Ds(v.WeaponPartsHarvets[i].x, v.WeaponPartsHarvets[i].y, v.WeaponPartsHarvets[i].z, _U('weaparts'))
					end
				end

				if GetDistanceBetweenCoords(coords, v.Selling.coords.x, v.Selling.coords.y, v.Selling.coords.z, true) < Config.DrawDistance then
					DrawText3Ds(v.Selling.coords.x, v.Selling.coords.y, v.Selling.coords.z + 1, 'Zmackni ~g~[E]~s~ pro prodej soucatek na zbrane.')
				end

				if Config.EnablePlayerManagement and (PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'lowerboss1') then
					for i=1, #v.BossActions, 1 do
						if not v.BossActions[i].disabled and GetDistanceBetweenCoords(coords, v.BossActions[i].x, v.BossActions[i].y, v.BossActions[i].z, true) < Config.DrawDistance then
							DrawText3Ds(v.BossActions[i].x, v.BossActions[i].y, v.BossActions[i].z, _U('boss'))
						end
					end
				end

			end

		else
			Citizen.Wait(500)
		end

	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()

	while true do

		Citizen.Wait(10)

		if PlayerData.job ~= nil and PlayerData.job.name == 'ammu' then

			local playerPed      = PlayerPedId()
			local coords         = GetEntityCoords(playerPed)
			local isInMarker     = false
			local currentStation = nil
			local currentPart    = nil
			local currentPartNum = nil

			for k,v in pairs(Config.PoliceStations) do

				for i=1, #v.Cloakrooms, 1 do
					if GetDistanceBetweenCoords(coords, v.Cloakrooms[i].x, v.Cloakrooms[i].y, v.Cloakrooms[i].z, true) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'Cloakroom'
						currentPartNum = i
					end
				end

				for i=1, #v.Armories, 1 do
					if GetDistanceBetweenCoords(coords, v.Armories[i].x, v.Armories[i].y, v.Armories[i].z, true) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'Armory'
						currentPartNum = i
					end
				end
--				
				for i=1, #v.WeaponPartsHarvets, 1 do
					if GetDistanceBetweenCoords(coords, v.WeaponPartsHarvets[i].x, v.WeaponPartsHarvets[i].y, v.WeaponPartsHarvets[i].z, true) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'WeaponPartsHarvets'
						currentPartNum = i
					end
				end
--
				for i=1, #v.Vehicles, 1 do
					if GetDistanceBetweenCoords(coords, v.Vehicles[i].Spawner.x, v.Vehicles[i].Spawner.y, v.Vehicles[i].Spawner.z, true) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'VehicleSpawner'
						currentPartNum = i
					end
				end

				for i=1, #v.Helicopters, 1 do
					if GetDistanceBetweenCoords(coords, v.Helicopters[i].Spawner.x, v.Helicopters[i].Spawner.y, v.Helicopters[i].Spawner.z, true) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'HelicopterSpawner'
						currentPartNum = i
					end
				end

				for i=1, #v.VehicleDeleters, 1 do
					if GetDistanceBetweenCoords(coords, v.VehicleDeleters[i].x, v.VehicleDeleters[i].y, v.VehicleDeleters[i].z, true) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'VehicleDeleter'
						currentPartNum = i
					end
				end

				if Config.EnablePlayerManagement and (PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'lowerboss1') then
					for i=1, #v.BossActions, 1 do
						if GetDistanceBetweenCoords(coords, v.BossActions[i].x, v.BossActions[i].y, v.BossActions[i].z, true) < Config.MarkerSize.x then
							isInMarker     = true
							currentStation = k
							currentPart    = 'BossActions'
							currentPartNum = i
						end
					end
				end

				if GetDistanceBetweenCoords(coords, v.Selling.coords.x, v.Selling.coords.y, v.Selling.coords.z, true) < Config.MarkerSize.x then
					isInMarker     = true
					currentStation = k
					currentPart    = 'Selling'
					currentPartNum = 1
				end

			end

			local hasExited = false

			if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then

				if
					(LastStation ~= nil and LastPart ~= nil and LastPartNum ~= nil) and
					(LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
				then
					TriggerEvent('esx_ammujob:hasExitedMarker', LastStation, LastPart, LastPartNum)
					hasExited = true
				end

				HasAlreadyEnteredMarker = true
				LastStation             = currentStation
				LastPart                = currentPart
				LastPartNum             = currentPartNum

				TriggerEvent('esx_ammujob:hasEnteredMarker', currentStation, currentPart, currentPartNum)
			end

			if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_ammujob:hasExitedMarker', LastStation, LastPart, LastPartNum)
			end

		else
			Citizen.Wait(500)
		end

	end
end)

-- Enter / Exit entity zone events
Citizen.CreateThread(function()
	local trackedEntities = {
		'gr_prop_gr_target_05a',
		'gr_prop_gr_target_05b'
	}

	while true do
		Citizen.Wait(500)

		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)

		local closestDistance = -1
		local closestEntity   = nil

		for i=1, #trackedEntities, 1 do
			local object = GetClosestObjectOfType(coords.x, coords.y, coords.z, 3.0, GetHashKey(trackedEntities[i]), false, false, false)

			if DoesEntityExist(object) then
				local objCoords = GetEntityCoords(object)
				local distance  = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, objCoords.x, objCoords.y, objCoords.z, true)

				if closestDistance == -1 or closestDistance > distance then
					closestDistance = distance
					closestEntity   = object
				end
			end
		end

		if closestDistance ~= -1 and closestDistance <= 3.0 then
			if LastEntity ~= closestEntity then
				TriggerEvent('esx_ammujob:hasEnteredEntityZone', closestEntity)
				LastEntity = closestEntity
			end
		else
			if LastEntity ~= nil then
				TriggerEvent('esx_ammujob:hasExitedEntityZone', LastEntity)
				LastEntity = nil
			end
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(10)

		if CurrentAction ~= nil then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, 38) and PlayerData.job ~= nil and PlayerData.job.name == 'ammu' then

				if CurrentAction == 'menu_cloakroom' then
					OpenCloakroomMenu()
				elseif CurrentAction == 'menu_armory' then
					if Config.MaxInService == -1 then
						OpenArmoryMenu(CurrentActionData.station)
					elseif playerInService then
						OpenArmoryMenu(CurrentActionData.station)
					else
						ESX.ShowNotification(_U('service_not'))
					end
				elseif CurrentAction == 'menu_selling' then
					TriggerServerEvent("esx_ammujob:startSell")
				elseif CurrentAction == 'menu_vehicle_spawner' then
					exports.nncore:OpenVehicleSpawnerMenu(Config.VehicleShopCoords, Config.SpawnPoints, Config.AuthorizedVehicles)
				elseif CurrentAction == 'delete_vehicle' then
					if Config.EnableSocietyOwnedVehicles then
						local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
						TriggerServerEvent('esx_society:putVehicleILovePizzaInGarage', 'ammu', vehicleProps)
					end
					ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
				elseif CurrentAction == 'menu_boss_actions' then
					ESX.UI.Menu.CloseAll()
					TriggerEvent('esx_society:openBossMenu', 'ammu', function(data, menu)
						menu.close()
						CurrentAction     = 'menu_boss_actions'
						CurrentActionData = {}
					end, { wash = false }) -- disable washing money
				elseif CurrentAction == 'remove_entity' then
					DeleteEntity(CurrentActionData.entity)
				elseif CurrentAction == 'ammu_harvest_menu' then
					OpenAmmuHarvestMenu()
				end
				
				CurrentAction = nil
			end
		end -- CurrentAction end
		
		if IsControlJustReleased(0, 167) and not isDead and PlayerData.job ~= nil and PlayerData.job.name == 'ammu' and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'ammu_actions') then
			if Config.MaxInService == -1 then
				OpenammuActionsMenu()
			elseif playerInService then
				OpenammuActionsMenu()
			else
				ESX.ShowNotification(_U('service_not'))
			end
		end
		
		if IsControlJustReleased(0, 38) and CurrentTask.Busy then
			ESX.ShowNotification(_U('impound_canceled'))
			ESX.ClearTimeout(CurrentTask.Task)
			ClearPedTasks(PlayerPedId())
			
			CurrentTask.Busy = false
		end
	end
end)

-- Create blip for colleagues
function createBlip(id)
	local ped = GetPlayerPed(id)
	local blip = GetBlipFromEntity(ped)

	if not DoesBlipExist(blip) then -- Add blip and create head display on player
		blip = AddBlipForEntity(ped)
		SetBlipSprite(blip, 1)
		ShowHeadingIndicatorOnBlip(blip, true) -- Player Blip indicator
		SetBlipRotation(blip, math.ceil(GetEntityHeading(ped))) -- update rotation
		SetBlipNameToPlayerName(blip, id) -- update blip name
		SetBlipScale(blip, 0.85) -- set scale
		SetBlipAsShortRange(blip, true)
		
		table.insert(blipsCops, blip) -- add blip to array so we can remove it later
	end
end

RegisterNetEvent('esx_ammujob:updateBlip')
AddEventHandler('esx_ammujob:updateBlip', function()
	
	-- -- Refresh all blips
	-- for k, existingBlip in pairs(blipsCops) do
	-- 	RemoveBlip(existingBlip)
	-- end
	
	-- -- Clean the blip table
	-- blipsCops = {}

	-- -- Enable blip?
	-- if Config.MaxInService ~= -1 and not playerInService then
	-- 	return
	-- end

	-- if not Config.EnableJobBlip then
	-- 	return
	-- end
	
	-- -- Is the player a cop? In that case show all the blips for other cops
	-- if PlayerData.job ~= nil and PlayerData.job.name == 'ammu' then
	-- 	ESX.TriggerServerCallback('esx_society:getOnlILovePizzainePlayers', function(players)
	-- 		for i=1, #players, 1 do
	-- 			if players[i].job.name == 'ammu' then
	-- 				local id = GetPlayerFromServerId(players[i].source)
	-- 				if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= PlayerPedId() then
	-- 					createBlip(id)
	-- 				end
	-- 			end
	-- 		end
	-- 	end)
	-- end

end)

AddEventHandler('playerSpawned', function(spawn)
	isDead = false
	TriggerEvent('esx_ammujob:unrestrain')
	
	if not hasAlreadyJoined then
		TriggerServerEvent('esx_ammujob:spawned')
	end
	hasAlreadyJoined = true
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('esx_ammujob:unrestrain')
		TriggerEvent('esx_phone:removeSpecialContact', 'ammu')

		if Config.MaxInService ~= -1 then
			TriggerServerEvent('esx_service:disableService', 'ammu')
		end

		if Config.EnableHandcuffTimer and HandcuffTimer.Active then
			ESX.ClearTimeout(HandcuffTimer.Task)
		end
	end
end)

-- handcuff timer, unrestrain the player after an certain amount of time
function StartHandcuffTimer()
	if Config.EnableHandcuffTimer and HandcuffTimer.Active then
		ESX.ClearTimeout(HandcuffTimer.Task)
	end

	HandcuffTimer.Active = true

	HandcuffTimer.Task = ESX.SetTimeout(Config.HandcuffTimer, function()
		ESX.ShowNotification(_U('unrestrained_timer'))
		TriggerEvent('esx_ammujob:unrestrain')
		HandcuffTimer.Active = false
	end)
end

-- TODO
--   - return to garage if owned
--   - message owner that his vehicle has been impounded
function ImpoundVehicle(vehicle)
	--local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
	ESX.Game.DeleteVehicle(vehicle) 
	ESX.ShowNotification(_U('impound_successful'))
	CurrentTask.Busy = false
end
