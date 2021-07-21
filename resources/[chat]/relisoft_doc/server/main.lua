Tasks = {}

TriggerEvent('es:addCommand', 'doc', function(source, args, user)
    if args[1] == nil then
        TriggerClientEvent('chat:addMessage', source, { args = { '^1Chyba: ', 'Prosim pouzijte /doc 1-20!' } })
    else
        local number = tonumber(args[1])
        local action = args
        table.remove(action, 1)
        action = table.concat(action, ' ')
        
        if Tasks[source] then
            TriggerClientEvent('chat:addMessage', source, { args = { '^1Chyba: ', 'Nelze spustit /doc vícekrát' } })
            return
        end
        if number > 20 or number < 1 then
            TriggerClientEvent('chat:addMessage', source, { args = { '^1Chyba: ', 'Prosim pouzijte /doc 1-20!' } })
            return
        end
        if math.floor(number) ~= number then
            TriggerClientEvent('chat:addMessage', source, { args = { '^1Chyba: ', 'Prosim pouzijte /doc 1-20!' } })
            return
        end
        if Tasks[source] == nil then
            Tasks[source] = {}
        end
        Tasks[source] = {times = number, current = 0, source = source, action = action}
        discordLog("pouzil/a **doc " .. number .. "** s akci: " .. action, source)
    end
end, {})

local function startChatTimer()
    local oneCycleTime = 1000
    SetTimeout(oneCycleTime, function()
        for k,v in pairs(Tasks) do
            v.current = v.current + 1
            Tasks[k] = v
            TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, v.source, _U('do_prefix', v.action), tostring(v.current).." / "..tostring(v.times), { 32, 250, 43 })
            TriggerClientEvent('esx_relisoftdoc:showDoc', -1, v.source, oneCycleTime, _U('do_prefix', v.action) .. ' ' .. tostring(v.current).." / "..tostring(v.times))

            if v.current >= v.times then
                Tasks[k] = nil
            end
        end
        startChatTimer()
    end)
end
startChatTimer()


function discordLog(text, source)
	local time = os.date("%d/%m/%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. text
	local url = "https://discordapp.com/api/webhooks/702566573717717133/jBCmj1kD3nxq809t5AnogQoFMXxcxfgDAd4k8Qs499-zzhKS-2-tGlBnyeK6yuEd5YQR"
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end