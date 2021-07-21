local ESX = nil
local hasEquipedVest = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)
 
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)


-- VESTY
RegisterNetEvent('mrw_utils:bproof')
AddEventHandler('mrw_utils:bproof', function()
    local Ped = PlayerPedId()
    local armor = GetPedArmour(Ped)

    if armor < 5 then
        hasEquipedVest = true
        SetPedArmour(Ped, 100)
        TriggerServerEvent('3dme:shareDisplay', "Nasazuje si novou neprustrelnou vestu", true)
        ESX.ShowNotification('Nasadil/a sis novou neprustrelnou vestu')
    elseif armor >= 5 and armor < 90 then
        hasEquipedVest = false
        SetPedArmour(Ped, 0)
        TriggerServerEvent('3dme:shareDisplay', "Sundava si neprustrelnou vestu a rychle ji opravuje", true)
        ESX.ShowNotification('Sundal/a sis neprustrelnou vestu a opravil ji')
    elseif armor >= 90 then
        hasEquipedVest = false
        SetPedArmour(Ped, 0)
        TriggerServerEvent('3dme:shareDisplay', "Sundava si neprustrelnou vestu", true)
        ESX.ShowNotification('Sundal/a sis neprustrelnou vestu')
    end
end)

-- NABOJE

RegisterNetEvent('mrw_utils:AmmoBox')
AddEventHandler('mrw_utils:AmmoBox', function()
    
    local Ped  = PlayerPedId()
    local weapon = GetSelectedPedWeapon(Ped)
    local bol, maxAmmo = GetMaxAmmo(Ped, weapon)

    if maxAmmo > 400 then
        maxAmmo = 400
    end

    SetPedAmmo(Ped, weapon, maxAmmo)
    ESX.ShowNotification('Doplnil/a jsi naboje do zasobniku')
end)    


Citizen.CreateThread(function()
    while true do
        local armor = GetPedArmour(PlayerPedId())

        if hasEquipedVest and armor < 5 then
            hasEquipedVest = false
            TriggerServerEvent('mrw_utils:DelBProof')
        end
        
        Citizen.Wait(5000)
    end
end)