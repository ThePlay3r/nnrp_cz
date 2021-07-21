ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while not ESX.IsPlayerLoaded() do
		Citizen.Wait(5)
	end

	FetchSkills()

	while true do
		local seconds = Config.UpdateFrequency * 1000
		Citizen.Wait(seconds)

		for skill, value in pairs(Config.Skills) do
			UpdateSkill(skill, value["RemoveAmount"])
		end

		TriggerServerEvent("gamz-skillsystem:update", json.encode(Config.Skills))
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(15000)

		local ped = PlayerPedId()
		local vehicle = GetVehiclePedIsUsing(ped)

		if IsPedRunning(ped) then
			UpdateSkill("Stamina", 0.05)
		elseif IsPedSprinting(ped) then
			UpdateSkill("Stamina", 0.09)
		elseif IsPedInMeleeCombat(ped) then
			UpdateSkill("Strength", 0.05)
		elseif DoesEntityExist(vehicle) and GetVehicleClass(vehicle) == 13 then
			local speed = GetEntitySpeed(vehicle) * 3.6
			if speed >= 10 then
				UpdateSkill("Stamina", 0.09)
				UpdateSkill("Strength", 0.05)
			end
		elseif IsPedShooting(ped) then
			local distance = #(Config.Zones['ammu'] - GetEntityCoords(ped))
			if distance < 6 then
				UpdateSkill("Shooting", 0.8)
			end
		elseif IsPedArmed(ped, 4) then
			local distance = #(Config.Zones['ammu'] - GetEntityCoords(ped))
			if distance < 6 then
				UpdateSkill("Shooting", 0.09)
			end
		end
	end
end)