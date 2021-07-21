local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

AddEventHandler('esx_wcorpjob:openVaultMenu', function(jobGrade)
	local elements = {
		{label = _U('get_object'), value = 'get_stock'},
		{label = _U('put_object'), value = 'put_stock'},
		{label = 'Vlozit zbrane', value = 'put_weapon'},
	}

	if jobGrade ~= 'newbie' and jobGrade ~= 'expert' then
		table.insert(elements, {label = _U('get_object'), value = 'get_stock'})
	end

	if jobGrade == 'boss' or jobGrade == 'lowerboss1' or jobGrade == 'leader' then
		table.insert(elements, {label = 'Vytahnout zbrane', value = 'get_weapon'})
	end

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

	ESX.TriggerServerCallback('esx_wcorpjob:getFridgeStockItems', function(items)
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
							TriggerServerEvent('esx_wcorpjob:getFridgeStockItem', itemName, count)
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
    ESX.TriggerServerCallback('esx_wcorpjob:getPlayerInventory', function(inventory)
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
							TriggerServerEvent('esx_wcorpjob:putFridgeStockItems', itemName, count)
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

	ESX.TriggerServerCallback('esx_weaponscorpjob:getArmoryWeapons', function(weapons)
  
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
  
		  ESX.TriggerServerCallback('esx_weaponscorpjob:removeArmoryWeapon', function()
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
  
		ESX.TriggerServerCallback('esx_weaponscorpjob:addArmoryWeapon', function()
		  OpenPutWeaponMenu()
		end, data.current.value)
  
	  end,
	  function(data, menu)
		menu.close()
	  end
	)
  
end