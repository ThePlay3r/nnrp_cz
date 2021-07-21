local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

AddEventHandler('esx_casinojob:openCloakroomMenu', function(jobGrade)
	local elements = {
		{label = _U('citizen_wear'), value = 'citizen_wear'},
	}

	for k, v in ipairs(Config.Clothes.availableClothes[jobGrade]) do
		table.insert(elements, {
			label = _U(v .. '_outfit'),
			value = v,
		})
	end

	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'cloakroom',
		{
			title = _U('cloakroom'),
			algin = 'top-left',
			elements = elements,
		},
		function(data, menu)
			if data.current.value == 'citizen_wear' then
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
					local clothesSkin = Config.Clothes[sex][data.current.value]
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
		end,
		function(data, menu)
			menu.close()
		end
	)
end)