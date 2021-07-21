local ESX = nil

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

AddEventHandler('esx_lostmoto:hasEnteredMarker', function(zone)
    CurrentAction     = zone
    if zone == 'Spawner' or zone == 'Spawner2' then
        CurrentAction = 'Spawner'
        CurrentActionMsg  = 'Zmackni ~INPUT_CONTEXT~ pro zapujceni motorky'
    elseif zone == 'Deleter' then
        CurrentActionMsg  = 'Zmackni ~INPUT_CONTEXT~ pro uklizeni motorky'
    end
end)

AddEventHandler('esx_lostmoto:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        local coords = GetEntityCoords(GetPlayerPed(-1))

        for k, v in pairs(Config.Zones) do
            if #(Config.Zones[k].Pos - coords) < Config.MaxDrawDistance then
                DrawMarker(
                    Config.Zones[k].Type, Config.Zones[k].Pos.x, Config.Zones[k].Pos.y, Config.Zones[k].Pos.z,
                    0, 0, 0, 0, 0, 0, Config.Zones[k].Size.x, Config.Zones[k].Size.y, Config.Zones[k].Size.z, 0, 255, 50, 200, 0, 0, 0, true
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

        if CurrentAction == nil then
            isInMarker = false
            currentZone = nil
            HasAlreadyEnteredMarker = false
        end

        for k, v in pairs(Config.Zones) do
            if(GetDistanceBetweenCoords(coords, Config.Zones[k].Pos.x, Config.Zones[k].Pos.y, Config.Zones[k].Pos.z, true) < 2.0) then
                isInMarker = true
                currentZone = k
            end
        end

        if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
            HasAlreadyEnteredMarker = true
            LastZone = currentZone
            TriggerEvent('esx_lostmoto:hasEnteredMarker', currentZone)
        end

        if not isInMarker and HasAlreadyEnteredMarker then
            HasAlreadyEnteredMarker = false
            TriggerEvent('esx_lostmoto:hasExitedMarker', LastZone)
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
				if CurrentAction == 'Spawner' then
                    OpenMenu()
				end

                if CurrentAction == 'Deleter' then
                    DespawnVehicle()
                end

				CurrentAction = nil
			end
		end
	end
end)

function OpenMenu ()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'rent_shark',
        {
            title    = 'Pujcovna skutru',
            elements = {
                {label = 'Sanchez ($5000)', value = 'sanchez'},
                {label = 'Kawasaki KX450F ($5000)', value = 'kx450f'},
            }
        },
        function(data, menu)
            if data.current.value == 'sanchez' then
                TriggerServerEvent('lostmoto:rentShark')
                local playerPed = GetPlayerPed(-1)
                ESX.Game.SpawnVehicle('sanchez', {
                    x = 1094.2,
                    y = 2109.56,
                    z = 53.39
                  }, 322.27, function(vehicle)
                    TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1) -- teleport into vehicle
                end)
            end

            if data.current.value == 'kx450f' then
                TriggerServerEvent('lostmoto:rentShark')
                local playerPed = GetPlayerPed(-1)
                ESX.Game.SpawnVehicle('kx450f', {
                    x = 1094.2,
                    y = 2109.56,
                    z = 53.39
                  }, 322.27, function(vehicle)
                    TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1) -- teleport into vehicle
                end)
            end
            
            ESX.UI.Menu.CloseAll()
        end,
        function(data, menu)
            menu.close()
        end
    )
end

function DespawnVehicle ()
    local playerPed = GetPlayerPed(-1)
    if IsPedInAnyVehicle(playerPed,  false) then
        local vehicle = GetVehiclePedIsIn(playerPed,  false)

        ESX.Game.DeleteVehicle(vehicle)
    end
end