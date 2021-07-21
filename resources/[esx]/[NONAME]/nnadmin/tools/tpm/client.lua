local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) 
            ESX = obj 
        end)

        Citizen.Wait(0)
    end
end)

RegisterCommand("tpm", function(source)
    TeleportToWaypoint()
end)

TeleportToWaypoint = function()
    ESX.TriggerServerCallback("esx_marker:fetchUserRank", function(playerRank)
        if playerRank == "admin" or playerRank == "superadmin" or playerRank == "mod" or playerRank == "helper" then
            local WaypointHandle = GetFirstBlipInfoId(8)

            if DoesBlipExist(WaypointHandle) then
                local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)
                local playerPed = PlayerPedId()
                local playerCoords = GetEntityCoords(playerPed)
                if playerRank == "admin" or playerRank == "mod" or playerRank == "helper" then
                    TriggerServerEvent("nnadmin:sendTpmLog", waypointCoords, playerCoords)
                end

                for height = 1, 1000 do
                    SetPedCoordsKeepVehicle(playerPed, waypointCoords["x"], waypointCoords["y"], height + 0.0)

                    local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

                    if foundGround then
                        SetPedCoordsKeepVehicle(playerPed, waypointCoords["x"], waypointCoords["y"], height + 0.0)

                        break
                    end

                    Citizen.Wait(5)
                end

                ESX.ShowNotification("Teleportovan.")
            else
                ESX.ShowNotification("Nejdriv umisti waypoint.")
            end
        else
            ESX.ShowNotification("Na toto nemas opravneni.")
        end
    end)
end