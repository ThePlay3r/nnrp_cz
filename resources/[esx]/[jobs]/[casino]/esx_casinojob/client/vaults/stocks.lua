local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

function OpenGetStocksMenu ()
	ESX.TriggerServerCallback('esx_casinojob:getStockItems', function(items)

		local elements = {}

		for i=1, #items, 1 do
			table.insert(elements, {label = items[i].label .. 'x' .. items[i].count, originalLabel = items[i].label, count = items[i].count, index = i, value = items[i].name})
		end

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'stocks_menu',
			{
				title    = _U('casino_stock'),
				align 	= 'left',
				elements = elements
			},
			function(data, menu)
				local itemName = data.current.value

				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count',
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
							TriggerServerEvent('esx_casinojob:getStockItem', itemName, count)
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

AddEventHandler('esx_casinojob:openGetStocksMenu', function()
	OpenGetStocksMenu()
end)

function OpenPutStocksMenu()
	ESX.TriggerServerCallback('esx_casinojob:getPlayerInventory', function(inventory)
		local elements = {}

		for i=1, #inventory.items, 1 do

			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
			end

		end

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'stocks_menu',
			{
				title    = _U('inventory'),
				align 	= 'left',
				elements = elements
			},
			function(data, menu)

				local itemName = data.current.value

				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count',
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

							TriggerServerEvent('esx_casinojob:putStockItems', itemName, count)
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

AddEventHandler('esx_casinojob:openPutStocksMenu', function()
   OpenPutStocksMenu()
end)