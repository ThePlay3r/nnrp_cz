local isInZone = nil
local HasAlreadyEnteredMarker = false
local LastZone = nil
local isOpen = false

AddEventHandler('napojak3:hasEnteredMarker', function()
    isInZone = true
end)

AddEventHandler('napojak3:hasExitedMarker', function()
    isInZone = false
    CloseNapojak()
end)


-- Display markers
Citizen.CreateThread(function()
	while true do
        Wait(0)
   
        local coords = GetEntityCoords(GetPlayerPed(-1))

        for k,v in pairs(Config.Places) do
            if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.MarkersDrawDistance) then
                DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, false, 2, false, false, false, false)
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

        for k, v in pairs(Config.Places) do
            if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
                isInMarker = true
                currentZone = k
            end
        end

        if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
            HasAlreadyEnteredMarker = true
            LastZone = currentZone
            TriggerEvent('napojak3:hasEnteredMarker')
        end

        if not isInMarker and HasAlreadyEnteredMarker then
            HasAlreadyEnteredMarker = false
            TriggerEvent('napojak3:hasExitedMarker')
        end
	end
end)

function OpenNapojak()
    isOpen = true
    SendNUIMessage({
        type = 'open'
    })
end

function CloseNapojak()
    isOpen = false
    SendNUIMessage({
        type = 'close'
    })
end

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

        if isInZone then
            SetTextComponentFormat('STRING')
            if not isOpen then
                AddTextComponentString("Stiskni ~INPUT_CONTEXT~ pro checknuti napojoveho listku")
            else
                AddTextComponentString("Stiskni ~INPUT_CONTEXT~ pro zavreni napojoveho listku")
            end
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

            if IsControlJustReleased(0,  Config.Keys['E']) then
                if isOpen then
                    CloseNapojak()
                else
                    OpenNapojak()
                end
            end
		end
	end
end)