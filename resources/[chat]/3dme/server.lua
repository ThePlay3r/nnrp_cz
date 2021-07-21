local logEnabled = true

RegisterServerEvent('3dme:shareDisplay')
AddEventHandler('3dme:shareDisplay', function(text, isPlayerMessage)
	TriggerClientEvent('3dme:triggerDisplay', -1, text, source)
	if logEnabled and isPlayerMessage then
		discordLog(text, source)
	end
end)

function discordLog(text, source)
	local time = os.date("%d.%m.%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. text
	local url = "https://discordapp.com/api/webhooks/702567554903965809/YN1WtZKX9U6uKRKE8LKGUvylgeMJFQOhmmUlqzmccCf2PptkisvhDmAVQHsv12QAtnj1"
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end