local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX 			    			= nil

local cokeQTE       			= 0
local coke_poochQTE 			= 0
local weedQTE					= 0
local weed_poochQTE 			= 0
local methQTE					= 0
local meth_poochQTE 			= 0
local opiumQTE					= 0
local opium_poochQTE 			= 0
local cigarQTE					= 0
local cigar_poochQTE 			= 0
local lsdQTE					= 0
local lsd_poochQTE 			= 0

local myJob 					= nil
local jobName = nil
local jobGrade = nil
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local isInZone                  = false
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}
local count = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	jobName = xPlayer.job.name
	jobGrade = xPlayer.job.grade_name
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	jobName = job.name
	jobGrade = job.grade_name
end)

AddEventHandler('esx_drugs:hasEnteredMarker', function(zone)
	if jobName == 'police' or jobName == 'state' or jobName == 'ambulance' or jobName == 'sheriff' or jobName == 'hasici' or 
	jobName == 'offpolice' or jobName == 'offstate' or jobName == 'offambulance' or jobName == 'offsheriff' or jobName == 'offhasici' then
		return
	end

	ESX.UI.Menu.CloseAll()
	
	if zone == 'exitMarker' then
		CurrentAction     = zone
		CurrentActionMsg  = _U('exit_marker')
		CurrentActionData = {}
	end
	
	if zone == 'CokeField' then
		CurrentAction     = zone
		CurrentActionMsg  = _U('press_collect_coke')
		CurrentActionData = {}
	end

	if zone == 'CokeProcessing' then
		if cokeQTE >= 5 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_process_coke')
			CurrentActionData = {}
		end
	end

	if zone == 'CokeDealer' then
		if coke_poochQTE >= 1 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_sell_coke')
			CurrentActionData = {}
		end
	end

	if zone == 'MethField' then
		CurrentAction     = zone
		CurrentActionMsg  = _U('press_collect_meth')
		CurrentActionData = {}
	end

	if zone == 'MethProcessing' then
		if methQTE >= 5 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_process_meth')
			CurrentActionData = {}
		end
	end

	if zone == 'MethDealer' then
		if meth_poochQTE >= 1 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_sell_meth')
			CurrentActionData = {}
		end
	end

	if zone == 'WeedField' then
		CurrentAction     = zone
		CurrentActionMsg  = _U('press_collect_weed')
		CurrentActionData = {}
	end

	if zone == 'WeedProcessing' then
		if weedQTE >= 5 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_process_weed')
			CurrentActionData = {}
		end
	end

	if zone == 'WeedDealer' then
		if weed_poochQTE >= 1 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_sell_weed')
			CurrentActionData = {}
		end
	end

	if zone == 'OpiumField' then
		CurrentAction     = zone
		CurrentActionMsg  = _U('press_collect_opium')
		CurrentActionData = {}
	end

	if zone == 'OpiumProcessing' then
		if opiumQTE >= 5 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_process_opium')
			CurrentActionData = {}
		end
	end

	if zone == 'OpiumDealer' then
		if opium_poochQTE >= 1 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_sell_opium')
			CurrentActionData = {}
		end
	end

	if zone == 'CigarField' and jobName == 'lost' then
		CurrentAction     = zone
		CurrentActionMsg  = _U('press_collect_cigar')
		CurrentActionData = {}
	end

	if zone == 'CigarProcessing' and jobName == 'lost' then
		if cigarQTE >= 5 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_process_cigar')
			CurrentActionData = {}
		end
	end

	if zone == 'CigarDealer' and jobName == 'lost' and jobGrade ~= 'prospect' then
		if cigar_poochQTE >= 1 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_sell_cigar')
			CurrentActionData = {}
		end
	end

	if zone == 'LsdField' then
		CurrentAction     = zone
		CurrentActionMsg  = _U('press_collect_lsd')
		CurrentActionData = {}
	end

	if zone == 'LsdProcessing' then
		if lsdQTE >= 5 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_process_lsd')
			CurrentActionData = {}
		end
	end

	if zone == 'LsdDealer' then
		if lsd_poochQTE >= 1 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_sell_lsd')
			CurrentActionData = {}
		end
	end
end)

