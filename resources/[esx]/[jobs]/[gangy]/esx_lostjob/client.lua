local jobName                   = ''
local jobGrade                  = ''

local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local HasAlreadyEnteredMarker = false
local LastZone = nil
local LastEntity = nil

local IsFarming = false

local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	jobName = xPlayer.job.name
	jobGrade = xPlayer.job.grade_name
	TriggerEvent('esx_lostjob:handleBlips', jobName, jobGrade)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    jobName = job.name
	jobGrade = job.grade_name
	TriggerEvent('esx_lostjob:handleBlips', jobName, jobGrade)
end)


AddEventHandler('esx_lostjob:hasEnteredMarker', function(zone, data)
	if zone == 'BossActions' and (jobGrade == 'boss' or jobGrade == 'lowerboss1') then
		CurrentAction     = 'menu_boss_actions'
		CurrentActionMsg  = _U('open_bossmenu')
		CurrentActionData = {}
	end

	if zone == 'Cloakrooms' then
		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}
	end

	if (zone == 'Vaults' or zone == 'Vaults2') and jobGrade ~= 'prospect' then
		CurrentAction     = 'menu_vault'
		CurrentActionMsg  = _U('open_vault')
		CurrentActionData = {}
	end
	
	if zone == 'Armory' and (jobGrade ~= 'enforcer' and jobGrade ~= 'roadcapitan' and jobGrade ~= 'tailgunner' and jobGrade ~= 'prospect') then
		CurrentAction     = 'menu_armory'
		CurrentActionMsg  = _U('open_armory')
		CurrentActionData = {}
	end

	if zone == 'Vehicles' then
		CurrentAction     = 'menu_vehicle_spawner'
		CurrentActionMsg  = _U('vehicle_spawner')
		CurrentActionData = {}
	end
end)

AddEventHandler('esx_lostjob:hasExitedMarker', function(zone)
	CurrentAction = nil
	IsFarming = false
	TriggerServerEvent('esx_lostjob:stopFarming')

	if zone ~= 'Vehicles' then
		ESX.UI.Menu.CloseAll()
	end
end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))

		for k,v in pairs(Config.Zones) do
			if jobName == 'lost' then
				local isAllowed = true
				if k == 'Armory' and (jobGrade == 'enforcer' or jobGrade == 'roadcapitan' or jobGrade == 'tailgunner' or jobGrade == 'prospect') then
					isAllowed = false
				end
				if (k == 'Vaults' or k == 'Vaults2') and jobGrade == 'prospect' then
					isAllowed = false
				end

				if isAllowed and (v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.MarkersDrawDistance) then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, false, 2, false, false, false, false)
				end
			end
		end
	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Wait(0)

		if jobName == 'lost' then
			local coords = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker = false
			local currentZone = nil
			local currentIndex = nil

			if CurrentAction == nil then
				isInMarker = false
				currentZone = nil
				HasAlreadyEnteredMarker = false
			end

			for k, v in pairs(Config.Zones) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					isInMarker = true
					currentZone = k
				end
			end

			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker = true
				LastZone = currentZone
				TriggerEvent('esx_lostjob:hasEnteredMarker', currentZone, currentIndex)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_lostjob:hasExitedMarker', LastZone)
			end
		end
	end
end)

