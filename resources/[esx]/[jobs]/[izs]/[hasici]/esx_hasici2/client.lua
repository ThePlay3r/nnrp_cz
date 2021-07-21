local jobName                   = ''
local jobGrade                  = ''

local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local HasAlreadyEnteredMarker = false
local LastZone = nil

local IsFarming = false

local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	jobName = xPlayer.job.name
	jobGrade = xPlayer.job.grade_name
	TriggerEvent('esx_hasici2:handleBlips', jobName)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    jobName = job.name
	jobGrade = job.grade_name
	TriggerEvent('esx_hasici2:handleBlips', jobName)
end)


AddEventHandler('esx_hasici2:hasEnteredMarker', function(zone, data)
	if zone == 'Crafting' then
		CurrentAction     = 'craft'
		CurrentActionMsg  = 'Stiskni ~INPUT_CONTEXT~ pro vyrobeni hasiciho pristroje'
		CurrentActionData = {}
	end

	if zone == 'Sell' then
		CurrentAction     = 'sell_products'
		CurrentActionMsg  = 'Stiskni ~INPUT_CONTEXT~ pro zahajeni prodeje'
		CurrentActionData = {}
	end    

	if zone == 'Vaults' or zone == 'Vaults2' then
		CurrentAction     = 'menu_vault'
		CurrentActionMsg  = _U('open_vault')
		CurrentActionData = {}
	end

	if zone == 'CarSpawn' then
		CurrentAction     = 'carspawn'
		CurrentActionMsg  = 'Stiskni ~INPUT_CONTEXT~ pro vytahnuti lode'
		CurrentActionData = {}
	end

	if zone == 'CarDel' then
		CurrentAction     = 'cardele'
		CurrentActionMsg  = 'Stiskni ~INPUT_CONTEXT~ pro uklizeni lode'
		CurrentActionData = {}
	end

	if zone == 'Products' then
		CurrentAction     = 'menu_farming'
		CurrentActionMsg  = 'Stiskni ~INPUT_CONTEXT~ pro zahajeni sberu'
		CurrentActionData = {data = data}
	end
end)

AddEventHandler('esx_hasici2:hasExitedMarker', function(zone)
	CurrentAction = nil
	IsFarming = false
	TriggerServerEvent('esx_hasici2:stopFarming')
end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))

		for k,v in pairs(Config.Zones) do
			if jobName == 'hasici' then
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.MarkersDrawDistance) then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, false, 2, false, false, false, false)
				end
			end
		end

		for k,v in pairs(Config.Products) do
			if jobName == 'hasici' then
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

		if jobName == 'hasici' then
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
				TriggerEvent('esx_hasici2:hasEnteredMarker', currentZone, currentIndex)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_hasici2:hasExitedMarker', LastZone)
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

			if IsControlJustReleased(0,  Config.Keys['E']) and jobName == 'hasici' then
				if CurrentAction == 'sell_products' then
					TriggerServerEvent('esx_hasici2:startSell')
				end

				if CurrentAction == 'menu_vault' then
					TriggerEvent('esx_hasici2:openVaultMenu')
				end

				if CurrentAction == 'craft' then
					TriggerServerEvent('esx_hasicijob:craftHasicak')
				end

				if CurrentAction == 'carspawn' then
					local playerPed = GetPlayerPed(-1)
					ESX.Game.SpawnVehicle('defender', {
						x = -813.66,
						y = -1509.62,
						z = 0.1
					  }, 123.24, function(vehicle)
						TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1) -- teleport into vehicle
					end)
				end

				if CurrentAction == 'cardele' then
					local playerPed = GetPlayerPed(-1)
					if IsPedInAnyVehicle(playerPed,  false) then
						local vehicle = GetVehiclePedIsIn(playerPed,  false)
				
						ESX.Game.DeleteVehicle(vehicle)
						SetEntityCoords(playerPed, -781.92, -1493.04, 1.54)
					end
				end
				
				if CurrentAction == 'menu_farming' then
					IsFarming = true
					TriggerServerEvent('esx_hasici2:startFarming', CurrentActionData.data)
				end
				
				CurrentAction = nil
			end
		end
	end
end)

AddEventHandler('esx_hasici2:openVaultMenu', function()
	local elements = {
		{label = _U('get_object'), value = 'get_stock'},
		{label = _U('put_object'), value = 'put_stock'},
		{label = 'Vytahnout zbrane', value = 'get_weapon'},
		{label = 'Vlozit zbrane', value = 'put_weapon'},
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'sklad',
		{
			title    = 'Sklad',
			align    = 'left',
			elements = elements,
		},
		function(data, menu)
			if data.current.value == 'put_stock' then
				OpenPutFridgeStocksMenu()
			end

			if data.current.value == 'get_stock' then
				OpenGetFridgeStocksMenu()
			end
			if data.current.value == 'get_weapon' then
				OpenGetWeaponMenu()
			end
	
			if data.current.value == 'put_weapon' then
				OpenPutWeaponMenu()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end)

function OpenGetFridgeStocksMenu()

	ESX.TriggerServerCallback('esx_hasici2:getFridgeStockItems', function(items)
		local elements = {}

		for i=1, #items, 1 do
			if items[i].count > 0 then
				table.insert(elements, {label = items[i].label .. ' ' .. 'x' .. items[i].count, value = items[i].name})
			end
		end

		table.sort(elements, function(a, b)
			return a.label < b.label
		end)

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'sklad_menu',
			{
				title    = 'Sklad',
				align    = 'left',
				elements = elements
			},
			function(data, menu)

				local itemName = data.current.value

				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'fridge_menu_get_item_count',
					{
						title = _U('quantity')
					},
					function(data2, menu2)

						local count = tonumber(data2.value)

						if count == nil then
							ESX.ShowNotification(_U('invalid_quantity'))
						else
							menu2.close()
							menu.close()
							TriggerServerEvent('esx_hasici2:getFridgeStockItem', itemName, count)
							OpenGetFridgeStocksMenu()
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

function OpenPutFridgeStocksMenu()
    ESX.TriggerServerCallback('esx_hasici2:getPlayerInventory', function(inventory)
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
			'default', GetCurrentResourceName(), 'sklad_menu',
			{
				title    = 'Sklad',
				align    = 'left',
				elements = elements
			},
			function(data, menu)
				local itemName = data.current.value

				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'fridge_menu_put_item_count',
					{
						title = _U('quantity')
					},
					function(data2, menu2)

						local count = tonumber(data2.value)

						if count == nil then
							ESX.ShowNotification(_U('invalid_quantity'))
						else
							menu2.close()
							menu.close()
							TriggerServerEvent('esx_hasici2:putFridgeStockItems', itemName, count)
							OpenPutFridgeStocksMenu()
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

function OpenGetWeaponMenu()

	ESX.TriggerServerCallback('esx_hasici2:getArmoryWeapons', function(weapons)
  
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
  
		  ESX.TriggerServerCallback('esx_hasici2:removeArmoryWeapon', function()
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
  
		ESX.TriggerServerCallback('esx_hasici2:addArmoryWeapon', function()
		  OpenPutWeaponMenu()
		end, data.current.value)
  
	  end,
	  function(data, menu)
		menu.close()
	  end
	)
  
end