RegisterNetEvent('nnadmin:kill')
AddEventHandler('nnadmin:kill', function()
	SetEntityHealth(PlayerPedId(), 0)
end)

RegisterNetEvent('nnadmin:slap')
AddEventHandler('nnadmin:slap', function()
	local ped = PlayerPedId()

	ApplyForceToEntity(ped, 1, 9500.0, 3.0, 7100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
end)