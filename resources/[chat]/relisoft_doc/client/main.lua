RegisterNetEvent('esx_relisoftdoc:showDoc')
AddEventHandler('esx_relisoftdoc:showDoc', function(source, time, text)
	local offset = 1.14
	Display(GetPlayerFromServerId(source), text, time, offset)
end)

function Display(mePlayer, text, time, offset)
    local displaying = true

    Citizen.CreateThread(function()
        Wait(time)
        displaying = false
    end)
    
    Citizen.CreateThread(function()
        while displaying do
            Wait(0)
            local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
            local coords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist2(coordsMe, coords)
            if dist < 2500 then
                DrawText3D(coordsMe['x'], coordsMe['y'], coordsMe['z']+offset, text)
            end
        end
    end)
end


-- CREATE 3D TEXT
function DrawText3D(x, y, z, text) 
    local px,py,pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)
    local scale = (1 / dist) * 3
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale*fov
   
    SetTextScale(0.0 * scale, 0.55 * scale)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(32, 250, 43, 255)
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
