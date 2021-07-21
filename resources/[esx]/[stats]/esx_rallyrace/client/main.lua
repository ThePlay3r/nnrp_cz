ESX = nil

local RaceVehicle = nil

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) 
            ESX = obj 
        end)

        Citizen.Wait(1)
    end
end) 
  
Citizen.CreateThread(function()
    Citizen.Wait(0) -- init load esx

    while true do
        local sleep = 500

        local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Config.RaceMenuPos['x'], Config.RaceMenuPos['y'], Config.RaceMenuPos['z'], true)
        if distance < 100.0 then
            sleep = 5
           
            DrawMarker(
                31,  Config.RaceMenuPos['x'], Config.RaceMenuPos['y'], Config.RaceMenuPos['z'] + 1,
                0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.0, 32, 110, 51, 150, 0, 0, 0, true
            )

            if distance < 1.5 then
                SetTextComponentFormat('STRING')
	    		AddTextComponentString("Zmackni ~INPUT_CONTEXT~ pro otevreni zavodniho menu")
                DisplayHelpTextFromStringLabel(0, 0, 1, -1)

                if IsControlJustReleased(0, 38) then
                    OpenRaceMenu()
                end
            end
        end
        Citizen.Wait(sleep)
    end

end)

function StartRace(currentRace)
    local currentCheckPoint = 1
    local nextCheckPoint = 2
    local isRacing = true

    StartTime = GetGameTimer()

    Citizen.CreateThread(function()

        CheckPoint = CreateCheckpoint(
            5,
            Config.CheckPoints[currentRace][currentCheckPoint].x,
            Config.CheckPoints[currentRace][currentCheckPoint].y,
            Config.CheckPoints[currentRace][currentCheckPoint].z + 2,
            Config.CheckPoints[currentRace][nextCheckPoint].x,
            Config.CheckPoints[currentRace][nextCheckPoint].y,
            Config.CheckPoints[currentRace][nextCheckPoint].z,
            8.0, 255, 255, 255, 100, 0)
        Blip = AddBlipForCoord(
            Config.CheckPoints[currentRace][currentCheckPoint].x,
            Config.CheckPoints[currentRace][currentCheckPoint].y,
            Config.CheckPoints[currentRace][currentCheckPoint].z
        ) 

        while isRacing do
            Citizen.Wait(5)

            local PlayerCoords = GetEntityCoords(PlayerPedId())

            local currentTime = formatTimer(StartTime, GetGameTimer())

            if not IsPedInAnyVehicle(PlayerPedId(), false) then
                ESX.Game.DeleteVehicle(RaceVehicle)
                ESX.ShowNotification("Vyletel jsi z vozidla, takze jsi diskvalifikovan!")
                DeleteCheckpoint(CheckPoint)
                RemoveBlip(Blip)
                isRacing = false
                return
            end
            
            ESX.Game.Utils.DrawText3D({x = PlayerCoords.x, y = PlayerCoords.y, z = PlayerCoords.z + 1.2}, currentCheckPoint .. ' / ' ..GetMaxCheckPoints(Config.CheckPoints, currentRace), 0.6)
            ESX.Game.Utils.DrawText3D({x = PlayerCoords.x, y = PlayerCoords.y, z = PlayerCoords.z + 1.4}, currentTime, 0.6)

            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Config.CheckPoints[currentRace][currentCheckPoint].x,  Config.CheckPoints[currentRace][currentCheckPoint].y,  Config.CheckPoints[currentRace][currentCheckPoint].z) < 7.5 then

                if currentCheckPoint == GetMaxCheckPoints(Config.CheckPoints, currentRace) - 1 then
                    currentCheckPoint = GetMaxCheckPoints(Config.CheckPoints, currentRace)
                    PlaySoundFrontend(-1, "RACE_PLACED", "HUD_AWARDS")
                    DeleteCheckpoint(CheckPoint)
                    RemoveBlip(Blip)
                    CheckPoint = CreateCheckpoint(9, Config.CheckPoints[currentRace][currentCheckPoint].x,  Config.CheckPoints[currentRace][currentCheckPoint].y,  Config.CheckPoints[currentRace][currentCheckPoint].z + 2, Config.CheckPoints[currentRace][nextCheckPoint].x, Config.CheckPoints[currentRace][nextCheckPoint].y, Config.CheckPoints[currentRace][nextCheckPoint].z, 8.0, 255, 255, 255, 100, 0)
                elseif currentCheckPoint == GetMaxCheckPoints(Config.CheckPoints, currentRace) then
                    PlaySoundFrontend(-1, "ScreenFlash", "WastedSounds")
                    DeleteCheckpoint(CheckPoint)
                    RemoveBlip(Blip)
                    ESX.ShowNotification("Dokoncil jsi zavod v case " .. currentTime .. " sekund !")
                    TriggerServerEvent('esx-rally-races:addTime', currentTime, currentRace)
                    DeleteEntity(RaceVehicle)

                    return
                else
                    PlaySoundFrontend(-1, "RACE_PLACED", "HUD_AWARDS")
                    DeleteCheckpoint(CheckPoint)
                    RemoveBlip(Blip)

                    currentCheckPoint = currentCheckPoint + 1

                    nextCheckPoint = nextCheckPoint + 1
                    CheckPoint = CreateCheckpoint(5, Config.CheckPoints[currentRace][currentCheckPoint].x,  Config.CheckPoints[currentRace][currentCheckPoint].y,  Config.CheckPoints[currentRace][currentCheckPoint].z + 2, Config.CheckPoints[currentRace][nextCheckPoint].x, Config.CheckPoints[currentRace][nextCheckPoint].y, Config.CheckPoints[currentRace][nextCheckPoint].z, 8.0, 255, 255, 255, 100, 0)
                    Blip = AddBlipForCoord(Config.CheckPoints[currentRace][currentCheckPoint].x, Config.CheckPoints[currentRace][currentCheckPoint].y, Config.CheckPoints[currentRace][currentCheckPoint].z)   
                end

            end
        end
    end)
