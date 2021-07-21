local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

AddEventHandler('esx_kosteljob:openVaultMenu', function()
	local elements = {
		{label = _U('get_object'), value = 'get_stock'},
		{label = _U('put_object'), value = 'put_stock'},
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
		end,
		function(data, menu)
			menu.close()
		end
	)
end)

function OpenGetFridgeStocksMenu()

	ESX.TriggerServerCallback('esx_kosteljob:getFridgeStockItems', function(items)
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
							TriggerServerEvent('esx_kosteljob:getFridgeStockItem', itemName, count)
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
    ESX.TriggerServerCallback('esx_kosteljob:getPlayerInventory', function(inventory)
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
							TriggerServerEvent('esx_kosteljob:putFridgeStockItems', itemName, count)
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