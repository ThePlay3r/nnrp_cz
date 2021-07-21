
AddEventHandler('es:invalidCommandHandler', function(source, command_args, user)
	CancelEvent()
	TriggerClientEvent('chat:addMessage', source, {args = {'^1SYSTEM: ', _U('unknown_command', command_args[1])}})
end)

AddEventHandler('chatMessage', function(playerId, playerName, message)
	if string.sub(message, 1, string.len('/')) ~= '/' then
		CancelEvent()
		
		TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, playerId, _U('ooc_prefix', GetPlayerName(playerId)), message, {128, 128, 128})
		discordLog(playerId, message)		
	end
end)

function discordLog (source, text)
	local time = os.date("%d/%m/%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. text
	local url = "https://discordapp.com/api/webhooks/702566727287963728/tS3JVP4PyYdYkvu3vy06OSHWvwjUogyPT0uAddlwM6IXfUZJgsAVp0FxXxhSDN3CEI_o"
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end