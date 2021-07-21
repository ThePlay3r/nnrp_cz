local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)
local ENTITY = nil

-- Function to get the object the player is actually aiming at.
function getEntity(player)                                          -- Create this function.
    local result, entity = GetEntityPlayerIsFreeAimingAt(player)    -- This time get the entity the player is aiming at.
    return entity                                                   -- Returns what the player is aiming at.
end                                                                 -- Ends the function.

RegisterNetEvent('nnadmin:vehicleDeleterSend')
AddEventHandler('nnadmin:vehicleDeleterSend', function()
    if ENTITY and DoesEntityExist(ENTITY) then
        local networkId = NetworkGetNetworkIdFromEntity(ENTITY)
        SetNetworkIdCanMigrate(networkId, true)
        SetNetworkIdExistsOnAllMachines(networkId, true)
        NetworkSetNetworkIdDynamic(networkId, false)
        NetworkRequestControlOfEntity(ENTITY)
        NetworkRequestControlOfNetworkId(networkId)
        TriggerServerEvent('nnadmin:deleteEntityWithNetworkId', networkId)
    end
end)

RegisterNetEvent('nnadmin:vehicleDeleter')
AddEventHandler('nnadmin:vehicleDeleter', function(networkId)
    local entityId = nil
    if NetworkDoesNetworkIdExist(networkId) then
        entityId = NetworkGetEntityFromNetworkId(networkId)
        SetNetworkIdCanMigrate(networkId, true)
        SetNetworkIdExistsOnAllMachines(networkId, true)
        NetworkSetNetworkIdDynamic(networkId, false)
    end

    if DoesEntityExist(entityId) then
        SetEntityAsMissionEntity(entityId)
        DeleteEntity(entityId)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if IsPlayerFreeAiming(PlayerId()) then
            ENTITY = getEntity(PlayerId())
        end
    end
end)

Citizen.CreateThread(function()
    while ENTITY ~= nil do
        Citizen.Wait(10000)
        ENTITY = nil
    end
end)

