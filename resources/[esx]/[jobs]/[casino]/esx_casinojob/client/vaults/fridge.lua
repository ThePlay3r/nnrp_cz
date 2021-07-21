local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

AddEventHandler('esx_casinojob:openFridgeMenu', function()
	local elements = {
		{label = _U('get_object'), value = 'get_stock'},
		{label = _U('put_object'), value = 'put_stock'},
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'fridge',
		{
			title    = _U('fridge'),
			align    = 'left',
			elements = elements,
		},
		function(data, menu)
			if data.current.value == 'buy_pochutina' then
				TriggerEvent('esx_casinojob:openShopMenu', 'Pochutiny')
			end

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

function getIndexOfItems (values)
	local index={}
	for k,v in pairs(values) do
	   index[v.originalLabel] = k
	end
	return index
end

function OpenGetFridgeStocksMenu()

	ESX.TriggerServerCallback('esx_casinojob:getFridgeStockItems', function(items)
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
			return a.originalLabel < b.originalLabel
		end)

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'fridge_menu',
			{
				title    = _U('casino_fridge_stock'),
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
							TriggerServerEvent('esx_casinojob:getFridgeStockItem', itemName, count)
							local index = getIndexOfItems(elements)[data.current.originalLabel]
							menu.setElement(index, 'label', data.current.originalLabel .. ' x' .. data.current.count - count)
							menu.setElement(index, 'count', data.current.count - count)
							menu.refresh()
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
    ESX.TriggerServerCallback('esx_casinojob:getPlayerInventory', function(inventory)
		local elements = {}

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type = 'item_standard',
					value = item.name,
					originalLabel = item.label,
					count = item.count,
					index = i,
				})
			end
		end

		table.sort(elements, function(a, b)
			return a.originalLabel < b.originalLabel
		end)

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'fridge_menu',
			{
				title    = _U('fridge_inventory'),
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
							
							TriggerServerEvent('esx_casinojob:putFridgeStockItems', itemName, count)
							
							local index = getIndexOfItems(elements)[data.current.originalLabel]
							menu.setElement(index, 'label', data.current.originalLabel .. ' x' .. data.current.count - count)
							menu.setElement(index, 'count', data.current.count - count)
							menu.refresh()
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