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

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end

	ScriptLoaded()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	jobName = xPlayer.job.name
	jobGrade = xPlayer.job.grade_name
	TriggerEvent('esx_ranchjob:handleBlips', jobName)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    jobName = job.name
	jobGrade = job.grade_name
	TriggerEvent('esx_ranchjob:handleBlips', jobName)
end)

function ScriptLoaded()
	Citizen.Wait(1000)
	LoadMarkers()
end

local MUST_KILL_ANIMALS = 28

local CowPositions = {
	vector3(1403.92, 1077.22, 113.33),
	vector3(1398.05, 1077.59, 113.33),
	vector3(1396.79, 1072.42, 113.33),
	vector3(1401.51, 1067.12, 113.33),
	vector3(1403.68, 1072.18, 113.33),
	vector3(1414.08, 1078.72, 113.33),
	vector3(1417.21, 1079.68, 113.33),
	vector3(1421.33, 1074.13, 113.34),
	vector3(1419.8, 1068.27, 113.33),
	vector3(1413.75, 1068.18, 113.33),
	vector3(1446.34, 1074.02, 113.33),
	vector3(1451.81, 1073.89, 113.33),
	vector3(1450.54, 1071.78, 113.33),
	vector3(1443.5, 1068.51, 113.34),
	vector3(1448.53, 1069.17, 113.33),
}

local PigPositions = {
	vector3(1414.89, 1089.8, 113.33),
	vector3(1415.9, 1096.13, 113.34),
	vector3(1418.86, 1101.38, 113.35),
	vector3(1421.12, 1097.08, 113.38),
	vector3(1418.92, 1091.66, 113.32),
	vector3(1404.16, 1088.96, 113.33),
	vector3(1398.34, 1089.96, 113.33),
	vector3(1397.65, 1094.09, 113.33),
	vector3(1398.44, 1100.37, 113.33),
	vector3(1404.39, 1099.02, 113.34),
	vector3(1443.12, 1063.32, 113.36),
	vector3(1446.86, 1059.27, 113.33),
	vector3(1450.74, 1061.08, 113.33),
	vector3(1457.33, 1064.08, 113.33),
	vector3(1452.9, 1062.06, 113.33),
}

local CowsAndPigsInSession = {}

local Positions = {
    ['StartHunting'] = { 
			['hint'] = '[E] Start Hunting', ['x'] = 1409.07, ['y'] = 1084.78, ['z'] = 114.33,
			label = "Pripustit zvirata", BlipColor = 0, BlipSize = 1.2, 
    }
}

local OnGoingHuntSession = false

function LoadMarkers()

	LoadModel('a_c_pig')
	LoadModel('a_c_cow')
	LoadAnimDict('amb@medic@standing@kneel@base')
	LoadAnimDict('anim@gangops@facility@servers@bodysearch@')

	Citizen.CreateThread(function()
		while true do
			local sleep = 500
			
			local plyCoords = GetEntityCoords(PlayerPedId())
		if jobName == 'ranch' then
			for index, value in pairs(Positions) do
				if value.hint ~= nil then

					if OnGoingHuntSession and index == 'StartHunting' and #CowsAndPigsInSession < MUST_KILL_ANIMALS then
						value.hint = '[E] Znovu pripustit zvirata'
					elseif OnGoingHuntSession and index == 'StartHunting' and #CowsAndPigsInSession >= MUST_KILL_ANIMALS then
						value.hint = 'PRIPUSTENI PROBIHA'
					elseif not OnGoingHuntSession and index == 'StartHunting' then
						value.hint = '[E] Pripustit zvirata'
					end

					local distance = GetDistanceBetweenCoords(plyCoords, value.x, value.y, value.z, true)

					if distance < 60.0 then
						sleep = 5
						DrawM(value.hint, 27, value.x, value.y, value.z - 0.945, 255, 255, 255, 1.5, 15)
						if distance < 1.0 then
							if IsControlJustReleased(0, Keys['E']) then
								if index == 'StartHunting' and #CowsAndPigsInSession < MUST_KILL_ANIMALS then
									PrepareHuntingSession()
								elseif index ~= 'StartHunting' then
									SellItems()
								end
							end
						end
					end

				end
				
			end
		end
			Citizen.Wait(sleep)
		end
	end)
end

RegisterNetEvent('ranchjob2:updateHuntingSession')
AddEventHandler('ranchjob2:updateHuntingSession', function(animals)
	CowsAndPigsInSession = animals
	OnGoingHuntSession = true
end)


function PrepareHuntingSession ()
	ESX.TriggerServerCallback("ranchjob2:getHunt", function (animals)
		if #animals > 0 and #animals < MUST_KILL_ANIMALS then
			TriggerServerEvent('ranchjob2:deleteAnimalForAll', animals)
			CowsAndPigsInSession = {}
		end
		if #animals < MUST_KILL_ANIMALS then
			OnGoingHuntSession = false
			ESX.ShowNotification('Pripusteni zahajeno!')
			StartHuntingSession()
		end
	end)
