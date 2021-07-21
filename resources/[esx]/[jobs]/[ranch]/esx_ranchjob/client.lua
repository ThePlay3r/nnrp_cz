local jobName                   = ''
local jobGrade                  = ''

local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local HasAlreadyEnteredMarker = false
local LastZone = nil

local IsFarming = false
local IsTransforming = false

local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	jobName = xPlayer.job.name
	jobGrade = xPlayer.job.grade_name
	TriggerEvent('esx_ranchjob:handleBlips', jobName)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    jobName = job.name
	jobGrade = job.grade_name
	TriggerEvent('esx_ranchjob:handleBlips', jobName)
end)


AddEventHandler('esx_ranchjob:hasEnteredMarker', function(zone, data)
	if zone == 'BossActions' and jobGrade == 'boss' then
		CurrentAction     = 'menu_boss_actions'
		CurrentActionMsg  = _U('open_bossmenu')
		CurrentActionData = {}
	end

	if zone == 'Cloakrooms' then
		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}
	end

	if zone == 'Vaults' then
		CurrentAction     = 'menu_vault'
		CurrentActionMsg  = _U('open_vault')
		CurrentActionData = {}
	end

	if zone == 'Armory' and jobGrade == 'boss' then
		CurrentAction     = 'menu_armory'
		CurrentActionMsg  = 'Stiskni ~INPUT_CONTEXT~ pro otevreni skladu'
		CurrentActionData = {}
	end

	if zone == 'Sell' then
		CurrentAction     = 'sell_products'
		CurrentActionMsg  = 'Stiskni ~INPUT_CONTEXT~ pro zahajeni prodeje'
		CurrentActionData = {}
	end    

	if zone == 'Vehicles' then
		CurrentAction     = 'menu_vehicle_spawner'
		CurrentActionMsg  = _U('vehicle_spawner')
		CurrentActionData = {}
	end

	if zone == 'Products' then
		CurrentAction     = 'menu_farming'
		CurrentActionMsg  = 'Stiskni ~INPUT_CONTEXT~ pro zahajeni dojeni'
		CurrentActionData = {data = data}
	end

	if zone == 'Transform' or zone == 'Transform2' or zone == 'Transform3' or zone == 'Transform4' then
		CurrentAction     = 'menu_transform'
		CurrentActionMsg  = 'Stiskni ~INPUT_CONTEXT~ pro vyrobu mlecnych vyrobku'
		CurrentActionData = {zone = zone}
	end
end)

AddEventHandler('esx_ranchjob:hasExitedMarker', function(zone)
	CurrentAction = nil
	IsFarming = false
	IsTransforming = false
	TriggerServerEvent('esx_ranchjob:stopFarming')
	TriggerServerEvent('esx_ranchjob:stopTransform')

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
			if jobName == 'ranch' then
				local isAllowed = true
				if k == 'Armory' and jobGrade ~= 'boss' then
					isAllowed = false
				end
				if k == 'BossActions' and jobGrade ~= 'boss' then
					isAllowed = false
				end

				if isAllowed and (v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.MarkersDrawDistance) then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, false, 2, false, false, false, false)
				end
			end
		end

		for k,v in pairs(Config.Products) do
			if jobName == 'ranch' then
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.coords.x, v.coords.y, v.coords.z, true) < Config.MarkersDrawDistance) then
					DrawMarker(
						Config.ProductsMarker.Type, v.coords.x, v.coords.y, v.coords.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0,
						Config.ProductsMarker.Size.x, Config.ProductsMarker.Size.y, Config.ProductsMarker.Size.z,
						Config.ProductsMarker.Color.r, Config.ProductsMarker.Color.g, Config.ProductsMarker.Color.b,
						100, false, false, 2, false, false, false, false)
				end
			end
		end
	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Wait(0)

		if jobName == 'ranch' then
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

			for k, v in pairs(Config.Products) do
				if(GetDistanceBetweenCoords(coords, v.coords.x, v.coords.y, v.coords.z, true) < Config.ProductsMarker.Size.x) then
					isInMarker = true
					currentZone = 'Products'
					currentIndex = v.item
				end
			end

			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker = true
				LastZone = currentZone
				TriggerEvent('esx_ranchjob:hasEnteredMarker', currentZone, currentIndex)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_ranchjob:hasExitedMarker', LastZone)
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
					TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_ranch', _U('billing'), amount)
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
	local elements = {}

	table.insert(elements, {label = _U('billing'), value = 'billing'})

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'ranch_actions',
		{
			title    = _U('ranch'),
			align    = 'left',
			elements = elements
		},
		function(data, menu)
			if data.current.value == 'billing' then
				OpenBillingMenu()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function OpenArmoryMenu()
    local elements = {}
    if jobGrade == 'boss' then
		table.insert(elements, {label = 'Vytahnout zbrane', value = 'get_weapon'})
		table.insert(elements, {label = 'Vlozit zbrane', value = 'put_weapon'})
		table.insert(elements, {label = 'Vytahnout predmet', value = 'get_stock'})
      	table.insert(elements, {label = 'Vlozit predmet', value = 'put_stock'})
	end
	
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'armory',
      {
        title    = 'Sklad',
        align    = 'top-left',
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
			OpenPutStocksMenu()
		 end
 
		 if data.current.value == 'get_stock' then
			OpenGetStocksMenu()
		 end
      end,
      function(data, menu)

        menu.close()

        CurrentAction     = 'menu_armory'
        CurrentActionMsg  = 'Stiskni ~INPUT_CONTEXT~ pro otevreni skladu'
        CurrentActionData = {}

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
		align    = 'top-left',
		elements = elements,
	  },
	  function(data, menu)
  
		menu.close()
  
		ESX.TriggerServerCallback('esx_ranchjob:addArmoryWeapon', function()
		  OpenPutWeaponMenu()
		end, data.current.value)
  
	  end,
	  function(data, menu)
		menu.close()
	  end
	)
  
  end

  function OpenGetWeaponMenu()

	ESX.TriggerServerCallback('esx_ranchjob:getArmoryWeapons', function(weapons)
  
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
		  align    = 'top-left',
		  elements = elements,
		},
		function(data, menu)
  
		  menu.close()
  
		  ESX.TriggerServerCallback('esx_ranchjob:removeArmoryWeapon', function()
			OpenGetWeaponMenu()
		  end, data.current.value)
  
		end,
		function(data, menu)
		  menu.close()
		end
	  )
  
	end)
  
  end

