local ESX = nil
local training = false
local resting = false
local hasMembership = false
local restingTime = 0

local CurrentAction           = nil
local CurrentActionMsg        = ''

local HasAlreadyEnteredMarker = false
local LastZone = nil


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_gym:hasMembership')
AddEventHandler('esx_gym:hasMembership', function(hasGymCard)
	hasMembership = hasGymCard
end)

AddEventHandler('esx_gym:hasEnteredMarker', function(zone, action)
    CurrentAction     = zone
    CurrentActionMsg  = 'Zmackni ~INPUT_CONTEXT~ pro ' .. action
end)

AddEventHandler('esx_gym:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        local coords = GetEntityCoords(GetPlayerPed(-1))

        for k in pairs(Config.Workouts) do
            local name = Config.Workouts[k].name
            if #(Config.Workouts[k].coords - coords) < Config.MaxDrawDistance and not resting and not training then
                DrawMarker(
                    21, Config.Workouts[k].coords.x, Config.Workouts[k].coords.y, Config.Workouts[k].coords.z,
                    0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.3001,
                    Config.Colors[name].r, Config.Colors[name].g, Config.Colors[name].b, 255,
                    0, 0, 0, true
                )
            end
        end
        for k in pairs(Config.Shops) do
            if #(Config.Shops[k].coords - coords) < Config.MaxDrawDistance then
                DrawMarker(
                    21, Config.Shops[k].coords.x, Config.Shops[k].coords.y, Config.Shops[k].coords.z,
                    0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.3001, 0, 153, 255, 255, 0, 0, 0, true
                )
            end
        end
    end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Wait(0)

        local coords = GetEntityCoords(GetPlayerPed(-1))
        local isInMarker = false
        local currentZone = nil
        local zoneAction = nil

        if CurrentAction == nil then
            isInMarker = false
            currentZone = nil
            HasAlreadyEnteredMarker = false
        end

        for k, v in pairs(Config.Shops) do
            if(GetDistanceBetweenCoords(coords, v.coords.x, v.coords.y, v.coords.z, true) < 0.301) then
                isInMarker = true
                currentZone = v.name
                zoneAction = v.action
            end
        end

        for k, v in pairs(Config.Workouts) do
            if(GetDistanceBetweenCoords(coords, v.coords.x, v.coords.y, v.coords.z, true) < 0.301) and not training and not resting then
                isInMarker = true
                currentZone = v.name
                zoneAction = v.action
            end
        end

        if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
            HasAlreadyEnteredMarker = true
            LastZone = currentZone
            TriggerEvent('esx_gym:hasEnteredMarker', currentZone, zoneAction)
        end

        if not isInMarker and HasAlreadyEnteredMarker then
            HasAlreadyEnteredMarker = false
            TriggerEvent('esx_gym:hasExitedMarker', LastZone)
        end
    end
end)

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)

        if CurrentAction ~= nil then
            SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

            if IsControlJustReleased(0,  Config.Keys['E']) then
				if CurrentAction == 'shop' then
                    OpenGymMenu()
				end

				if CurrentAction == 'rentbike' then
                    OpenBikeMenu()
                end
                
                for k, v in pairs(Config.Workouts) do
                    if v.name == CurrentAction then
                        TriggerEvent('esx_gym:handleWorkout', v)
                    end
                end
				
				CurrentAction = nil
			end
		end
	end
end)

function LoadAnim(dict)
    while not HasAnimDictLoaded(dict) do
      RequestAnimDict(dict)
      Wait(10)
    end
end

AddEventHandler('esx_gym:handleWorkout', function(workout)
    if training == false and resting == false then
        training = true
        TriggerServerEvent('esx_gym:checkMembership')
        Citizen.Wait(1000)
    
        if hasMembership == true then
            training = true
            local playerPed = GetPlayerPed(-1)
            ClearPedTasksImmediately(playerPed)

            if workout.scenario then
                TaskStartScenarioInPlace(playerPed, workout.scenario, 0, true)
            else
                LoadAnim(workout.animationSet)
                TaskPlayAnim(
                    playerPed, workout.animationSet, workout.animation,
                    2.0, 2.0, 40000, 1, 0, false, false, false
                )
                RemoveAnimDict(workout.animationSet)
            end
            
            Citizen.Wait(40000)
            ClearPedTasksImmediately(playerPed)
            ESX.ShowNotification("Pred dalsim cvicenim si musis ~r~20 sekund ~w~odpocinout a vydychat se.")
            
            handleSkills(workout)
            TriggerServerEvent('esx_gym:handleStatus')
            startRest()
        elseif hasMembership == false then
            ESX.ShowNotification("Musis si zakoupit clenstvi!")
            training = false
        end
    end
end)

function handleSkills (workout)
    for label,value in pairs(workout.skills) do
        exports['gamz-skillsystem'].UpdateSkill(GetPlayerPed(-1), label, value)
    end
end

function startRest ()
    training = false
    resting = true

	while restingTime < 21 do
		Citizen.Wait(1000)
		restingTime = restingTime + 1
	end

	resting = false
	restingTime = 0
end

function OpenGymMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'gym_menu',
        {
            title    = 'Muscle Sands Gym',
            elements = {
				{label = 'Obchod', value = 'shop'},
				{label = 'Zakoupit karticku do posilky ($15000)', value = 'membership'},
            }
        },
        function(data, menu)
            if data.current.value == 'shop' then
				OpenGymShopMenu()
            elseif data.current.value == 'membership' then
				TriggerServerEvent('esx_gym:buyMembership')
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end

function OpenGymShopMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'gym_shop_menu',
        {
            title    = 'Posilovna - Obchod',
            elements = {
				{label = 'Proteinovy Shake ($800)', value = 'protein_shake'},
				{label = 'Voda ($250)', value = 'water'},
				{label = 'Proteinova tycinka ($550)', value = 'sportlunch'},
				{label = 'Energy Shot ($1000)', value = 'powerade'},
            }
        },
        function(data, menu)
            if data.current.value == 'protein_shake' then
				TriggerServerEvent('esx_gym:buyProteinshake')
            elseif data.current.value == 'water' then
				TriggerServerEvent('esx_gym:buyWater')
            elseif data.current.value == 'sportlunch' then
				TriggerServerEvent('esx_gym:buySportlunch')
            elseif data.current.value == 'powerade' then
				TriggerServerEvent('esx_gym:buyPowerade')
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end

function OpenBikeMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'bike_menu',
        {
            title    = 'Hire a bike',
            elements = {
				{label = 'BMX ($250)', value = 'bmx', action = 'esx_gym:hireBmx'},
				{label = 'Cruiser ($300)', value = 'cruiser', action = 'esx_gym:hireCruiser'},
				{label = 'Fixter ($329)', value = 'fixter', action = 'esx_gym:hireFixter'},
				{label = 'Scorcher ($400)', value = 'scorcher', action = 'esx_gym:hireScorcher'},
            }
        },
        function(data, menu)
            TriggerServerEvent(data.current.action)
            TriggerEvent('esx:spawnVehicle', data.current.value)
            
            ESX.UI.Menu.CloseAll()
        end,
        function(data, menu)
            menu.close()
        end
    )
end