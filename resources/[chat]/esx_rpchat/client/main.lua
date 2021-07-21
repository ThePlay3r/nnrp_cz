RegisterNetEvent('esx_rpchat:sendProximityMessage')
AddEventHandler('esx_rpchat:sendProximityMessage', function(playerId, title, message, color)
	local player = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local playerPed, targetPed = GetPlayerPed(player), GetPlayerPed(target)
	local playerCoords, targetCoords = GetEntityCoords(playerPed), GetEntityCoords(targetPed)
	local distanceBetweenCoords = GetDistanceBetweenCoords(playerCoords, targetCoords, true)

	if target == player or distanceBetweenCoords < 19.999 then
		TriggerEvent('chat:addMessage', {args = {title, message}, color = color})
	end
end)