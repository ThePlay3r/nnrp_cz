
--- SERVER

ESX               = nil
local cars 		  = {}

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_givecarkeys:requestPlayerCars', function(source, cb, plate)

	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll(
		'SELECT * FROM owned_vehicles WHERE owner = @identifier',
		{
			['@identifier'] = xPlayer.identifier
		},
		function(result)

			local found = false

			for i=1, #result, 1 do

				local vehicleProps = json.decode(result[i].vehicle)

				if trim(vehicleProps.plate) == trim(plate) then
					found = true
					break
				end

			end

			if found then
				cb(true)
			else
				cb(false)
			end

		end
	)
end)

ESX.RegisterServerCallback('esx_givecarkeys:requestPlayerAndBazarCars', function(source, cb, plate, owner)
	local xPlayer = ESX.GetPlayerFromId(source)
	local jobName = xPlayer.job.name
	local owner = jobName
	if jobName == 'bazar' then
		owner = 'autobazar'
	end

	MySQL.Async.fetchAll(
		'SELECT * FROM owned_vehicles WHERE (owner = @identifier OR owner = @owner)',
		{
			['@identifier'] = xPlayer.identifier,
			['@owner'] = owner,
		},
		function(result)

			local found = false

			for i=1, #result, 1 do

				local vehicleProps = json.decode(result[i].vehicle)

				if trim(vehicleProps.plate) == trim(plate) then
					found = true
					break
				end

			end

			if found then
				cb(true)
			else
				cb(false)
			end

		end
	)
end)

RegisterServerEvent('esx_givecarkeys:frommenu')
AddEventHandler('esx_givecarkeys:frommenu', function ()
	TriggerClientEvent('esx_givecarkeys:keys', source)
end)

local function sendDiscordLog (text, source, isBazar, isBene)
	local time = os.date("%d.%m.%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. text
	local url = "https://discordapp.com/api/webhooks/722036897551220746/WFOyvaaKr3bkSvIRrXroTIu_-i_shRlTS9VF0p_qvDrkQTUCaWYfWVRHB-RKb22RXZxG"
	local bazarUrl = 'https://discordapp.com/api/webhooks/725744307826327603/VI8iWC5eDeJCtu24uUMLqiYRGaS4RtUfeWVlC5yQkmu0nPjKZdqVTnBDt_ebVSNJq-f3'
	local beneUrl = 'https://discordapp.com/api/webhooks/737008499778781214/XrfyoQMfESeJUVH2UnkxHRj5osAu0_GGpq_98D7NHU7VuaDKbbP_-D695Nhot3pNHuNC'
	if isBazar then
		PerformHttpRequest(bazarUrl, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
	elseif isBene then
		PerformHttpRequest(beneUrl, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
	else
		PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
	end
end


RegisterServerEvent('esx_givecarkeys:setVehicleOwnedPlayerId')
AddEventHandler('esx_givecarkeys:setVehicleOwnedPlayerId', function (playerId, vehicleProps, source, carModelName)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	MySQL.Async.execute('UPDATE owned_vehicles SET owner=@owner WHERE plate=@plate',
	{
		['@owner']   = xPlayer.identifier,
		['@plate']   = vehicleProps.plate
	},
	function (rowsChanged)
		TriggerClientEvent('esx:showNotification', playerId, 'Dostal/a jsi nove auto s SPZ ~g~' ..vehicleProps.plate..'!', vehicleProps.plate)
		sendDiscordLog("dal klice hraci " .. GetPlayerName(playerId) .. "**[" .. xPlayer.identifier .. "]** od auta " .. carModelName .. " s SPZ " .. vehicleProps.plate, source)
	end)
end)

function trim(s)
    if s ~= nil then
		return s:match("^%s*(.-)%s*$")
	else
		return nil
    end
end


RegisterServerEvent('esx_givecarkeys:setVehicleOwnedPlayerIdInBazar')
AddEventHandler('esx_givecarkeys:setVehicleOwnedPlayerIdInBazar', function (owner, vehicleProps, source, carModelName)
	local newOwner = nil
	if owner == 'player' then
		newOwner = ESX.GetPlayerFromId(source).identifier
	else
		newOwner = owner
	end
	local xPlayer = ESX.GetPlayerFromId(source)
	local jobName = xPlayer.job.name

	MySQL.Async.execute('UPDATE owned_vehicles SET owner=@owner WHERE plate=@plate',
	{
		['@owner']   = newOwner,
		['@plate']   = vehicleProps.plate
	},
	function (rowsChanged)
		local action = 'Vzal/a'
		if owner == 'autobazar' or owner == 'benefactor' then
			action = 'Odevzdal/a'
		end
		TriggerClientEvent('esx:showNotification', source, action .. ' jsi klice od bazaroveho auta s SPZ ~g~' ..vehicleProps.plate..'!', vehicleProps.plate)
		sendDiscordLog(action .. " bazarove klice od auta " .. carModelName .. " s SPZ " .. vehicleProps.plate, source, jobName == 'bazar', jobName == 'benefactor')
	end)
end)

function trim(s)
    if s ~= nil then
		return s:match("^%s*(.-)%s*$")
	else
		return nil
    end
end



TriggerEvent('es:addCommand', 'givecarkeys', function(source, args, user)
	TriggerClientEvent('esx_givecarkeys:keys', source)
end)
