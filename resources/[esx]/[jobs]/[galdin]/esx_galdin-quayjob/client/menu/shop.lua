local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

AddEventHandler('esx_galdinjob:openShopMenu', function(zone)
    local elements = {}
	for i=1, #Config.Zones[zone].Items, 1 do
		local item = Config.Zones[zone].Items[i]

		table.insert(elements, {
			label = item.label  ..  ' '  .. item.price .. ' $',
			realLabel = item.label,
			value = item.name,
			price = item.price
		})
	end

	table.sort(elements, function(a, b)
		return a.label < b.label
	end)

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'galdin_shop',
		{
			title    = _U('shop'),
			align = 'left',
			elements = elements
		},
		function(data, menu)
			TriggerServerEvent('esx_galdinjob:buyItem', data.current.value, data.current.price, data.current.realLabel)
		end,
		function(data, menu)
			menu.close()
		end
	)
end)