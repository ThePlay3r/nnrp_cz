local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) 
    ESX = obj 
end)

local function getPlayerGroup (source)
	local player = ESX.GetPlayerFromId(source)

	if player ~= nil then
        	local playerGroup = player.getGroup()

		if playerGroup ~= nil then 
			return playerGroup            
		else
			return "user"
		end
	else
		return "user"
	end
end

function sendLogToDiscordAboutChat(text, name)
	local time = os.date("%d.%m.%Y %X")
	local msg = time .. ' : ' .. name .. ' : ' .. text
	local url = 'https://discordapp.com/api/webhooks/727911575914151948/pF_-KtzsH95beWtXYraV3IGB-LkYa3rWlwGg16Hwix5Z9GaIhMciJENFKedlLxfLvcl4'
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end

TriggerEvent('es:addCommand', 'a', function(source, args, user)
	local group = getPlayerGroup(source)
	local name = GetPlayerName(source)

	if group == 'admin' or group == 'superadmin' or group == 'mod' or group == 'helper' then
		sendLogToDiscordAboutChat(table.concat(args, " "), name)
		TriggerClientEvent("sendMessageAdmin", -1, source, name, table.concat(args, " "))
	end	
end, {help = 'Chat Admins.'})

AddEventHandler('es:playerLoaded', function(Source, user)
	TriggerClientEvent('nnadmin:setGroup', Source, user.getGroup())
end)