local anchored = false

function Kotva ()
    local ped = GetPlayerPed(-1)
    if IsPedInAnyBoat(ped) then
        local boat = GetVehiclePedIsIn(ped, true)
        local speed = GetEntitySpeed(boat) * 3.6

        if speed > 20 then
            TriggerEvent("pNotify:SendNotification",{
                text = "Rychlost lode musi byt pod 20km/h",
                type = "error",
                timeout = (2000),
                layout = "bottomRight",
                queue = "global",
                animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},
                killer = true,
                sounds = {
                sources = {"Anchorup.ogg"}, -- For sounds to work, you place your sound in the html folder and then add it to the files array in the __resource.lua file.
                volume = 0.1,
                conditions = {"docVisible"}  
            }})
            return
        end

        if anchored then
            anchored = false
            SetBoatAnchor(boat, false)
            SetBoatFrozenWhenAnchored(boat, false)
            TriggerEvent("pNotify:SendNotification",{
                text = "Kotva vytazena",
                type = "success",
                timeout = (2000),
                layout = "bottomRight",
                queue = "global",
                animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},
                killer = true,
            })
        else
            anchored = true
            SetBoatAnchor(boat, true)
            SetBoatFrozenWhenAnchored(boat, true)
            TriggerEvent("pNotify:SendNotification",{
                text = "Kotva spustena!",
                type = "success",
                timeout = (2000),
                layout = "bottomRight",
                queue = "global",
                animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},
                killer = true,
            })
        end
    end
end

RegisterCommand("kotva", function()
    Kotva()
end)

RegisterKeyMapping('kotva', 'Kotva', 'keyboard', '')