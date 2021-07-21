-- relisoft.cz
-- Some-RP.cz
-- forum.some-rp.cz

local ESX = nil
local currentAdminPlayers = {}
local owned = false
local ownedGroup

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('relisoft_tag:owned')
AddEventHandler('relisoft_tag:owned',function(own,group, skipChat)
    owned = own
    if own then
        ownedGroup = group
        if skipChat ~= true then
            TriggerEvent('chat:addMessage', { args = { 'Tag ', 'Právě jste si zapl tag' }, color = { 255, 50, 50 } })
        end
    elseif skipChat ~= true then
        TriggerEvent('chat:addMessage', { args = { 'Tag ', 'Váš tag je vypnutý' }, color = { 255, 50, 50 } })
    end
end)

RegisterNetEvent('relisoft_tag:set_admins')
AddEventHandler('relisoft_tag:set_admins',function (admins)
    currentAdminPlayers = admins
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded',function()
    ESX.TriggerServerCallback('relisoft_tag:getAdminsPlayers',function(admins)
        currentAdminPlayers = admins
    end)
end)

Citizen.CreateThread(function ()

    while true do
        Citizen.Wait(0)

        local currentPed = PlayerPedId()
        local currentPos = GetEntityCoords(currentPed)

        local cx,cy,cz = table.unpack(currentPos)
        cz = cz + 1.2

        if owned then
            DrawText3DTags(cx,cy,cz, Config.Labels[ownedGroup])
        end

        for k, v in pairs(currentAdminPlayers) do
            local adminPed = GetPlayerPed(GetPlayerFromServerId(v.source))
            local adminCoords = GetEntityCoords(adminPed)
            local x,y,z = table.unpack(adminCoords)
            z = z + 1.2

            local distance = GetDistanceBetweenCoords(vector3(cx,cy,cz), x,y,z, true)
            local label = Config.Labels[v.group]
            if label then
                if distance < Config.SeeDistance then
                    DrawText3DTags(x,y,z, label)
                end
            end
        end
    end

end)

-- CREATE 3D TEXT
function DrawText3DTags(x, y, z, text) 
    local px,py,pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)
    local scale = (1 / dist) * 3
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale*fov
   
    SetTextScale(0.0 * scale, 0.55 * scale)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)

    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

