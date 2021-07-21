local ESX = nil
local Blips = {}
local jobName = nil
local PlayersList = {}
local TrackedPlayer = nil
local TrackedPlayerName = nil
local currentTrackedIndex = 1

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    jobName = xPlayer.job.name
    
    Citizen.Wait(5000)
	TriggerServerEvent('izsblips:registerBlip')
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    jobName = job.name
    
    Citizen.Wait(5000)
	TriggerServerEvent('izsblips:registerBlip')
end)

-- CREATE AND HANDLE BLIPS 

local BlipColor = {
    ['police'] = 26,
    ['ambulance'] = 1,
    ['hasici'] = 10,
    ['sheriff'] = 5,
    ['state'] = 2,
}

function createBlip(id, jobName)
	local ped = GetPlayerPed(id)
	local blip = GetBlipFromEntity(ped)

	if not DoesBlipExist(blip) then
        blip = AddBlipForEntity(ped)
        
		SetBlipSprite(blip, 1)
		ShowHeadingIndicatorOnBlip(blip, true)
		SetBlipRotation(blip, math.ceil(GetEntityHeading(ped)))
        SetBlipNameToPlayerName(blip, id)
        SetBlipColour(blip, BlipColor[jobName])
		SetBlipScale(blip, 0.85)
        SetBlipAsShortRange(blip, true)

		table.insert(Blips, blip)
	end
end

function createPlayerBlipsOnMap (players)
    PlayersList = players

	for k, existingBlip in pairs(Blips) do
		RemoveBlip(existingBlip)
    end
    
    Blips = {}

    if jobName == 'police' or jobName == 'sheriff' or jobName == 'ambulance' or jobName == 'state' or jobName == 'hasici' then
        for k, v in ipairs(players) do
            local playerJobName = v.jobName
            if playerJobName == 'police' or playerJobName == 'sheriff' or playerJobName == 'ambulance' or playerJobName == 'state' or playerJobName == 'hasici' then
                local id = GetPlayerFromServerId(v.id)

                if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= PlayerPedId() then
                    createBlip(id, playerJobName)
                end
            end
        end
    end
end

RegisterNetEvent('izsblips:createBlips')
AddEventHandler('izsblips:createBlips', function(players)
    createPlayerBlipsOnMap(players)
end)

-- POSTALS
local function Draw2DText(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(6)
	SetTextProportional(6)
	SetTextScale(scale/1.0, scale/1.0)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)

	DrawText(0.477, 0.025)
	DrawRect(0.477, 0.038, 0.08, 0.035, 0, 0, 0, 150)
end

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(5)
        
        if TrackedPlayer then
            local coords = GetEntityCoords(GetPlayerPed(TrackedPlayer))
            local playerCoords = GetEntityCoords(GetPlayerPed(-1))
            local dist = #(playerCoords - coords)
            local msg = "Postal ~g~[" .. TrackedPlayerName .. "]~s~ " .. math.floor(dist) .. "m"
            Draw2DText(msg, 0, 1, 0.5, 0.92, 0.4, 255,255,255,255)
            SetNewWaypoint(coords.x, coords.y)
        end
	end
end)
local function handlePostal (source)
    if jobName == 'police' or jobName == 'sheriff' or jobName == 'ambulance' or jobName == 'state' or jobName == 'hasici' then
        if not source then
            SetWaypointOff()
            TrackedPlayer = nil
            TrackedPlayerName = nil
            currentTrackedIndex = 0
            return
        end
        
        local foundSource = nil

        for k,v in ipairs(PlayersList) do
            if v.id == source then
                local playerJobName = v.jobName

                if playerJobName == 'police' or playerJobName == 'sheriff' or playerJobName == 'ambulance' or playerJobName == 'state' or playerJobName == 'hasici' then
                    foundSource = GetPlayerFromServerId(v.id)
                end
            end
        end

        if NetworkIsPlayerActive(foundSource) then
            TrackedPlayer = foundSource
            TrackedPlayerName = source
        end
    end
end

RegisterCommand('postal', function(source, args)
    handlePostal(tonumber(args[1]))
end)
RegisterCommand('postaloff', function(source, args)
    handlePostal(nil)
end)
RegisterCommand('postalnext', function(source, args)
    if #PlayersList == 1 then
        handlePostal(PlayersList[1].id)
        return
    end
    if currentTrackedIndex < #PlayersList then
        currentTrackedIndex = currentTrackedIndex + 1
    elseif currentTrackedIndex == #PlayersList then
        currentTrackedIndex = 1
    end
    handlePostal(PlayersList[currentTrackedIndex].id)
end)
RegisterCommand('postalprev', function(source, args)
    if #PlayersList == 1 then
        handlePostal(PlayersList[1].id)
        return
    end
    if currentTrackedIndex > 1 then
        currentTrackedIndex = currentTrackedIndex - 1
    elseif currentTrackedIndex == 1 then
        currentTrackedIndex = #PlayersList
    end

    handlePostal(PlayersList[currentTrackedIndex].id)
end)

RegisterKeyMapping('postaloff', 'Vypnout postal', 'keyboard', '')
RegisterKeyMapping('postalnext', 'Nastavit postal na dalsiho', 'keyboard', '')
RegisterKeyMapping('postalprev', 'Nastavit postal na predchoziho', 'keyboard', '')

AddEventHandler('onClientResourceStart', function(resName)
    Wait(500)
  
    TriggerServerEvent('izsblips:enableIzsBlips', resName)
end)
  
AddEventHandler('onClientResourceStop', function(resName)
    Wait(500)
    
    TriggerServerEvent('izsblips:disableIzsBlips', resName)
end)