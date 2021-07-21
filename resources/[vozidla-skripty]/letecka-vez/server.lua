TriggerEvent('es:addGroupCommand', 'vez', "user", function(source, args, user)
    if not args[1] then
        TriggerClientEvent('chat:addMessage', source, { args = {"^1VEZ ", "Musis zadat stav letu!"} })
        return
    end
    local stav = args[1]
    TriggerClientEvent('leteckavez:getAndSendData', source, stav)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^1VEZ ", "Nemas opravneni pouzivat tento prikaz!"} })
end, {
    help = "Odeslat zaznam o letu na leteckou vez",
    params = {
        {name = "START/KONEC", help = "STAV"},
    }
})

function mathRound (value, numDecimalPlaces)
    tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", value))
end

function sendLogToVez(vehicleName, source, stav, streetName)
    local url = 'https://discord.com/api/webhooks/739449654659383336/Wdeb4A5bc00APcR5gpPdOXGycvLBDFPMMFl6E2ysxxAdd0SKOvHhwVwqOPYQsuU_RThA'
    local playerPed = GetPlayerPed(source)
    local playerName = GetPlayerName(source)
    local location = GetEntityCoords(playerPed)
    local time = os.date("%d.%m.%Y %X")
    local locX = mathRound(location.x) .. '.0'
    local locY = mathRound(location.y) .. '.0'
    local locZ = mathRound(location.z) .. '.0'

    local msg = '**Letec** ' .. playerName .. ' [ID: '..source..']\n'
    msg = msg .. '**Stav**: ' .. stav .. '\n'
    msg = msg .. '**Lokace** X: ' .. locX .. ' Y: ' .. locY .. ' Z: ' .. locZ .. '\n'
    msg = msg .. '**Ulice**: ' .. streetName .. '\n'
    msg = msg .. '**Cas**: ' .. time .. '\n'
    msg = msg .. '**Vozidlo**: ' .. vehicleName
    PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
    TriggerClientEvent('chat:addMessage', source, { args = {"^1VEZ: ", "Zaznamenano! Letecke ID: ^2" .. source} })
end

RegisterServerEvent('leteckavez:prepareLog')
AddEventHandler('leteckavez:prepareLog', function(vehicleName, stav, streetName)
    local _source = source
    sendLogToVez(vehicleName, _source, stav, streetName)
end)