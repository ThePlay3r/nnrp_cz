ESX = nil

local runFirst = 0
local runSecond = 0

local RealDoorList = {}
local MyLastPosition = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while not ESX.GetPlayerData().job do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()

	-- Update the door list
	ESX.TriggerServerCallback('esx_doorlock:getDoorState', function(doorState)
		for index, category in pairs(doorState) do
			for index2, state2 in pairs(category) do
				Config.DoorList[index][index2].locked = state2
				if RealDoorList[index] and RealDoorList[index][index2] then
					RealDoorList[index][index2].locked = state2
				end
			end
		end
	end)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerCoords = GetEntityCoords(PlayerPedId())
		local distFromLastPosition = 250

		if MyLastPosition then
			distFromLastPosition = GetDistanceBetweenCoords(
				playerCoords.x, playerCoords.y, playerCoords.z,
				MyLastPosition.x, MyLastPosition.y, MyLastPosition.z,
				true
			)
		end

		if distFromLastPosition > 200 then
			RealDoorList = {}
			for doorKey in pairs(Config.DoorList) do
				for doorIndex in pairs(Config.DoorList[doorKey]) do
					local doors = Config.DoorList[doorKey][doorIndex]
					local doorCoords = nil
					if doors.doors then
						doorCoords = vector3(doors.doors[1].objCoords.x, doors.doors[1].objCoords.y, doors.doors[1].objCoords.z)
					else
						doorCoords = vector3(doors.objCoords.x, doors.objCoords.y, doors.objCoords.z)
					end
					
					local dist = #(playerCoords - doorCoords)
					if dist < 251 then
						if not RealDoorList[doorKey] then
							RealDoorList[doorKey] = {}
						end
						RealDoorList[doorKey][doorIndex] = doors
					end
				end
			end

			MyLastPosition = playerCoords
		end

		Citizen.Wait(1000)
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job) ESX.PlayerData.job = job end)

RegisterNetEvent('esx_doorlock:setDoorState')
AddEventHandler('esx_doorlock:setDoorState', function(categoryIndex, index, state)
	Config.DoorList[categoryIndex][index].locked = state
	if RealDoorList[categoryIndex] and RealDoorList[categoryIndex][index] then
		RealDoorList[categoryIndex][index].locked = state
	end
end)

function handleDoors (v, playerCoords)
	if v.doors then
		for k2, v2 in ipairs(v.doors) do
			if v2.object and DoesEntityExist(v2.object) then
				if k2 == 1 then
					v.distanceToPlayer = #(playerCoords - GetEntityCoords(v2.object))
				end

				if v.locked and v2.objHeading and ESX.Math.Round(GetEntityHeading(v2.object)) ~= v2.objHeading then
					if v.isSliding then
					else
						SetEntityHeading(v2.object, v2.objHeading)
					end
				end

				if not v.locked and v2.objHeadingOpen and ESX.Math.Round(GetEntityHeading(v2.object)) ~= v2.objHeadingOpen then
					if v.isSliding then
					else
						SetEntityHeading(v2.object, v2.objHeadingOpen)
					end
				end
			else
				v.distanceToPlayer = nil
				v2.object = GetClosestObjectOfType(v2.objCoords, 1.0, v2.objHash, false, false, false)
			end
		end
	else
		if v.object and DoesEntityExist(v.object) then
			v.distanceToPlayer = #(playerCoords - GetEntityCoords(v.object))

			if v.locked and v.objHeading and ESX.Math.Round(GetEntityHeading(v.object)) ~= v.objHeading then
				if v.isSliding then
				else
					SetEntityHeading(v.object, v.objHeading)
				end
			end

			if not v.locked and v.objHeadingOpen and ESX.Math.Round(GetEntityHeading(v.object)) ~= v.objHeadingOpen then
				if v.isSliding then
				else
					SetEntityHeading(v.object, v.objHeadingOpen)
				end
			end
		else
			v.distanceToPlayer = nil
			v.object = GetClosestObjectOfType(v.objCoords, 1.0, v.objHash, false, false, false)
		end
	end
end

