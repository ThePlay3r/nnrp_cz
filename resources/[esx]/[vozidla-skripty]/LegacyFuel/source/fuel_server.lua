ESX = nil

if Config.UseESX then
    TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

    RegisterServerEvent('fuel:pay')
    AddEventHandler('fuel:pay', function(price)
        local xPlayer = ESX.GetPlayerFromId(source)
        local amount = ESX.Math.Round(price)
        local societyAccount
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_state', function(account)
            societyAccount = account
        end)

        if price > 0 then
            xPlayer.removeMoney(amount)
           societyAccount.addMoney(amount)
        end
    end)
end