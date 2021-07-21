local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

ESX.RegisterUsableItem('cuffs_one', function(source)
    TriggerClientEvent('nnpouta:handleHandcuff', source, 'cuffs_one')
end)

ESX.RegisterUsableItem('cuffs_two', function(source)
    TriggerClientEvent('nnpouta:handleHandcuff', source, 'cuffs_two')
end)

RegisterServerEvent('nnpouta:handcuff')
AddEventHandler('nnpouta:handcuff', function(target, item)
    if item == 'cuffs_two' then
        local xPlayer = ESX.GetPlayerFromId(source)

        xPlayer.removeInventoryItem('cuffs_two', 1)
    end
    TriggerClientEvent('nnpouta:handcuff', target)
end)
