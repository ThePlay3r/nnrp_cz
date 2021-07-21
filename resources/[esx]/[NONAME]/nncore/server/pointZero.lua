local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

TriggerEvent('es:addGroupCommand', 'pzero', 'user', function(source, args, user)
	local xPlayer = ESX.GetPlayerFromId(source)
	local lastPosition = xPlayer.getLastPosition()
	TriggerClientEvent("nncore:getFromPointZero", source, lastPosition)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'Zkusi hrace vratit na puvodni lokaci'})