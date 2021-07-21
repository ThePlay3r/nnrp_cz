TriggerEvent('chat:addSuggestion', '/kostka')
TriggerEvent('chat:addSuggestion', '/kostky', 'vrh kostek (napis pocet kostek)')

RegisterCommand('kostka', function(source, args, rawCommand)
    local number = math.random(1,6)
    loadAnimDict("anim@mp_player_intcelebrationmale@wank")
    TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intcelebrationmale@wank", "wank", 8.0, 1.0, -1, 20, 0, 0, 0, 0)
    Citizen.Wait(10)
    ClearPedSecondaryTask(GetPlayerPed(-1))

    TriggerServerEvent('3dme:shareDisplay', 'Kostka vrzena...')
    Citizen.Wait(3000)
    TriggerServerEvent('3ddo:shareDisplay', 'Padlo cislo: '..number..'')
end)

RegisterCommand('kostky', function(source, args, rawCommand)
    local count = 5
    if args[1] then
        count = tonumber(args[1])
    end

    loadAnimDict("anim@mp_player_intcelebrationmale@wank")
    TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intcelebrationmale@wank", "wank", 8.0, 1.0, -1, 20, 0, 0, 0, 0)
    Citizen.Wait(10)
    ClearPedSecondaryTask(GetPlayerPed(-1))

    TriggerServerEvent('3dme:shareDisplay', 'Kostky vrzeny...')
    Citizen.Wait(3000)

    local number = math.random(1,6)
    local msg = 'Padla cisla: ' ..number
    for i = 1, count - 1, 1 do
        msg = msg .. ' ' .. math.random(1,6)
    end
    TriggerServerEvent('3ddo:shareDisplay', msg)
end)
   

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
     RequestAnimDict( dict )
     Citizen.Wait(5)
    end
end