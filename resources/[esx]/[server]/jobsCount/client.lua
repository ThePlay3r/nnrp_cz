local ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    Citizen.Wait(5000)
	TriggerServerEvent('jobscount:registerJob')
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function()
    Citizen.Wait(5000)
	TriggerServerEvent('jobscount:registerJob')
end)