-- EVENTS
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
					TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_lost', _U('billing'), amount)
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
function openSocietyActionsMenu ()
	local elements = {
		{label = _U('billing'), value = 'billing'},
		{label = 'Prohledat', value = 'body_search'},
		{label = 'Spoutat/Odpoutat', value = 'handcuff'},
		{label = 'Prenest',      value = 'drag'},
		{label = 'Vytahnout z vozidla',  value = 'put_in_vehicle'},
		{label = 'Vlozit do vozidla', value = 'out_the_vehicle'},
		{label = 'Polozit plot', value = 'spawn_fence'},
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'lost_actions',
		{
			title    = _U('lost'),
			align    = 'left',
			elements = elements
		},
		function(data, menu)
			local player, distance = ESX.Game.GetClosestPlayer()

			if data.current.value == 'spawn_fence' then
				local model   = 'prop_fnc_omesh_02a'
				local playerPed = GetPlayerPed(-1)
				local coords  = GetEntityCoords(playerPed)
				local forward = GetEntityForwardVector(playerPed)
				local x, y, z = table.unpack(coords + forward * 1.0)

				ESX.Game.SpawnObject(model, {
					x = x,
					y = y,
					z = z
				}, function(obj)
					SetEntityHeading(obj, GetEntityHeading(playerPed))
					PlaceObjectOnGroundProperly(obj)
				end)
			end

			if data.current.value == 'billing' then
				OpenBillingMenu()
			end

			if distance ~= -1 and distance <= 3.0 then
				if data.current.value == 'body_search' then
					OpenBodySearchMenu(player)
				end

				if data.current.value == 'handcuff' then
					TriggerServerEvent('esx_gangjob:handcuff', GetPlayerServerId(player))
				end

				if data.current.value == 'drag' then
					TriggerServerEvent('esx_gangjob:drag', GetPlayerServerId(player))
				end

				if data.current.value == 'put_in_vehicle' then
					TriggerServerEvent('esx_gangjob:putInVehicle', GetPlayerServerId(player))
				end

				if data.current.value == 'out_the_vehicle' then
					TriggerServerEvent('esx_gangjob:OutVehicle', GetPlayerServerId(player))
				end
			end

		end,
		function(data, menu)
			menu.close()
		end
	)
end

function OpenGetStocksMenu()

	ESX.TriggerServerCallback('esx_lostjob:getStockItems', function(items)
  
  
	  local elements = {}
  
	  for i=1, #items, 1 do
			  if items[i].count > 0 then
				  table.insert(elements, {
					  label = items[i].label .. ' ' .. ' x' .. items[i].count,
					  value = items[i].name,
					  originalLabel = items[i].label,
					  count = items[i].count,
				  })
			  end
		  end
  
	  table.sort(elements, function(a, b)
		return a.label < b.label
	  end)
  
	  ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'stocks_menu',
		{
		  title    = 'Trezor',
		  align     = 'left',
		  elements = elements
		},
		function(data, menu)
  
		  local itemName = data.current.value
  
		  ESX.UI.Menu.Open(
			'dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count',
			{
			  title = _U('quantity'),
			  align     = 'left',
			},
			function(data2, menu2)
  
			  local count = tonumber(data2.value)
  
			  if count == nil then
				ESX.ShowNotification(_U('invalid_quantity'))
			  else
				menu2.close()
				menu.close()
				TriggerServerEvent('esx_lostjob:getStockItem', itemName, count)
				OpenGetStocksMenu()
			  end
  
			end,
			function(data2, menu2)
			  menu2.close()
			end
		  )
  
		end,
		function(data, menu)
		  menu.close()
		end
	  )
  
	end)
  
  end
  
  function OpenPutStocksMenu()
  
  ESX.TriggerServerCallback('esx_lostjob:getPlayerInventory', function(inventory)
  
	  local elements = {}
  
	  for i=1, #inventory.items, 1 do
		local item = inventory.items[i]
  
		if item.count > 0 then
		  table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
		end
	  end
  
	  table.sort(elements, function(a, b)
		return a.label < b.label
	  end)
  
	  ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'stocks_menu',
		{
		  title    = _U('inventory'),
		  align     = 'left',
		  elements = elements
		},
		function(data, menu)
  
		  local itemName = data.current.value
  
		  ESX.UI.Menu.Open(
			'dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count',
			{
			  title = _U('quantity'),
			  align     = 'left',
			},
			function(data2, menu2)
  
			  local count = tonumber(data2.value)
  
			  if count == nil then
				ESX.ShowNotification(_U('invalid_quantity'))
			  else
				menu2.close()
				menu.close()
				TriggerServerEvent('esx_lostjob:putStockItems', itemName, count)
				OpenPutStocksMenu()
			  end
  
			end,
			function(data2, menu2)
			  menu2.close()
			end
		  )
  
		end,
		function(data, menu)
		  menu.close()
		end
	  )
  
	end)
  
  end

