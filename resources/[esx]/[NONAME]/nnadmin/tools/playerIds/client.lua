local ESX = nil
local showIDs = false
local showBig = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterCommand('ids', function(source, args)
    ESX.TriggerServerCallback("idAboveHead:fetchUserGroup", function(group)
        if group == "admin" or group == "superadmin" or group == "mod" or group == "helper" then
            if showIDs then
                showIDs = false
                showBig = false
                ESX.ShowNotification("Vypnul/a sis IDcka")
                TriggerEvent('nnadmin:handleTagIdsChange', 'BigIds', false)
            else
                showIDs = true
                showBig = false
                ESX.ShowNotification("Zapnul/a sis IDcka")
                TriggerEvent('nnadmin:handleTagIdsChange', 'BigIds', true)
            end
        end
    end)
end, false)

function CallIds ()
    ESX.TriggerServerCallback("idAboveHead:fetchUserGroup", function(group)
        if group == "admin" or group == "superadmin" or group == "mod" or group == "helper" then
            if showIDs then
                showIDs = false
                showBig = true
                ESX.ShowNotification("Vypnul/a sis IDcka")
                TriggerEvent('nnadmin:handleTagIdsChange', 'BigIds', false)
            else
                showIDs = true
                showBig = true
                ESX.ShowNotification("Zapnul/a sis IDcka")
                TriggerEvent('nnadmin:handleTagIdsChange', 'BigIds', true)
            end
        end
    end)
end

AddEventHandler('idAboveHead:CallIdsOff', function()
    ESX.TriggerServerCallback("idAboveHead:fetchUserGroup", function(group)
        if group == "admin" or group == "superadmin" or group == "mod" or group == "helper" then
            showIDs = false
            showBig = true
        end
    end)
end)

AddEventHandler('idAboveHead:CallIdsOn', function()
    ESX.TriggerServerCallback("idAboveHead:fetchUserGroup", function(group)
        if group == "admin" or group == "superadmin" or group == "mod" or group == "helper" then
            showIDs = true
            showBig = true
        end
    end)
end)

RegisterCommand('bigids', function(source, args)
    CallIds()
end, false) 


Citizen.CreateThread(function()
    while true do
        if showIDs then
            local adminPed = GetPlayerPed(-1)
            local adminCoords = GetEntityCoords(adminPed)
            local adminId = GetPlayerServerId(PlayerId())
            for id = 0, 255 do 
                if NetworkIsPlayerActive(id) then
                    local x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
                    local distance = GetDistanceBetweenCoords(adminCoords, x2,y2,z2, true)
                    local playerId = GetPlayerServerId(id)
		            local aboveThreshold = 1
		            if showBig and adminId ~= playerId then
			            aboveThreshold = 2
		            end

                    if distance < 201 then
                        DrawText3DIds(x2, y2, z2 + aboveThreshold, playerId, adminId == playerId)
                    end
                end
            end
        end
        Citizen.Wait(0)
    end
end)

-- CREATE 3D TEXT
function DrawText3DIds(x, y, z, text, isMyId) 
    local px,py,pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)
    local scale = (1.4 / dist) * 2
    if showBig and not isMyId then
	    scale = (8 / dist) * 2
    end

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
