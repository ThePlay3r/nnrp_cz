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
	PlayerData = xPlayer
end)

function ScriptLoaded()
	Citizen.Wait(1000)
	LoadMarkers()
end

local AnimalPositions = {
    vector3(-732.8, 5169.35, 110.45),
    vector3(-1009.9, 5160.52, 122.48),
    vector3(-826.44, 4887.18, 276.3),
    vector3(-587.95, 4741.5, 210.71),
    vector3(-569.22, 5030.32, 133.12),
    vector3(-889.74, 5283.75, 84.43),
    vector3(-884.64, 5276.25, 85.74),
    vector3(-472.5, 5571.97, 72.29),
    vector3(-1170.41, 4791.35, 224.79),
    vector3(-1183.53, 4788.75, 222.53),
    vector3(-1180.96, 4798.66, 222.73),

    vector3(-614.93, 5181.86, 97.37),
    vector3(-604.99, 4802.45, 199.95),
    vector3(-481.36, 4905.5, 169.1),
    vector3(-1049.0, 5030.58, 180.33),
    vector3(-1311.62, 4940.97, 153.53),
    vector3(-1165.24, 5068.24, 143.19),
    vector3(-948.17, 5223.4, 110.84),
    vector3(-501.87, 5556.64, 71.76),
    vector3(-475.58, 5461.25, 84.61),
    vector3(-538.41, 5478.57, 66.55),
    vector3(-943.07, 5026.47, 172.02),
    vector3(-1133.49, 5089.82, 131.66),
    vector3(-467.87, 5420.61, 68.48),
    vector3(-846.68, 4858.4, 293.71),
}

local AnimalsInSession = {}

local Positions = {
	['StartHunting'] = { 
		['hint'] = '[E] Start Hunting', ['x'] = -810.57, ['y'] = 5409.83, ['z'] = 34.14,
		label = "Start lovu", BlipColor = 0, BlipSize = 1.2,
	},
	['HuntingArea'] = {
		label = "Lovecka oblast", BlipColor = 0, BlipCoords = vector3(-919.4957, 5032.860, 25.0), BlipSize = 2.0,
	},
	['Sell'] = {
		['hint'] = '[E] Prodat maso a kuzi',
		['x'] = 956.96, ['y'] = -2110.41, ['z'] = 30.55,
		label = "Lovecka Sezona - Prodej", BlipColor = 75, BlipSize = 1.2,
	},
	['SpawnATV'] = { ['x'] = -769.63067626953, ['y'] = 5592.7573242188, ['z'] = 33.48571395874 }
}

local OnGoingHuntSession = false

