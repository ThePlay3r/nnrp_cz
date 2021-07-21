RegisterNetEvent('gpsPhone:sendGPS')
AddEventHandler('gpsPhone:sendGPS', function(number)
	local WaypointHandle = GetFirstBlipInfoId(8)

	if DoesBlipExist(WaypointHandle) then
		local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)
		TriggerServerEvent('gcPhone:sendMessage', number, "GPS: " .. waypointCoords.x .. ", " .. waypointCoords.y)
		TriggerEvent('chat:addMessage', { args = { '^1[GPS]: ^0GPS odeslana.' } })
	else
		TriggerEvent('chat:addMessage', { args = { '^1[GPS]: ^0Musis nejdriv umistit waypoint na mapu.' } })
	end
end)