Citizen.CreateThread(function()
	while true do
		local playerCoords = GetEntityCoords(PlayerPedId())
		-- for doorKey in pairs(Config.DoorList) do
		-- 	for doorIndex in pairs(Config.DoorList[doorKey]) do
		-- 		local doors = Config.DoorList[doorKey][doorIndex]
		-- 		-- doors.isAuthorized = false
		-- 		handleDoors(doors, playerCoords)
		-- 	end
		-- end
		for doorKey in pairs(RealDoorList) do
			for doorIndex in pairs(RealDoorList[doorKey]) do
				local doors = RealDoorList[doorKey][doorIndex]
				handleDoors(doors, playerCoords)
			end
		end

		if runFirst > 10 then
			Citizen.Wait(1000)
		else
			Citizen.Wait(400)
			runFirst = runFirst + 1
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local letSleep = true

		for doorKey in pairs(RealDoorList) do
			for doorIndex in pairs(RealDoorList[doorKey]) do
				local v = RealDoorList[doorKey][doorIndex]
				if v.distanceToPlayer and v.distanceToPlayer < (v.maxDistance + 25) then
					letSleep = false

					if v.doors then
						for k2,v2 in ipairs(v.doors) do
							FreezeEntityPosition(v2.object, v.locked)
						end
					else
						FreezeEntityPosition(v.object, v.locked)
					end
				end

				if v.distanceToPlayer and v.distanceToPlayer < v.maxDistance then
					local displayText = _U('unlocked')

					if v.locked then displayText = _U('locked') end

					if v.hideIconWithoutKey then
						if HasAccessToDrugDoors() then
							DrawText3D(v.textCoords, displayText)
						end
					elseif v.hideAll and v.locked then
						-- nothing
					else
						DrawText3D(v.textCoords, displayText)
					end
				end
			end
		end


		-- for doorKey in pairs(Config.DoorList) do
		-- 	for doorIndex in pairs(Config.DoorList[doorKey]) do
		-- 		local v = Config.DoorList[doorKey][doorIndex]
		-- 		if v.distanceToPlayer and v.distanceToPlayer < (v.maxDistance + 25) then
		-- 			letSleep = false

		-- 			if v.doors then
		-- 				for k2,v2 in ipairs(v.doors) do
		-- 					FreezeEntityPosition(v2.object, v.locked)
		-- 				end
		-- 			else
		-- 				FreezeEntityPosition(v.object, v.locked)
		-- 			end
		-- 		end

		-- 		if v.distanceToPlayer and v.distanceToPlayer < v.maxDistance then
		-- 			local displayText = _U('unlocked')

		-- 			if v.locked then displayText = _U('locked') end
		-- 			-- if v.isAuthorized then displayText = _U('press_button', displayText) end

		-- 			if v.hideIconWithoutKey then
		-- 				if HasAccessToDrugDoors() then
		-- 					DrawText3D(v.textCoords, displayText)
		-- 				end
		-- 			elseif v.hideAll and v.locked then
		-- 				-- nothing
		-- 			else
		-- 				DrawText3D(v.textCoords, displayText)
		-- 			end

		-- 			-- if IsControlJustReleased(0, 38) then
		-- 			-- 	if v.isAuthorized then
		-- 			-- 		v.locked = not v.locked
		-- 			-- 		TriggerServerEvent('esx_doorlock:updateState', doorKey, doorIndex, v.locked)
		-- 			-- 	end
		-- 			-- end
		-- 		end
		-- 	end
		-- end

		if letSleep then
			if runSecond > 10 then
				Citizen.Wait(1000)
			else
				Citizen.Wait(400)
				runSecond = runSecond + 1
			end
		end
	end
end)

function HasAccessToDrugDoors ()
	local jobs = {
		'offpolice', 'police', 'offambulance', 'ambulance', 'offhasici', 'hasici', 'offstate', 'state', 'offsheriff', 'sheriff',
	}

	if not ESX or not ESX.PlayerData.job then
		return false
	end

	local hasAccess = true

	for k, job in ipairs(jobs) do
		if job == ESX.PlayerData.job.name and hasAccess == true then
			return false
		end
	end

	return hasAccess
end

-- CREATE 3D TEXT
function DrawText3D (coords, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    SetDrawOrigin(coords.x, coords.y, coords.z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.015 + factor, 0.03, 1, 1, 1, 68)
    ClearDrawOrigin()
end

RegisterNetEvent("esx_doorlock:lockAnimation")
AddEventHandler("esx_doorlock:lockAnimation", function()
	local playerPed = GetPlayerPed(-1)
	FreezeEntityPosition(playerPed, true)
	LoadAnim("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
	TaskPlayAnim(
		playerPed, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer",
		2.0, 2.0, 1000, 51, 0, false, false, false
	)
	RemoveAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")

	Wait(1000)
	ClearPedTasksImmediately(playerPed)
	FreezeEntityPosition(playerPed, false)
end)

function LoadAnim(dict)
	while not HasAnimDictLoaded(dict) do
		RequestAnimDict(dict)
		Wait(10)
	end
end