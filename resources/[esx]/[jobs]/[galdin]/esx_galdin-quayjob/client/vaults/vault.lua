local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

AddEventHandler('esx_galdinjob:openVaultMenu', function()
	local elements = {
		{label = _U('get_weapon'), value = 'get_weapon'},
		{label = _U('put_weapon'), value = 'put_weapon'},
		{label = _U('get_object'), value = 'get_stock'},
		{label = _U('put_object'), value = 'put_stock'}
	}
	
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vault',
		{
			title    = _U('vault'),
			align    = 'left',
			elements = elements,
		},
		function(data, menu)
			if data.current.value == 'get_weapon' then
				TriggerEvent('esx_galdinjob:openGetWeaponMenu')
			end

			if data.current.value == 'put_weapon' then
				TriggerEvent('esx_galdinjob:openPutWeaponMenu')
			end

            if data.current.value == 'put_stock' then
                TriggerEvent('esx_galdinjob:openPutStocksMenu')
			end

			if data.current.value == 'get_stock' then
				TriggerEvent('esx_galdinjob:openGetStocksMenu')
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end)