AddEventHandler('esx_drugs:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()

	TriggerServerEvent('esx_drugs:stopHarvILovePizzaestCoke')
	TriggerServerEvent('esx_drugs:stopTranILovePizzasformCoke')
	TriggerServerEvent('esx_drugs:stopSellILovePizzaCoke')
	TriggerServerEvent('esx_drugs:stopHarvesILovePizzatMeth')
	TriggerServerEvent('esx_drugs:stopTranILovePizzasformMeth')
	TriggerServerEvent('esx_drugs:stopSellMILovePizzaeth')
	TriggerServerEvent('esx_drugs:stopHarILovePizzavestWeed')
	TriggerServerEvent('esx_drugs:stopTILovePizzaransformWeed')
	TriggerServerEvent('esx_drugs:stopSellWILovePizzaeed')
	TriggerServerEvent('esx_drugs:stopHarvestILovePizzaOpium')
	TriggerServerEvent('esx_drugs:stopTransILovePizzaformOpium')
	TriggerServerEvent('esx_drugs:stopSellOpiuILovePizzam')
	TriggerServerEvent('esx_drugs:stopHarvestCigar')
	TriggerServerEvent('esx_drugs:stopTransformCigar')
	TriggerServerEvent('esx_drugs:stopSellCigar')
	TriggerServerEvent('esx_drugs:stopHarvestLsd')
	TriggerServerEvent('esx_drugs:stopTransformLsd')
	TriggerServerEvent('esx_drugs:stopSellLsd')
end)

-- Weed Effect
RegisterNetEvent('esx_drugs:onPotWithoutEffect')
AddEventHandler('esx_drugs:onPotWithoutEffect', function()
	TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING", 0, true)
	Citizen.Wait(75000)
	ClearPedTasksImmediately(GetPlayerPed(-1))
end)

RegisterNetEvent('esx_drugs:onPot')
AddEventHandler('esx_drugs:onPot', function()
	RequestAnimSet("MOVE_M@DRUNK@SLIGHTLYDRUNK")
	while not HasAnimSetLoaded("MOVE_M@DRUNK@SLIGHTLYDRUNK") do
		Citizen.Wait(0)
	end
	TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING_POT", 0, true)
	Citizen.Wait(5000)
	DoScreenFadeOut(1000)
	Citizen.Wait(1000)
	ClearPedTasksImmediately(GetPlayerPed(-1))
	SetTimecycleModifier("spectator5")
	SetPedMotionBlur(GetPlayerPed(-1), true)
	SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
	SetPedIsDrunk(GetPlayerPed(-1), true)
	DoScreenFadeIn(1000)
	Citizen.Wait(300000)
	DoScreenFadeOut(1000)
	Citizen.Wait(1000)
	DoScreenFadeIn(1000)
	ClearTimecycleModifier()
	ResetScenarioTypesEnabled()
	ResetPedMovementClipset(GetPlayerPed(-1), 0)
	SetPedIsDrunk(GetPlayerPed(-1), false)
	SetPedMotionBlur(GetPlayerPed(-1), false)
end)

-- Render markers
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		local coords = GetEntityCoords(GetPlayerPed(-1))

		for k,v in pairs(Config.Zones) do
			local isAllowed = true
			if v.job and v.job == 'lost' and k == 'CigarDealer' and jobGrade == 'prospect' then
				isAllowed = false
			end
			if isAllowed and v.job and v.job == jobName or not v.job then
				if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.DrawDistance) then
					DrawMarker(Config.MarkerType, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
				end
			end
		end

	end
end)

-- Create blips


-- RETURN NUMBER OF ITEMS FROM SERVER
RegisterNetEvent('esx_drugs:ReturnInventory')
AddEventHandler('esx_drugs:ReturnInventory', function(cokeNbr, cokepNbr, methNbr, methpNbr, weedNbr, weedpNbr, opiumNbr, opiumpNbr, cigarNbr, cigarpNbr, lsdNbr, lsdpNbr, jobName, currentZone, zoneCoords)
	cokeQTE	   = cokeNbr
	coke_poochQTE = cokepNbr
	methQTE 	  = methNbr
	meth_poochQTE = methpNbr
	weedQTE 	  = weedNbr
	weed_poochQTE = weedpNbr
	opiumQTE	   = opiumNbr
	opium_poochQTE = opiumpNbr
	cigarQTE = cigarNbr
	cigar_poochQTE = cigarpNbr
	lsdQTE = lsdNbr
	lsd_poochQTE = lsdpNbr
	myJob		 = jobName
	local coords      = GetEntityCoords(GetPlayerPed(-1))
	if(GetDistanceBetweenCoords(coords, zoneCoords.x, zoneCoords.y, zoneCoords.z, true) < Config.ZoneSize.x) then
		TriggerEvent('esx_drugs:hasEnteredMarker', currentZone)
	end
end)

