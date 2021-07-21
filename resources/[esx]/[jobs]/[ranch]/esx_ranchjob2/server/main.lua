ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

local CowsAndPigsInSession = {}

RegisterServerEvent('ranchjob2:startHunt')
AddEventHandler('ranchjob2:startHunt', function(animals)
    CowsAndPigsInSession = animals
    TriggerClientEvent('ranchjob2:updateHuntingSession', -1, animals)
end)

RegisterServerEvent('ranchjob2:animalKilled')
AddEventHandler('ranchjob2:animalKilled', function(index)
    table.remove(CowsAndPigsInSession, index)
    TriggerClientEvent('ranchjob2:updateHuntingSession', -1, CowsAndPigsInSession)
end)

RegisterServerEvent('ranchjob2:deleteKilledAnimalForAll')
AddEventHandler('ranchjob2:deleteKilledAnimalForAll', function(animalId)
    TriggerClientEvent('ranchjob2:deleteKilledAnimal', -1, animalId)
end)

RegisterServerEvent('ranchjob2:deleteAnimalForAll')
AddEventHandler('ranchjob2:deleteAnimalForAll', function(animals)
    TriggerClientEvent('ranchjob2:deleteAnimals', -1, animals)
    CowsAndPigsInSession = {}
end)


ESX.RegisterServerCallback('ranchjob2:getHunt', function(source, callback)
    callback(CowsAndPigsInSession)
end)

RegisterServerEvent('ranchjob2:reward')
AddEventHandler('ranchjob2:reward', function(AnimalType)
    local xPlayer = ESX.GetPlayerFromId(source)
    local meatType = 'vitela'
    if AnimalType == 'a_c_pig' then
        meatType = 'pork'
    end

    local MeatQuantity = xPlayer.getInventoryItem(meatType).count
    local MeatLimit = xPlayer.getInventoryItem(meatType).limit

    if MeatQuantity + 1 <= MeatLimit then
        xPlayer.addInventoryItem(meatType, 2)
    else
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Neuneses uz vic masa')
    end

end)

function sendNotification(xsource, message, messageType, messageTimeout)
    TriggerClientEvent('notification', xsource, message)
end
