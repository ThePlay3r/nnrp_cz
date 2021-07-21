local logEnabled = true

RegisterServerEvent('3ddo:shareDisplay')
AddEventHandler('3ddo:shareDisplay', function(text, isPlayerMessage)
	TriggerClientEvent('3ddo:triggerDisplay', -1, text, source)
	if logEnabled and isPlayerMessage then
		discordLog(text, source)
	end
end)

function discordLog(text, source)
	local time = os.date("%d/%m/%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. text
	local url = "https://discordapp.com/api/webhooks/702566573717717133/jBCmj1kD3nxq809t5AnogQoFMXxcxfgDAd4k8Qs499-zzhKS-2-tGlBnyeK6yuEd5YQR"
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end