local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
local isInPointZero = false

function getFromPointZero (coords)
	local hlgaraz = vector3(220.03, -814.61, 30.97)
	local playerPos = GetEntityCoords(GetPlayerPed(-1))
	local lastPositionDist = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, playerPos.x, playerPos.y, playerPos.z, true)

	if lastPositionDist > 50 then
		SetEntityCoords(GetPlayerPed(-1), coords.x, coords.y, coords.z)
	else
		SetEntityCoords(GetPlayerPed(-1), hlgaraz.x, hlgaraz.y, hlgaraz.z)
	end
end

RegisterNetEvent("nncore:getFromPointZero")
AddEventHandler("nncore:getFromPointZero", function(coords)
	if isInPointZero then
		getFromPointZero(coords)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		if isInPointZero then
			SetTextComponentFormat('STRING')
			AddTextComponentString("Pro zachranu z propasti napis ~g~/pzero~s~")
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3000)
		local playerPos = GetEntityCoords(GetPlayerPed(-1))
		local coords = vector3(0.0, 0.0, 0.0)
		local distance = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, playerPos.x, playerPos.y, playerPos.z, true)

		if distance < 30 then
			isInPointZero = true
		else
			isInPointZero = false
		end
	end
end)