local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

function discordAnnounceLog (source, society, text)
	local time = os.date("%d/%m/%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. ' [' .. society .. '] ' .. name .. ' - ' .. identifier[1] .. ' : ' .. text
	local url = "https://discordapp.com/api/webhooks/702568339238551592/O-4YXStZS50zfGojzMvzPZg4y5LEBzuV-G_4Mp2-aQotWBoIpMCERip14ElhM5ev16Q2"
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end

local AnnouncesHistory = {}
local LastAnnounce = {}

RegisterServerEvent('nnannounces:sendAnnounce')
AddEventHandler("nnannounces:sendAnnounce", function(label, text, job, color)
	local _source = source
	local time = os.time()

	table.insert(AnnouncesHistory, {label = label, text = text, color = color, timestamp = time, time = os.date("%X", time)})

	if LastAnnounce[job] then
		if time <= LastAnnounce[job] then
			TriggerClientEvent('esx:showNotification', _source, 'Musis pockat min. 5 minut pred odeslanim dalsiho oznameni')
		else
			LastAnnounce[job] = time + 300
			local playerId = source
			TriggerClientEvent('nnannounces:sendAnnounce', -1, label, text, color)
			discordAnnounceLog(playerId, label, text)
		end
	else
		LastAnnounce[job] = time + 300
		local playerId = source
		TriggerClientEvent('nnannounces:sendAnnounce', -1, label, text, color)
		discordAnnounceLog(playerId, label, text)
	end
end)

ESX.RegisterServerCallback('nnannounces:getAnnouncesHistory', function(source, cb)
	cb(AnnouncesHistory)
end)