-- Activate menu when player is inside marker
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil
		local zoneCoords = nil

		for k,v in pairs(Config.Zones) do
			if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.ZoneSize.x) then
				isInMarker  = true
				currentZone = k
				zoneCoords = vector3(v.x, v.y, v.z)
			end
		end
		if isInMarker and not HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = true
			lastZone				= currentZone
			if not isInZone then
				TriggerServerEvent('esx_drugs:GetUserInventory', currentZone, zoneCoords)
			end
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_drugs:hasExitedMarker', lastZone)
		end

		if isInMarker and isInZone then
			TriggerEvent('esx_drugs:hasEnteredMarker', 'exitMarker')
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)

		if CurrentAction ~= nil then
			SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			if IsControlJustReleased(0, Keys['E']) then
				isInZone = true -- unless we set this boolean to false, we will always freeze the user
				if CurrentAction == 'exitMarker' then
					isInZone = false -- do not freeze user
					TriggerEvent('esx_drugs:freezePlayer', false)
					TriggerEvent('esx_drugs:hasExitedMarker', lastZone)
					Citizen.Wait(3000)
				
				elseif CurrentAction == 'CokeField' then
					TriggerServerEvent('esx_drugs:startHarvestILovePizzaCoke')
				elseif CurrentAction == 'CokeProcessing' then
					TriggerServerEvent('esx_drugs:startTransILovePizzaformCoke')
				elseif CurrentAction == 'CokeDealer' then
					TriggerServerEvent('esx_drugs:startSellCILovePizzaoke')
				
				elseif CurrentAction == 'MethField' then
					TriggerServerEvent('esx_drugs:startHarILovePizzavestMeth')
				elseif CurrentAction == 'MethProcessing' then
					TriggerServerEvent('esx_drugs:startTILovePizzaransformMeth')
				elseif CurrentAction == 'MethDealer' then
					TriggerServerEvent('esx_drugs:startSellMILovePizzaeth')
				
				elseif CurrentAction == 'WeedField' then
					TriggerServerEvent('esx_drugs:startHarvestWILovePizzaeed')
				elseif CurrentAction == 'WeedProcessing' then
					TriggerServerEvent('esx_drugs:startTransfoILovePizzarmWeed')
				elseif CurrentAction == 'WeedDealer' then
					TriggerServerEvent('esx_drugs:startSellWeILovePizzaed')
				
				elseif CurrentAction == 'OpiumField' then
					TriggerServerEvent('esx_drugs:startHILovePizzaarvestOpium')
				elseif CurrentAction == 'OpiumProcessing' then
					TriggerServerEvent('esx_drugs:starILovePizzatTransformOpium')
				elseif CurrentAction == 'OpiumDealer' then
					TriggerServerEvent('esx_drugs:startSellILovePizzaOpium')

				elseif CurrentAction == 'CigarField' then
					TriggerServerEvent('esx_drugs:startHarvestCigar')
				elseif CurrentAction == 'CigarProcessing' then
					TriggerServerEvent('esx_drugs:startTransformCigar')
				elseif CurrentAction == 'CigarDealer' then
					TriggerServerEvent('esx_drugs:startSellCigar')

				elseif CurrentAction == 'LsdField' then
					TriggerServerEvent('esx_drugs:startHarvestLsd')
				elseif CurrentAction == 'LsdProcessing' then
					TriggerServerEvent('esx_drugs:startTransformLsd')
				elseif CurrentAction == 'LsdDealer' then
					TriggerServerEvent('esx_drugs:startSellLsd')

				else
					isInZone = false -- not a esx_drugs zone
				end
				
				if isInZone then
					TriggerEvent('esx_drugs:freezePlayer', true)
				end
				
				CurrentAction = nil
			end
		end
	end
end)

RegisterNetEvent('esx_drugs:freezePlayer')
AddEventHandler('esx_drugs:freezePlayer', function(freeze)
	FreezeEntityPosition(GetPlayerPed(-1), freeze)
end)
