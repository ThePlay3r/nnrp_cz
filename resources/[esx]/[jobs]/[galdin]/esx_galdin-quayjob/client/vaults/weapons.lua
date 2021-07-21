local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

function OpenGetWeaponMenu ()
	ESX.TriggerServerCallback('esx_galdinjob:getVaultWeapons', function(weapons)
		local elements = {}

		for i=1, #weapons, 1 do
			if weapons[i].count > 0 then
				table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
			end
		end

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'vault_get_weapon',
			{
				title    = _U('get_weapon_menu'),
				align    = 'left',
				elements = elements,
			},
			function(data, menu)

				menu.close()

				ESX.TriggerServerCallback('esx_galdinjob:removeVaultWeapon', function()
					OpenGetWeaponMenu()
				end, data.current.value)

			end,
			function(data, menu)
				menu.close()
			end
		)
	end)
end

AddEventHandler('esx_galdinjob:openGetWeaponMenu', function()
	OpenGetWeaponMenu()
end)

function OpenPutWeaponMenu()
	local elements   = {}
	local playerPed  = GetPlayerPed(-1)
	local weaponList = ESX.GetWeaponList()

	for i = 1, #weaponList, 1 do
		local weaponHash = GetHashKey(weaponList[i].name)

		if HasPedGotWeapon(playerPed,  weaponHash,  false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
			local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
			table.insert(elements, {label = weaponList[i].label, value = weaponList[i].name})
		end
	end

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vault_put_weapon',
		{
			title    = _U('put_weapon_menu'),
			align    = 'left',
			elements = elements,
		},
		function(data, menu)
			menu.close()

			ESX.TriggerServerCallback('esx_galdinjob:addVaultWeapon', function()
				OpenPutWeaponMenu()
			end, data.current.value)
		end,
		function(data, menu)
			menu.close()
		end
	)
end

AddEventHandler('esx_galdinjob:openPutWeaponMenu', function()
	OpenPutWeaponMenu()
end)