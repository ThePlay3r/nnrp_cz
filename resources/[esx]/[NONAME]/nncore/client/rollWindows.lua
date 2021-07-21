local windowdown = {}

RegisterNetEvent("RollWindow")
AddEventHandler('RollWindow', function()
    local playerPed = GetPlayerPed(-1)
    if IsPedInAnyVehicle(playerPed, false) then
		local playerCar = GetVehiclePedIsIn(playerPed, false)
		if ( GetPedInVehicleSeat( playerCar, -1 ) == playerPed ) then 
            SetEntityAsMissionEntity( playerCar, true, true )
		
			if windowdown[playerCar] then
				RollUpWindow(playerCar, 0)
				RollUpWindow(playerCar, 1)
				TriggerServerEvent('3dme:shareDisplay', 'Zavira okna', true)
				windowdown[playerCar] = false
			else
				RollDownWindow(playerCar, 0)
				RollDownWindow(playerCar, 1)
				TriggerServerEvent('3dme:shareDisplay', 'Stahuje okna', true)
				windowdown[playerCar] = true
			end
		end
	end
end )

RegisterCommand("rollw", function(source, args, raw)
    TriggerEvent("RollWindow")
end, false)