function LoadMarkers()

	Citizen.CreateThread(function()
		for index, v in pairs(Positions) do
			if index ~= 'SpawnATV' then
				local position = v
				if v.BlipCoords then
					position = v.BlipCoords
				end
				local StartBlip = AddBlipForCoord(position.x, position.y, position.z)
				SetBlipSprite(StartBlip, 141)
				SetBlipColour(StartBlip, v.BlipColor)
				SetBlipScale(StartBlip, v.BlipSize)
				SetBlipAsShortRange(StartBlip, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(v.label)
				EndTextCommandSetBlipName(StartBlip)
			end
		end
	end)

	LoadModel('blazer')
	LoadModel('a_c_deer')
	LoadAnimDict('amb@medic@standing@kneel@base')
	LoadAnimDict('anim@gangops@facility@servers@bodysearch@')

	Citizen.CreateThread(function()
		while true do
			local sleep = 500
			
			local plyCoords = GetEntityCoords(PlayerPedId())

			for index, value in pairs(Positions) do
				if value.hint ~= nil then

					if OnGoingHuntSession and index == 'StartHunting' and #AnimalsInSession < 23 then
						value.hint = '[E] Znovu zahajit lov'
					elseif OnGoingHuntSession and index == 'StartHunting' and #AnimalsInSession >= 23 then
						value.hint = 'LOV PROBIHA'
					elseif not OnGoingHuntSession and index == 'StartHunting' then
						value.hint = '[E] Zahajit lov'
					end

					local distance = GetDistanceBetweenCoords(plyCoords, value.x, value.y, value.z, true)

					if distance < 60.0 then
						sleep = 5
						DrawM(value.hint, 27, value.x, value.y, value.z - 0.945, 255, 255, 255, 1.5, 15)
						if distance < 1.0 then
							if IsControlJustReleased(0, Keys['E']) then
								if index == 'StartHunting' and #AnimalsInSession < 23 then
									PrepareHuntingSession()
								elseif index ~= 'StartHunting' then
									SellItems()
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

RegisterNetEvent('hunting:updateHuntingSession')
AddEventHandler('hunting:updateHuntingSession', function(animals)
	AnimalsInSession = animals
	OnGoingHuntSession = true
end)


function PrepareHuntingSession ()
	ESX.TriggerServerCallback("esx-qalle-hunting:getHunt", function (animals)
		if #animals > 0 and #animals < 23 then
			TriggerServerEvent('hunting:deleteAnimalForAll', animals)
			AnimalsInSession = {}
		end
		if #animals < 23 then
			OnGoingHuntSession = false
			ESX.ShowNotification('Lov zahajen!')
			StartHuntingSession()
		end
	end)
end

function StartHuntingSession()
	OnGoingHuntSession = true

	Citizen.CreateThread(function()
		for index, value in pairs(AnimalPositions) do
			local Animal = CreatePed(5, GetHashKey('a_c_deer'), value.x, value.y, value.z, 0.0, true, false)
			TaskWanderStandard(Animal, true, true)
			SetEntityAsMissionEntity(Animal, true, true)

			local networkId = NetworkGetNetworkIdFromEntity(Animal)
			SetNetworkIdCanMigrate(networkId, true)
			SetNetworkIdExistsOnAllMachines(networkId, true)
			NetworkSetNetworkIdDynamic(networkId, false)
			
			table.insert(AnimalsInSession, {id = networkId, x = value.x, y = value.y, z = value.z})
		end
		TriggerServerEvent("esx-qalle-hunting:startHunt", AnimalsInSession)		
	end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		while OnGoingHuntSession do
			local sleep = 500
			local PlyCoords = GetEntityCoords(PlayerPedId())

			for index, value in ipairs(AnimalsInSession) do
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
										table.remove(AnimalsInSession, index)
										TriggerServerEvent('esx-qalle-hunting:animalKilled', index)
										SlaughterAnimal(value.id)
										if #AnimalsInSession < 10 then
											ESX.ShowNotification("Jelenu uz je malo, je cas vratit se do tabora a znovu zahajit lov.")
										end
										exports['gamz-skillsystem'].UpdateSkill(GetPlayerPed(-1), 'Shooting', 0.1)
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

function SlaughterAnimal(AnimalId)

	TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
	TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )

	Citizen.Wait(5000)

	ClearPedTasksImmediately(PlayerPedId())

	local AnimalWeight = math.random(10, 160) / 10

	ESX.ShowNotification('Zabil jsi zvire a ziskal z nej ' ..AnimalWeight.. 'kg masa')

	TriggerServerEvent('esx-qalle-hunting:ILovePizzareward', AnimalWeight)
	TriggerServerEvent('hunting:deleteKilledAnimalForAll', AnimalId)
end

RegisterNetEvent('hunting:deleteKilledAnimal')
AddEventHandler('hunting:deleteKilledAnimal', function(AnimalId)
	local animal = nil
	if NetworkDoesNetworkIdExist(AnimalId) then
		animal = NetworkGetEntityFromNetworkId(AnimalId)
	end
	if DoesEntityExist(animal) then
		DeleteEntity(animal)
	end
end)

RegisterNetEvent('hunting:deleteAnimals')
AddEventHandler('hunting:deleteAnimals', function(animals)
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

function SellItems()
	TriggerServerEvent('esx-qalle-hunting:seILovePizzall')
end

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

RegisterCommand("chunting",function(source, args)
	print(#AnimalsInSession)
end)