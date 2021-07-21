local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('nnadmin:spawnFullVehicle')
AddEventHandler('nnadmin:spawnFullVehicle', function(modelName)
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)

    ESX.Game.SpawnVehicle(modelName, coords, 90.0, function(vehicle)
        TaskWarpPedIntoVehicle(playerPed,  vehicle, -1)
        ESX.Game.SetVehicleProperties(vehicle, {
            modEngine = 3,
            modTransmission = 2,
            modBrakes = 2,
            modTurbo = 1
        })
    end)
end)

local Outfits = {
    male = {
        tshirt_1 = 6,  tshirt_2 = 0,
        torso_1 = 29,   torso_2 = 1,
        decals_1 = 0,   decals_2 = 0,
        arms = 11, arms_2 = 0,
        pants_1 = 33,   pants_2 = 0,
        shoes_1 = 35,   shoes_2 = 2,
        helmet_1 = -1,  helmet_2 = 0,
        chain_1 = 0,    chain_2 = 0,
        bproof_1 = 0,  bproof_2 = 0,
        mask_1 = -1,     mask_2 = 0,
        ears_1 = -1,     ears_2 = 0,
        glasses_1 = 5,  glasses_2 = 5,
        bracelets_1 = -1, bracelets_2 = 0,
        watches_1 = -1, watches_2 = 0,
    },
    female = {
        tshirt_1 = 27,  tshirt_2 = 5,
        torso_1 = 37,   torso_2 = 5,
        decals_1 = 0,   decals_2 = 0,
        arms = 0, arms_2 = 0,
        pants_1 = 8,   pants_2 = 0,
        shoes_1 = 35,   shoes_2 = 2,
        helmet_1 = -1,  helmet_2 = 0,
        chain_1 = 0,    chain_2 = 0,
        bproof_1 = 0,  bproof_2 = 0,
        mask_1 = -1,     mask_2 = 0,
        ears_1 = -1,     ears_2 = 0,
        glasses_1 = 11,  glasses_2 = 6,
        bracelets_1 = -1, bracelets_2 = 0,
        watches_1 = -1, watches_2 = 0,
    },
}

RegisterNetEvent('nnadmin:setOutfitToPed')
AddEventHandler('nnadmin:setOutfitToPed', function(outfit)
    -- pokud neni poslan outfit, tak pouzit reset do defaultu
    if not outfit then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            TriggerEvent('skinchanger:loadSkin', skin)
        end)
    end

    if outfit == 'specka_dealer' then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            local sex = 'male'
            if skin.sex == 1 then
                sex = 'female'
            end
            TriggerEvent('skinchanger:loadClothes', skin, Outfits[sex])
        end)
    end
end)

