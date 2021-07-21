local adminPos = {}
local ESX = nil
local adminsHidden = {}

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

-- Report to admins
TriggerEvent('es:addCommand', 'report', function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, {
		args = {"^1REPORT", " (^2" .. GetPlayerName(source) .. " | " .. source .. "^0) " .. table.concat(args, " ")}
	})
    
    local msg = ("Hrac %s (ID: %s) napsal report: %s"):format(GetPlayerName(source), source, table.concat(args, " "))
    local url = 'https://discordapp.com/api/webhooks/704758342639157290/Orli8xiRKHN_-DktuOBAvkKc7XfMfQTZold_ajea2lhcbegydEFkkLYaDh3SdGhhwBCk'
    sendLogToDiscordWithCustomUrl(msg, url)

	TriggerEvent("es:getPlayers", function(pl)
		for k,v in pairs(pl) do
			TriggerEvent("es:getPlayerFromId", k, function(user)
				if (user.getPermissions() > 0 and k ~= source) then
					local xPlayer = ESX.GetPlayerFromId(k)
					local identifier = xPlayer.identifier

					if adminsHidden[identifier] == true then
					else
						TriggerClientEvent('chat:addMessage', k, {
							args = {"^1REPORT", " (^2" .. GetPlayerName(source) .." | "..source.."^0) " .. table.concat(args, " ")}
						})

						TriggerClientEvent('chat:addMessage', k, {
							args = {"^1REPORT: ^0Napis ^3/resit " .. source .. " ^0pro zahajeni reseni reportu."}
						})
					end
				end
			end)
		end
	end)
end, {help = "Nahlasit nejaky problem", params = {{name = "report", help = "Co se stalo?"}}})

TriggerEvent('es:addGroupCommand', 'mutereps', "helper", function(source, args, user)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier

	if adminsHidden[identifier] and adminsHidden[identifier] == true then
		adminsHidden[identifier] = false
		xPlayer.showNotification("Zapnul/a sis reporty")
	else
		adminsHidden[identifier] = true
		xPlayer.showNotification("Vypnul/a sis reporty")
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end, {help = 'vypne/zapne hlaseni reportu'})

function resitCommand (source, args)
	if(tonumber(args[1]) and GetPlayerName(tonumber(args[1])))then
		local playerId = tonumber(args[1])
		local xPlayer = ESX.GetPlayerFromId(source)
		adminPos[xPlayer.identifier] = {
			x = xPlayer.getCoords().x,
			y = xPlayer.getCoords().y,
			z = xPlayer.getCoords().z,
			playerId = playerId,
		}
		
		
		TriggerClientEvent("sendMessageAdmin", -1, source, GetPlayerName(source), "SEL RESIT PROBLEM HRACE ID: " .. playerId)

		local msg = ("Hrac %s (ID: %s) SEL RESIT PROBLEM HRACE ID: %s"):format(GetPlayerName(source), source, playerId)
		local url = 'https://discordapp.com/api/webhooks/704758342639157290/Orli8xiRKHN_-DktuOBAvkKc7XfMfQTZold_ajea2lhcbegydEFkkLYaDh3SdGhhwBCk'
		sendLogToDiscordWithCustomUrl(msg, url)

		TriggerEvent('relisoft_tag:turnTagOn', source)

		-- User permission check
		TriggerEvent("es:getPlayerFromId", playerId, function(target)
			if(target)then

				TriggerClientEvent('nnadmin:teleportUser', source, target.getCoords().x, target.getCoords().y, target.getCoords().z)

				TriggerClientEvent('chat:addMessage', playerId, { args = {"^1REPORT", "Admin ^2" .. GetPlayerName(source) .. " ^0prisel vyresit tvuj problem."} })
			end
		end)
	end
	-- port
end

TriggerEvent('es:addGroupCommand', 'resit', "helper", function(source, args, user)
	resitCommand(source ,args)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end, {help = 'resit', params = {{name = 'id'}}})

function Vyreseno(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	if adminPos[xPlayer.identifier] then
		local target = adminPos[xPlayer.identifier]
		adminPos[xPlayer.identifier] = nil
		TriggerClientEvent("sendMessageAdmin", -1, source, GetPlayerName(source), "DORESIL PROBLEM HRACE ID: " .. target.playerId)
		TriggerEvent('relisoft_tag:turnTagOff', source)
		TriggerClientEvent('nnadmin:teleportUser', source, target.x, target.y, target.z)
	end
end

RegisterServerEvent('nnadmin:callResit')
AddEventHandler('nnadmin:callResit', function(target)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local group = xPlayer.getGroup()
	local args = {}
	table.insert(args, target)

	if group == 'superadmin' or group == 'admin' or group == 'mod' or group =='helper' then
		resitCommand(_source, args)
	end
end)

RegisterServerEvent('nnadmin:callVyreseno')
AddEventHandler('nnadmin:callVyreseno', function()
	local _source = source
	Vyreseno(_source)
end)

TriggerEvent('es:addGroupCommand', 'vyreseno', "helper", function(source, args, user)
	Vyreseno(source)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end, {help = 'vyreseno'})