end

function StartCountdown(race, StartPosition)
    DoScreenFadeOut(1)

    SetPedCoordsKeepVehicle(GetPlayerPed(-1), StartPosition['x'],StartPosition['y'],StartPosition['z'])
    SetEntityHeading(GetVehiclePedIsUsing(PlayerPedId()), StartPosition['h'])

    Citizen.Wait(1500)
    DoScreenFadeIn(100)

    local countDownTimer = 4
    local entity = GetVehiclePedIsUsing(PlayerPedId())

    FreezeEntityPosition(entity, true)

    for i = 1, countDownTimer, 1 do
        local message = "Priprav se"
        countDownTimer = countDownTimer - 1
        if countDownTimer == 0 then
            message = "START"
        end
        ESX.Scaleform.ShowFreemodeMessage(message, countDownTimer, 0.8)
    end

    FreezeEntityPosition(entity, false)
    StartRace(race)
end

function OpenRaceMenu()
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'racing_menu',
        {
            title    = 'Zavody',
            align    = 'left',
            elements = {
                {label = 'Prvni Etapa', value = 'prvni'},
                {label = 'Druha Etapa', value = 'druha'},
                {label = 'Zebricek', value = 'scoreboard'}
            }
        },
        function(data, menu)
            if 
                data.current.value == 'prvni' or data.current.value == 'druha'
            then
                if 
                    (data.current.value == 'prvni' and ESX.Game.IsSpawnPointClear(Config.StartPosition1, 2.0)) or
                    (data.current.value == 'druha' and ESX.Game.IsSpawnPointClear(Config.StartPosition2, 2.0))
                then
                    menu.close()
                    if data.current.value == 'prvni' then
                        StartCountdown(data.current.value, Config.StartPosition1)
                    else
                        StartCountdown(data.current.value, Config.StartPosition2)
                    end
                else
                    ESX.ShowNotification("Nekdo prave startuje zavod, chvilku pockej!")
                end

            elseif data.current.value == 'scoreboard' then
                menu.close()
                ESX.UI.Menu.Open(
                    'default', GetCurrentResourceName(), 'racing_menu',
                    {
                        title    = 'Zavody',
                        align    = 'left',
                        elements = {
                            {label = 'Prvni Etapa', value = 'prvni'},
                            {label = 'Druha Etapa', value = 'druha'},
    
                        }
                    },
                    function(data2, menu2)
                        OpenScoreboard(data2.current.value, data2.current.label)
                        menu2.close()
                    end,
                function(data2, menu2)
                    menu2.close()
                end)
            end
        end,
    function(data, menu)
        menu.close()
    end)
end

function OpenScoreboard(race, label)

    local elem = {}

    ESX.TriggerServerCallback('esx-rally-races:getScoreboard', function(Races)

        if #Races < 1 then
            table.insert(elem, {label = "Zatim nikdo nezavodil"})
        end

        -- local sortedRaces = Races
        -- if #Races > 0 then
        --     table.sort(sortedRaces, function(a, b)
        --         return a.time - b.time
        --     end)
        -- end

        for i=1, #Races, 1 do
            table.insert(elem, {label = Races[i].name .. ' ' .. tonumber(string.format("%.2f", Races[i].time)) .. 's'})
        end

        ESX.UI.Menu.Open(
            'default', GetCurrentResourceName(), 'racing_scoreboard',
            {
                title    = label .. ' - Zebricek',
                align    = 'left',
                elements = elem
            },
            function(data, menu)
                menu.close()
            end,
        function(data, menu)
            menu.close()
        end)
    end, race)
end

--Counts the Config.checkpoints
function GetMaxCheckPoints(table, race)
    local checkpoints = 0

    for index, values in pairs(table[race]) do
        checkpoints = checkpoints + 1 
    end

    return checkpoints
end

function formatTimer(startTime, currTime)
    local newString = currTime - startTime
    local ms = string.sub(newString, -3, -2)
    local sec = string.sub(newString, -5, -4)
    local min = string.sub(newString, -7, -6)
    newString = string.format("%s%s.%s", min, sec, ms)

    return newString
end

LoadModel = function(model)
    while not HasModelLoaded(model) do
          RequestModel(model)
          Citizen.Wait(10)
    end
end
