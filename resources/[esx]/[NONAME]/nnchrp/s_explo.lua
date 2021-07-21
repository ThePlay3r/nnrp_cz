local function logExplo(embeds, source)
    local url = 'https://discordapp.com/api/webhooks/733605514977607720/RJrh_rQLITSNJ0bdxumbkPftHBUod89m3CrULEyLFvfMp3nENDzMyqhjPED00KxMfdn-'
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({embeds = embeds}), {["Content-Type"]="application/json"})
end

AddEventHandler('explosionEvent', function(sender, ev)
    local time = os.date("%d.%m.%Y %X")
	local name = GetPlayerName(sender)
    local identifier = GetPlayerIdentifiers(sender)[1]
    local playerCoords = GetEntityCoords(GetPlayerPed(sender))
    local playerVec = vector3(playerCoords.x, playerCoords.y, playerCoords.z)
    local explodeVec = vector3(ev.posX, ev.posY, ev.posZ)
    local dist = #(playerVec - explodeVec)

    local info = {
        Cas = time,
        Jmeno = name,
        Hex = identifier,
        ['Souradnice hrace'] = "\nX: " .. playerCoords.x .. '\nY: ' .. playerCoords.y .. '\nZ: ' .. playerCoords.z .. '',
        ['Souradnice vybuchu'] = "\nX: " .. ev.posX .. '\nY: ' .. ev.posY .. '\nZ: ' .. ev.posZ .. '',
        ['Vzdalenost hrace od vybuchu'] = dist,
        ['Typ exploze'] = ev.explosionType,
        ['Je slysitelna?'] = ev.isAudible,
        ['ID autora'] = ev.ownerNetId,
        ['Nasobic poskozeni'] = ev.damageScale,
        ['Otreseni kamery'] = ev.cameraShake,
        ['Je neviditelna?'] = ev.isInvisible,
    }
    
    local message = ''
    for k,v in pairs(info) do
        message = message .. '\n**' .. k .. '**: ' .. tostring(v)
    end
    local embeds = {
        {
            ["title"] = GetPlayerName(sender),
            ["description"] = message,
            ["type"] = "rich",
            ["color"] = 65280,
        }
    }
    logExplo(embeds, sender)
end)