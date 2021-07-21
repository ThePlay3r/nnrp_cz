local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)


TriggerEvent('es:addGroupCommand', 'anmoney', 'user', function(source, args, user)
    if not args[1] or not args[2] then
        TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Musis zadat ID a castku!' } })
    else
        sendMoney(source, args[1], args[2])
    end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'Odeslat penize na bankovni ucet anonymne', params = {
    {name = 'ID'},
    {name = 'CASTKA'},
}})

function sendMoney (source, target, amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local zPlayer = ESX.GetPlayerFromId(target)
    local balance = 0
    if zPlayer ~= nil then
        balance = xPlayer.getAccount('bank').money
        zbalance = zPlayer.getAccount('bank').money
        if tonumber(_source) == tonumber(target) then
            -- advanced notification with bank icon
            TriggerClientEvent('esx:showAdvancedNotification', _source, 'Bank',
                               'Transfer Money',
                               'Nemuzes poslat penize sam sobe!',
                               'CHAR_BANK_MAZE', 9)
        else
            if balance <= 0 or balance < tonumber(amount) or tonumber(amount) <=
                0 then
                -- advanced notification with bank icon
                TriggerClientEvent('esx:showAdvancedNotification', _source,
                                   'Bank', 'Transfer Money',
                                   'Nemas dostatek penez!',
                                   'CHAR_BANK_MAZE', 9)
            else
                xPlayer.removeAccountMoney('bank', tonumber(amount))
                zPlayer.addAccountMoney('bank', tonumber(amount))
                -- advanced notification with bank icon
                TriggerClientEvent('esx:showAdvancedNotification', _source,
                                   'Bank', 'Transfer Money',
                                   'Poslal jsi ~r~$' .. amount ..
                                       '~s~ hraci ~r~' .. target .. ' .',
                                   'CHAR_BANK_MAZE', 9)
                TriggerClientEvent('esx:showAdvancedNotification', target, 'Bank',
                                'Transfer Money', 'Dostal jsi ~r~$' ..
                                amount .. '~s~.', 'CHAR_BANK_MAZE', 9)
            end

        end
    end

end