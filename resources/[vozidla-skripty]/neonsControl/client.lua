local Keys = {
	['LEFTSHIFT'] = 21, ['H'] = 74,
}

function toggleNeons (vehicle)
	local hasNeonsOn = IsVehicleNeonLightEnabled(vehicle, 0)

	SetVehicleNeonLightEnabled(vehicle, 0, not hasNeonsOn)
	SetVehicleNeonLightEnabled(vehicle, 1, not hasNeonsOn)
	SetVehicleNeonLightEnabled(vehicle, 2, not hasNeonsOn)
	SetVehicleNeonLightEnabled(vehicle, 3, not hasNeonsOn)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local vehicle = GetVehiclePedIsIn(playerPed, false)

		if IsPedSittingInAnyVehicle(playerPed) and IsControlJustPressed(0,  Keys['H']) and IsControlPressed(0, Keys['LEFTSHIFT']) then
			TriggerServerEvent('3dme:shareDisplay', "Meni viditelnost neonu", true)
			Citizen.Wait(3000)
			toggleNeons(vehicle)
		end
	end
end)