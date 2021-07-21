Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000 * 1 * 60)
        TriggerServerEvent("nnchrp:mnch")
    end
end)