function OpenGetStocksMenu()
	ESX.TriggerServerCallback('esx_ranchjob:getStockItems', function(items)
    
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
  
	  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
		  title    = 'Sklad ranche',
		  elements = elements
		}, function(data, menu)
  
		  local itemName = data.current.value
  
		  ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
			  title = _U('quantity')
			}, function(data2, menu2)
  
			  local count = tonumber(data2.value)
  
			  if count == nil then
				ESX.ShowNotification(_U('invalid_quantity'))
			  else
				menu2.close()
				menu.close()
  
				TriggerServerEvent('esx_ranchjob:getStockItem', itemName, count)
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
    ESX.TriggerServerCallback('esx_ranchjob:getPlayerInventory', function(inventory)

    local elements = {}

    for i=1, #inventory.items, 1 do
      local item = inventory.items[i]

      if item.count > 0 then
        table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
      end
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
        title    = _U('inventory'),
        elements = elements
      }, function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
            title = _U('quantity')
          }, function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification(_U('invalid_quantity'))
            else
              menu2.close()
              menu.close()

              TriggerServerEvent('esx_ranchjob:putStockItems', itemName, count)
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

function openCloakroomMenu ()
	local elements = {
		{value = 'civil', label = 'Civilní oblečení'},
		{value = 'ranch_outfit', label = 'Pracovni obleceni'},
	}

	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'cloakroom',
		{
			title = _U('cloakroom'),
			algin = 'top-left',
			elements = elements
		},
		function(data, menu)
			if data.current.value == 'civil' then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					local playerPed = GetPlayerPed(-1)
					TriggerEvent('skinchanger:loadSkin', skin)
					ClearPedBloodDamage(playerPed)
					ResetPedVisibleDamage(playerPed)
					ClearPedLastWeaponDamage(playerPed)
					ResetPedMovementClipset(playerPed, 0)
				end)
			else
				TriggerEvent('skinchanger:getSkin', function(skin)
					local sex = 'male'
					if skin.sex ~= 0 then
						sex = 'female'
					end
					local clothesSkin = Config.Clothes[data.current.value][sex]
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
					
					RequestAnimSet("MOVE_M@POSH@")
					while not HasAnimSetLoaded("MOVE_M@POSH@") do
						Citizen.Wait(0)
					end
					SetPedMovementClipset(playerPed, "MOVE_M@POSH@", true)

					local playerPed = GetPlayerPed(-1)
					ClearPedBloodDamage(playerPed)
					ResetPedVisibleDamage(playerPed)
					ClearPedLastWeaponDamage(playerPed)
					ResetPedMovementClipset(playerPed, 0)
				end)
			end
			menu.close()
		end,
		function(data, menu)
			menu.close()
		end
	)
end

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction ~= nil then
			if not IsFarming and not IsTransforming then
				SetTextComponentFormat('STRING')
				AddTextComponentString(CurrentActionMsg)
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			end

			if IsControlJustReleased(0,  Config.Keys['E']) and jobName == 'ranch' then
				if CurrentAction == 'menu_cloakroom' then
					openCloakroomMenu()
				end

				if CurrentAction == 'menu_vault' then
					TriggerEvent('esx_ranchjob:openVaultMenu')
				end

				if CurrentAction == 'menu_armory' then
					OpenArmoryMenu()
				end

				if CurrentAction == 'sell_products' then
					TriggerServerEvent('esx_ranchjob:startSell')
				end
				
				if CurrentAction == 'menu_vehicle_spawner' then
					exports.nncore:OpenVehicleSpawnerMenu(Config.VehicleShopCoords, Config.SpawnPoints, Config.AuthorizedVehicles)
				end

				if CurrentAction == 'menu_farming' then
					IsFarming = true
					TriggerServerEvent('esx_ranchjob:startFarming', CurrentActionData.data)
				end

				if CurrentAction == 'menu_transform' then
					IsTransforming = true
					TriggerServerEvent('esx_ranchjob:startTransform', CurrentActionData.zone)
				end

				if CurrentAction == 'menu_boss_actions' and jobGrade == 'boss' then
					ESX.UI.Menu.CloseAll()
					local options = {}
					TriggerEvent('esx_society:openBossMenu', 'ranch', function(data, menu)
						menu.close()
						CurrentAction     = 'menu_boss_actions'
						CurrentActionMsg  = _U('open_bossmenu')
						CurrentActionData = {}
					end, options)
				end
				
				CurrentAction = nil
			end
		end

		if IsControlJustReleased(0, Config.Keys['F6']) and jobName == 'ranch' and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'ranch_actions') then
			openSocietyActionsMenu()
		end
	end
end)