local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

local waitingMoney = {}

TriggerEvent('es:addGroupCommand', 'setmhash', 'user', function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    local amount = args[1]
    local hash = args[2]

    if not amount then
        TriggerClientEvent('chat:addMessage', source, { args = { '^1[HASH]: ^0Musis zadat castku.' } })
        return 
    end
    if not hash then
        TriggerClientEvent('chat:addMessage', source, { args = { '^1[HASH]: ^0Musis zadat hash.' } })
        return 
    end
    if waitingMoney[hash] then
        TriggerClientEvent('chat:addMessage', source, { args = { '^1[HASH]: ^0Hash nejde pouzit, zvol jiny.' } })
        return 
    end

    amount = tonumber(amount)

    if xPlayer.getAccount('bank').money < amount then
        TriggerClientEvent('chat:addMessage', source, { args = { '^1[HASH]: ^0Nemas dostatek penez.' } })
        return
    end

    waitingMoney[hash] = {
       amount = amount,
       creator = source,
    }
    xPlayer.removeAccountMoney('bank', amount)
    discordLogMoneyHash(source, "Hrac " .. GetPlayerName(source) .. " **vytvoril** hash **" .. hash .. "** s **" .. waitingMoney[hash].amount .. "**")
    TriggerClientEvent('chat:addMessage', source, { args = { '^1[HASH]: ^0Penize pripraveny na anonymnim uctu k vyzvednuti, hash: ^2' .. hash .. '^0' } })

end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'Pripravit penize k vyzvednuti pres hash', params = {
    {name = "castka"},
    {name = "hash"},
}})

TriggerEvent('es:addGroupCommand', 'getmhash', 'user', function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    local hash = args[1]

    if not hash then
        TriggerClientEvent('chat:addMessage', source, { args = { '^1[HASH]: ^0Musis zadat hash.' } })
        return 
    end

    if not waitingMoney[hash] then
        TriggerClientEvent('chat:addMessage', source, { args = { '^1[HASH]: ^0Neplatny hash.' } })
        return 
    end

    xPlayer.addAccountMoney('bank', waitingMoney[hash].amount)

    discordLogMoneyHash(source, "Hrac " .. GetPlayerName(source) .. " **pouzil** hash **" .. hash .. "** a ziskal **" .. waitingMoney[hash].amount .. "**")
    
    TriggerClientEvent('chat:addMessage', source, { args = { '^1[HASH]: ^0Penize vyzvednuty'} })
    TriggerClientEvent('chat:addMessage', waitingMoney[hash].creator, { args = { '^1[HASH]: ^0Penize byly vyzvednuty' } })
    waitingMoney[hash] = nil
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'Vyzvednout penize pres hash', params = {
    {name = "hash"},
}})

function discordLogMoneyHash (source, text)
    local url = 'https://discordapp.com/api/webhooks/720596490468327457/KY4T5kncdYka9-l_Hx3KA3KZO6UvERtnMErSpvYjPTM9qHVHK_wr2hy6eKytsRqUpQ1T'
    local time = os.date("%d.%m.%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. text
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end