function OpenBodySearchMenu(player)

	ESX.TriggerServerCallback('esx_gangjob:getOtherPlayerData', function(data)
  
	  local elements = {}
  
	  local blackMoney = 0
  
	  for i=1, #data.accounts, 1 do
		if data.accounts[i].name == 'black_money' then
		  blackMoney = data.accounts[i].money
		end
	  end
  
	  table.insert(elements, {
		label          = _U('confiscate_dirty') .. blackMoney,
		value          = 'black_money',
		itemType       = 'item_account',
		amount         = blackMoney
	  })
  
	  table.insert(elements, {label = '--- Armes ---', value = nil})
  
	  for i=1, #data.weapons, 1 do
		table.insert(elements, {
		  label          = _U('confiscate') .. ESX.GetWeaponLabel(data.weapons[i].name),
		  value          = data.weapons[i].name,
		  itemType       = 'item_weapon',
		  amount         = data.ammo,
		})
	  end
  
	  table.insert(elements, {label = _U('inventory_label'), value = nil})
  
	  for i=1, #data.inventory, 1 do
		if data.inventory[i].count > 0 then
		  table.insert(elements, {
			label          = _U('confiscate_inv') .. data.inventory[i].count .. ' ' .. data.inventory[i].label,
			value          = data.inventory[i].name,
			itemType       = 'item_standard',
			amount         = data.inventory[i].count,
		  })
		end
	  end
  
  
	  ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'body_search',
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
  
			TriggerServerEvent('esx_gangjob:confiscatePlayerItem', GetPlayerServerId(player), itemType, itemName, amount)
  
			OpenBodySearchMenu(player)
  
		  end
  
		end,
		function(data, menu)
		  menu.close()
		end
	  )
  
	end, GetPlayerServerId(player))
  
  end

function openCloakroomMenu ()
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'cloakroom',
		{
			title = _U('cloakroom'),
			algin = 'left',
			elements = {
				{value = 'nothing', label = 'Zadne obleceni'}
			},
		},
		function(data, menu)
			menu.close()
		end,
		function(data, menu)
			menu.close()
		end
	)
end


function OpenGetWeaponMenu()

	ESX.TriggerServerCallback('esx_lostjob:getArmoryWeapons', function(weapons)
  
	  local elements = {}
  
	  for i=1, #weapons, 1 do
		if weapons[i].count > 0 then
		  table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
		end
	  end
  
	  ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'armory_get_weapon',
		{
		  title    = _U('get_weapon_menu'),
		  align    = 'left',
		  elements = elements,
		},
		function(data, menu)
  
		  menu.close()
  
		  ESX.TriggerServerCallback('esx_lostjob:removeArmoryWeapon', function()
			OpenGetWeaponMenu()
		  end, data.current.value)
  
		end,
		function(data, menu)
		  menu.close()
		end
	  )
  
	end)
  
  end
  
  function OpenPutWeaponMenu()
  
	local elements   = {}
	local playerPed  = GetPlayerPed(-1)
	local weaponList = ESX.GetWeaponList()
  
	for i=1, #weaponList, 1 do
  
	  local weaponHash = GetHashKey(weaponList[i].name)
  
	  if HasPedGotWeapon(playerPed,  weaponHash,  false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
		local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
		table.insert(elements, {label = weaponList[i].label, value = weaponList[i].name})
	  end
  
	end
  
	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'armory_put_weapon',
	  {
		title    = _U('put_weapon_menu'),
		align    = 'left',
		elements = elements,
	  },
	  function(data, menu)
  
		menu.close()
  
		ESX.TriggerServerCallback('esx_lostjob:addArmoryWeapon', function()
		  OpenPutWeaponMenu()
		end, data.current.value)
  
	  end,
	  function(data, menu)
		menu.close()
	  end
	)
  
  end

