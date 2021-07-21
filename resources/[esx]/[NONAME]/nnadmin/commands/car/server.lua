local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) 
    ESX = obj 
end)

TriggerEvent('es:addGroupCommand', 'fcar', 'admin', function(source, args, user)
    if not args[1] then
        TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM ', 'Musis zadat nazev auta' } })    
    end

	TriggerClientEvent('nnadmin:spawnFullVehicle', source, args[1])
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end)

TriggerEvent('es:addGroupCommand', 'returncar', 'helper', function(source, args, user)
    if not args[1] then
        TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM ', 'Musis zadat SPZ auta' } })    
    end
    local plate = table.concat(args, " ")

    MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = true WHERE `plate` = @plate', {
		['@plate'] = plate
	}, function(rowsChanged)
		if rowsChanged > 0 then
            TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM ', 'Auto vraceno do garaze' } })   
        else
            TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM ', 'Auto nenalezeno nebo uz v garazi je' } })   
		end
	end)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end)

-- SPECKY COMMAND
local PlayerSavedData = {}

TriggerEvent('es:addGroupCommand', 'specka', 'mod', function(source, args, user)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    PlayerSavedData[xPlayer.identifier] = {}
    PlayerSavedData[xPlayer.identifier].money = xPlayer.getMoney()
    PlayerSavedData[xPlayer.identifier].job = {name = xPlayer.job.name, grade = xPlayer.job.grade}
    PlayerSavedData[xPlayer.identifier].location = {
        x = xPlayer.getCoords().x,
        y = xPlayer.getCoords().y,
        z = xPlayer.getCoords().z,
    }

    xPlayer.setMoney(5000000000)
    xPlayer.setJob('admin', 3)
    xPlayer.addInventoryItem('remote_specky', 1)
    TriggerClientEvent("nnadmin:setOutfitToPed", _source, 'specka_dealer')
    
    TriggerClientEvent('nnadmin:teleportUser', source, -914.13, -227.24, 39.91)

    TriggerClientEvent("sendMessageAdmin", -1, source, xPlayer.name, "SEL PREDAVAT SPECIALKY")
    local msg = ("Hrac %s (ID: %s) SEL PREDAVAT SPECIALKY"):format(xPlayer.name, source)
    local url = 'https://discordapp.com/api/webhooks/737334550241345567/0lt8cLbuB4h2eKnm8PYoWwy2wC9wwECOjsusWpPDOH_gShDL1vuQ214IDC3LE2coGrjP'
    sendLogToDiscordWithCustomUrl(msg, url)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end)

TriggerEvent('es:addGroupCommand', 'dspecka', 'mod', function(source, args, user)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.setMoney(PlayerSavedData[xPlayer.identifier].money)
    xPlayer.setJob(PlayerSavedData[xPlayer.identifier].job.name, PlayerSavedData[xPlayer.identifier].job.grade)
    xPlayer.removeInventoryItem('remote_specky', 1)
    local target = PlayerSavedData[xPlayer.identifier].location

    TriggerClientEvent("nnadmin:setOutfitToPed", _source)
    PlayerSavedData[xPlayer.identifier] = {}

    TriggerClientEvent('nnadmin:teleportUser', source, target.x, target.y, target.z)
    TriggerClientEvent("sendMessageAdmin", -1, source, xPlayer.name, "DOKONCIL PREDAVANI SPECIALKY")
    local msg = ("Hrac %s (ID: %s) DOKONCIL PREDAVANI SPECIALKY"):format(xPlayer.name, source)
    local url = 'https://discordapp.com/api/webhooks/737334550241345567/0lt8cLbuB4h2eKnm8PYoWwy2wC9wwECOjsusWpPDOH_gShDL1vuQ214IDC3LE2coGrjP'
    sendLogToDiscordWithCustomUrl(msg, url)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end)