end

function StartHuntingSession()
	OnGoingHuntSession = true

	Citizen.CreateThread(function()
		local animals = {}

		for index, value in ipairs(CowPositions) do
			table.insert(animals, {pos = value, type = 'a_c_cow'})
		end
		for index, value in ipairs(PigPositions) do
			table.insert(animals, {pos = value, type = 'a_c_pig'})
		end
		
		for index, value in ipairs(animals) do
			local Animal = CreatePed(5, GetHashKey(value.type), value.pos.x, value.pos.y, value.pos.z, 0.0, true, false)
			TaskWanderStandard(Animal, true, true)
			SetEntityAsMissionEntity(Animal, true, true)

			local networkId = NetworkGetNetworkIdFromEntity(Animal)
			SetNetworkIdCanMigrate(networkId, true)
			SetNetworkIdExistsOnAllMachines(networkId, true)
			NetworkSetNetworkIdDynamic(networkId, false)
			
			table.insert(CowsAndPigsInSession, {id = networkId, x = value.pos.x, y = value.pos.y, z = value.pos.z, type = value.type})
		end
		TriggerServerEvent("ranchjob2:startHunt", CowsAndPigsInSession)		
	end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		while OnGoingHuntSession do
			local sleep = 500
			local PlyCoords = GetEntityCoords(PlayerPedId())

			for index, value in ipairs(CowsAndPigsInSession) do
				local animalId = nil
				if NetworkDoesNetworkIdExist(value.id) then
					animalId = NetworkGetEntityFromNetworkId(value.id)
				end

				if DoesEntityExist(animalId) then
					local AnimalCoords = GetEntityCoords(animalId)
					local AnimalHealth = GetEntityHealth(animalId)
					local PlyToAnimal = GetDistanceBetweenCoords(PlyCoords, AnimalCoords, true)

					if AnimalHealth <= 0 then
						if PlyToAnimal < 2.0 then
							sleep = 5

							ESX.Game.Utils.DrawText3D({x = AnimalCoords.x, y = AnimalCoords.y, z = AnimalCoords.z + 1}, '[E] Zpracovat zvire', 0.4)
							
							if IsControlJustReleased(0, Keys['E']) then
								local selectedWeapon = GetSelectedPedWeapon(PlayerPedId())
								if selectedWeapon == GetHashKey('WEAPON_KNIFE') or selectedWeapon == GetHashKey("WEAPON_SWITCHBLADE")  then
									if DoesEntityExist(animalId) then
										table.remove(CowsAndPigsInSession, index)
										TriggerServerEvent('ranchjob2:animalKilled', index)
										SlaughterAnimal(value.id, value.type)
										if #CowsAndPigsInSession < MUST_KILL_ANIMALS then
											ESX.ShowNotification("Zvirat v ohrade je jiz malo, je cas pripustit zvirata.")
										end
									end
								else
									ESX.ShowNotification('Musis pouzit nuz!')
								end
							end

						end
					end
				end
			end

			Citizen.Wait(sleep)
		end
	end
end)

function SlaughterAnimal(AnimalId, type)

	TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
	TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )

	Citizen.Wait(5000)

	ClearPedTasksImmediately(PlayerPedId())

	ESX.ShowNotification('Zabil jsi zvire a ziskal z nej maso')

	TriggerServerEvent('ranchjob2:reward', type)
	TriggerServerEvent('ranchjob2:deleteKilledAnimalForAll', AnimalId)
end

RegisterNetEvent('ranchjob2:deleteKilledAnimal')
AddEventHandler('ranchjob2:deleteKilledAnimal', function(AnimalId)
	local animal = nil
	if NetworkDoesNetworkIdExist(AnimalId) then
		animal = NetworkGetEntityFromNetworkId(AnimalId)
	end
	if DoesEntityExist(animal) then
		DeleteEntity(animal)
	end
end)

RegisterNetEvent('ranchjob2:deleteAnimals')
AddEventHandler('ranchjob2:deleteAnimals', function(animals)
	for index, value in ipairs(animals) do
		local AnimalId = value.id
		local animal = nil
		if NetworkDoesNetworkIdExist(AnimalId) then
			animal = NetworkGetEntityFromNetworkId(AnimalId)
		end
		if DoesEntityExist(animal) then
			DeleteEntity(animal)
		end
	end
end)

function LoadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(10)
    end    
end

function LoadModel(model)
    while not HasModelLoaded(model) do
          RequestModel(model)
          Citizen.Wait(10)
    end
end

function DrawM(hint, type, x, y, z)
	ESX.Game.Utils.DrawText3D({x = x, y = y, z = z + 1.0}, hint, 0.4)
	DrawMarker(type, x, y, z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 255, 255, 255, 100, false, true, 2, false, false, false, false)
end