function OpenArmoryMenu()
    local elements = {

	}
    if jobGrade == 'boss' or jobGrade == 'lowerboss1' or jobGrade == 'sgta' then
	    table.insert(elements, {label = 'Vytahnout zbrane', value = 'get_weapon'})
		table.insert(elements, {label = 'Vlozit zbrane', value = 'put_weapon'})
		table.insert(elements, {label = 'Vzit predmet', value = 'get_stock'})
		table.insert(elements, {label = 'Vlozit predmet', value = 'put_stock'})
	end
	
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'armory',
      {
        title    = 'Zbrojnice',
        align    = 'left',
        elements = elements,
      },
      function(data, menu)
	  	if data.current.value == 'get_weapon' then
        	OpenGetWeaponMenu()
        end

        if data.current.value == 'put_weapon' then
			OpenPutWeaponMenu()
		end
		if data.current.value == 'put_stock' then
			OpenPutFridgeStocksMenu('society_lost_armory')
		end

		if data.current.value == 'get_stock' then
			OpenGetFridgeStocksMenu('society_lost_armory')
		end
      end,
      function(data, menu)

        menu.close()

        CurrentAction     = 'menu_armory'
        CurrentActionMsg  = _U('open_armory')
        CurrentActionData = {}

      end
   )
end

AddEventHandler('esx_lostjob:hasEnteredEntityZone', function(entity)
	local playerPed = PlayerPedId()

	if jobName == 'lost' and not IsPedInAnyVehicle(playerPed, false) then
		CurrentAction     = 'remove_entity'
		CurrentActionMsg  = _U('press_remove_obj')
		CurrentActionData = {entity = entity}
	end
end)

AddEventHandler('esx_lostjob:hasExitedEntityZone', function(entity)
	if CurrentAction == 'remove_entity' then
		CurrentAction = nil
	end
end)


Citizen.CreateThread(function()
	local trackedEntities = {
		'prop_fnc_omesh_02a',
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
				TriggerEvent('esx_lostjob:hasEnteredEntityZone', closestEntity)
				LastEntity = closestEntity
			end
		else
			if LastEntity ~= nil then
				TriggerEvent('esx_lostjob:hasExitedEntityZone', LastEntity)
				LastEntity = nil
			end
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction ~= nil then
			if not IsFarming then
				SetTextComponentFormat('STRING')
				AddTextComponentString(CurrentActionMsg)
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			end

			if IsControlJustReleased(0,  Config.Keys['E']) and jobName == 'lost' then
				if CurrentAction == 'menu_cloakroom' then
					openCloakroomMenu()
				end

				if CurrentAction == 'menu_vault' then
					TriggerEvent('esx_lostjob:openVaultMenu')
				end

				if CurrentAction == 'menu_armory' then
					OpenArmoryMenu()
				end
				
				if CurrentAction == 'menu_vehicle_spawner' then
					exports.nncore:OpenVehicleSpawnerMenu(Config.VehicleShopCoords, Config.SpawnPoints, Config.AuthorizedVehicles)
				end

				if CurrentAction == 'menu_boss_actions' and (jobGrade == 'boss' or jobGrade == 'lowerboss1') then
					ESX.UI.Menu.CloseAll()
					local options = {}
					TriggerEvent('esx_society:openBossMenu', 'lost', function(data, menu)
						menu.close()
						CurrentAction     = 'menu_boss_actions'
						CurrentActionMsg  = _U('open_bossmenu')
						CurrentActionData = {}
					end, options)
				end
				if CurrentAction == 'remove_entity' then
					DeleteEntity(CurrentActionData.entity)
				end
				
				CurrentAction = nil
			end
		end

		if IsControlJustReleased(0, Config.Keys['F6']) and jobName == 'lost' and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'lost_actions') then
			openSocietyActionsMenu()
		end
	end
end)