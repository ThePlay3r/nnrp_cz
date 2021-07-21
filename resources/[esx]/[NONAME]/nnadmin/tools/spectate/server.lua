local Spectating = {}
local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

RegisterServerEvent('es_camera:requestSpectating')
AddEventHandler('es_camera:requestSpectating', function()
	TriggerClientEvent('es_camera:onSpectate', source, Spectating)
end)

function SpectateCommand (source, args)
	local target = -1

	if args[1] ~= nil then
		target = tonumber(args[1])
	end


	if target == -1 then

		for i=1, #Spectating, 1 do
			if Spectating[i] == source then
				Spectating[i] = nil
				break
			end
		end

		TriggerClientEvent('tokovoip:setSpectating', -1, source, false)
		TriggerClientEvent('es_camera:onSpectate', -1, Spectating)
		TriggerClientEvent('es_camera:spectate', source, target)

		local msg = ('Admin %s ukoncil spectate'):format(GetPlayerName(source))
		sendAdminlogAboutSpectate(msg)

	elseif target == source then
		TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Nemuzes sledovat sam sebe!")
	else

		local found = false

		for i=1, #Spectating, 1 do
			if Spectating[i] == source then
				found = true
				break
			end
		end

		if not found then
			table.insert(Spectating, source)
		end

		local xPlayer = ESX.GetPlayerFromId(source)
		local xTarget = ESX.GetPlayerFromId(target)
		if xTarget then
			local msg = ('Admin %s spectuje hrace %s'):format(xPlayer.getName(), xTarget.getName())
			sendAdminlogAboutSpectate(msg)
		end

		TriggerClientEvent('tokovoip:setSpectating', -1, source, true)
		TriggerClientEvent('es_camera:onSpectate', -1, Spectating)
		TriggerClientEvent('es_camera:spectate', source, target)
	end
end

RegisterServerEvent('nnadmin:spectateCommand')
AddEventHandler('nnadmin:spectateCommand', function(target)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local group = xPlayer.getGroup()
	local args = {}
	table.insert(args, target)

	if group == 'superadmin' or group == 'admin' or group == 'mod' or group =='helper' then
		SpectateCommand(_source, args)
	end
end)

TriggerEvent('es:addGroupCommand', 'spectate', "helper", function(source, args, user)
	SpectateCommand(source, args)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end, {help = 'Spectate', params = {{name = 'id'}}})

AddEventHandler('playerDropped', function()
	for i=1, #Spectating, 1 do
		if Spectating[i] == source then
			Spectating[i] = nil
			break
		end
	end
end)

function sendAdminlogAboutSpectate (message)
	if Config.AdminLogEnabled then
		local url = 'https://discordapp.com/api/webhooks/722119241767190628/XElqWfUmv2F57J6aA9lTS6D8-pvtppeY1LZ2d6GDR5huPOEATHwDYbyQOxy7p-uGbWuO'
        local msg = os.date("%d.%m.%Y %X") .. ' - ' .. message
        PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
    end
end