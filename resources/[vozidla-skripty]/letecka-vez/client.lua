RegisterNetEvent('leteckavez:getAndSendData')
AddEventHandler('leteckavez:getAndSendData', function(stav)
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed)
    local coords = GetEntityCoords(playerPed)
    local street = table.pack(GetStreetNameAtCoord(coords.x, coords.y, coords.z))
    local streetName = GetStreetNameFromHashKey(street[1]) .. ' ' .. GetStreetNameFromHashKey(street[2])
    if vehicle ~= 0 then
        local vehicleName = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
        TriggerServerEvent('leteckavez:prepareLog', vehicleName, stav, streetName)
    end
end)