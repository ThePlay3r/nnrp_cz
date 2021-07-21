ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

local AnimalsInSession = {}

RegisterServerEvent('esx-qalle-hunting:startHunt')
AddEventHandler('esx-qalle-hunting:startHunt', function(animals)
    AnimalsInSession = animals
    TriggerClientEvent('hunting:updateHuntingSession', -1, animals)
end)

RegisterServerEvent('esx-qalle-hunting:animalKilled')
AddEventHandler('esx-qalle-hunting:animalKilled', function(index)
    table.remove(AnimalsInSession, index)
    TriggerClientEvent('hunting:updateHuntingSession', -1, AnimalsInSession)
end)

RegisterServerEvent('hunting:deleteKilledAnimalForAll')
AddEventHandler('hunting:deleteKilledAnimalForAll', function(animalId)
    TriggerClientEvent('hunting:deleteKilledAnimal', -1, animalId)
end)

RegisterServerEvent('hunting:deleteAnimalForAll')
AddEventHandler('hunting:deleteAnimalForAll', function(animals)
    TriggerClientEvent('hunting:deleteAnimals', -1, animals)
    AnimalsInSession = {}
end)


ESX.RegisterServerCallback('esx-qalle-hunting:getHunt', function(source, callback)
    callback(AnimalsInSession)
end)

RegisterServerEvent('esx-qalle-hunting:ILovePizzareward')
AddEventHandler('esx-qalle-hunting:ILovePizzareward', function(Weight)
    local xPlayer = ESX.GetPlayerFromId(source)
    local MeatQuantity = xPlayer.getInventoryItem('deer_meat').count
    local LeatherQuantity = xPlayer.getInventoryItem('leather').count
    local ParohyQuantity = xPlayer.getInventoryItem('parohy').count
    local MeatLimit = xPlayer.getInventoryItem('deer_meat').limit
    local LeatherLimit = xPlayer.getInventoryItem('leather').limit
    local ParohyLimit = xPlayer.getInventoryItem('parohy').limit

    local meatCount = 0
    local leatherCount = math.random(1, 4)
    local parohyChance = math.random(1, 50)

    if Weight >= 1 then
        meatCount = 1
    elseif Weight >= 9 then
        meatCount = 2
    elseif Weight >= 15 then
        meatCount = 3
    end

    if meatCount > 0 and MeatQuantity + meatCount <= MeatLimit then
        xPlayer.addInventoryItem('deer_meat', meatCount)
    elseif meatCount > 0 and MeatQuantity + meatCount > MeatLimit and MeatQuantity < MeatLimit then
        xPlayer.addInventoryItem('deer_meat', MeatLimit - MeatQuantity)
    else
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Neuneses uz vic masa')
    end

    if ParohyLimit <= ParohyQuantity + 1 and parohyChance == 25 then
        xPlayer.addInventoryItem('parohy', 1)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Kdyz jsi zpracovaval jelena, vsiml/a sis ze kousek od nej na zemi lezi vzacne parohy')
    end

    if LeatherQuantity + leatherCount <= LeatherLimit then
        xPlayer.addInventoryItem('leather', leatherCount)
    elseif LeatherQuantity + leatherCount > LeatherLimit and LeatherQuantity < LeatherLimit then
        xPlayer.addInventoryItem('leather', LeatherLimit - LeatherQuantity)
    else
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Neuneses uz vic kuze')
    end
        
end)

RegisterServerEvent('esx-qalle-hunting:seILovePizzall')
AddEventHandler('esx-qalle-hunting:seILovePizzall', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    local MeatPrice = 1200
    local LeatherPrice = 800
    local ParohyPrice = 15000

    local MeatQuantity = xPlayer.getInventoryItem('deer_meat').count
    local LeatherQuantity = xPlayer.getInventoryItem('leather').count
    local ParohyQuantity = xPlayer.getInventoryItem('parohy').count

    if MeatQuantity > 0 or LeatherQuantity > 0 or ParohyQuantity > 0 then
        xPlayer.addMoney(MeatQuantity * MeatPrice)
        xPlayer.addMoney(LeatherQuantity * LeatherPrice)
        xPlayer.addMoney(ParohyQuantity * ParohyPrice)

        xPlayer.removeInventoryItem('deer_meat', MeatQuantity)
        xPlayer.removeInventoryItem('leather', LeatherQuantity)
        xPlayer.removeInventoryItem('parohy', ParohyQuantity)
        if ParohyQuantity > 0 then
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Prodal/a jsi vzacne parohy za $' .. ParohyPrice * ParohyQuantity)
        end
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Prodal/a jsi ' .. LeatherQuantity + MeatQuantity .. ' kuze a masa a ziskal/a $' .. LeatherPrice * LeatherQuantity + MeatPrice * MeatQuantity)
    else
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Nemas zadne maso ani kuzi na prodej')
    end
        
end)

function sendNotification(xsource, message, messageType, messageTimeout)
    TriggerClientEvent('notification', xsource, message)
end

TriggerEvent('es:addGroupCommand', 'shunting', 'superadmin', function(source, args, user)
	print(#AnimalsInSession)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'Zobrazi pocet jelenu'})