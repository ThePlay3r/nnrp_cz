local ESX = nil
local isInTestDrive = false
local testVehicle = nil
local startTime = nil

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) 
            ESX = obj 
        end)

        Citizen.Wait(1)
    end
end)

function PrintInfo ()
	ESX.ShowNotification('Zahajil/a jsi testovaci jizdu. Na testovani sveho vysneneho vozidla mas 2 a pul minuty.')
	ESX.ShowNotification('Pokud opustis vozidlo, testovaci jizda se ukonci.')
	-- ESX.ShowNotification('Pokud se budes potrebovat dostat pryc z okruhu, napis /testjizdahelp')
end

function prepareTestDrive(vehicleModel, vehProps)
	if ESX.Game.IsSpawnPointClear(Config.Spawns[1], 2.0) then
		HandleTestDrive(vehicleModel, Config.Spawns[1], vehProps)
	elseif ESX.Game.IsSpawnPointClear(Config.Spawns[2], 2.0) then
		HandleTestDrive(vehicleModel, Config.Spawns[2], vehProps)
	elseif ESX.Game.IsSpawnPointClear(Config.Spawns[3], 2.0) then
		HandleTestDrive(vehicleModel, Config.Spawns[3], vehProps)
	else
		local playerPed = GetPlayerPed(-1)
		FreezeEntityPosition(playerPed, false)
		SetEntityVisible(playerPed, true)
		SetEntityCoords(playerPed, Config.ShopCoords.x, Config.ShopCoords.y, Config.ShopCoords.z)
		ESX.ShowNotification('Testovaci draha je obsazena, zkus to za chvilku nez ostatni odstartuji.')
	end
end

function HandleTestDrive(vehicleModel, spawnPoint, vehProps)
	local playerPed = GetPlayerPed(-1)

	SetEntityCoords(playerPed, spawnPoint.x, spawnPoint.y, spawnPoint.z)
	FreezeEntityPosition(playerPed, false)
	SetEntityVisible(playerPed, true)
	PrintInfo()
	-- Wait(2000)
	
	ESX.Game.SpawnVehicle(vehicleModel, spawnPoint, 239.43, function(vehicle)
		TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
		startTime = GetGameTimer()
		isInTestDrive = true
		testVehicle = vehicle
		if vehProps then
			ESX.Game.SetVehicleProperties(vehicle, vehProps)
		end
		exports['progressBars']:startUI(150000, "Testovaci jizda")
	end)
end

exports('handleTestDrive', prepareTestDrive)

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(500)

		if isInTestDrive then
			local playerPed = GetPlayerPed(-1)
			local thisIsTheEnd = startTime + 150000 <= GetGameTimer()
			
			if not IsPedInAnyVehicle(playerPed, false) or thisIsTheEnd then
				FreezeEntityPosition(playerPed, false)
				SetEntityVisible(playerPed, true)
				SetEntityVelocity(playerPed, 0.0, 0.0, 0.0)
				DeleteTestVehicleUsed()
				SetEntityCoords(playerPed, Config.ShopCoords.x, Config.ShopCoords.y, Config.ShopCoords.z)
				exports['progressBars']:closeUI()
				isInTestDrive = false
				testVehicle = nil
			end
		else
			Citizen.Wait(4500)
		end
    end
end) 

function DeleteTestVehicleUsed()
	local attempt = 0

	if testVehicle and DoesEntityExist(testVehicle) then
		while DoesEntityExist(testVehicle) and not NetworkHasControlOfEntity(testVehicle) and attempt < 100 do
			Citizen.Wait(100)
			NetworkRequestControlOfEntity(testVehicle)
			attempt = attempt + 1
		end

		if DoesEntityExist(testVehicle) and NetworkHasControlOfEntity(testVehicle) then
			ESX.Game.DeleteVehicle(testVehicle)
		end
	end
end

-- RegisterCommand("testjizdahelp", function()
-- 	local playerPed = GetPlayerPed(-1)
-- 	local coords = GetEntityCoords(playerPed)
-- 	local spawn = Config.Spawns[1]
-- 	local distance = #(spawn - coords)

-- 	if distance < 3500 then
-- 		DeleteTestVehicleUsed()
-- 		FreezeEntityPosition(playerPed, false)
-- 		SetEntityVisible(playerPed, true)
-- 		SetEntityCoords(playerPed, Config.ShopCoords.x, Config.ShopCoords.y, Config.ShopCoords.z)

-- 		exports['progressBars']:closeUI()
-- 		isInTestDrive = false
-- 		testVehicle = nil

-- 		if IsPedDeadOrDying(playerPed) then
-- 			TriggerEvent('esx_ambulancejob:reILovePizzavive')
-- 			TriggerEvent('mythic_hospital:client:ResetLimbs')
-- 			TriggerEvent('mythic_hospital:client:RemoveBleed')
-- 		end
-- 	end
-- end)