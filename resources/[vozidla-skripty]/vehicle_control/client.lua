-- C O N F I G --
interactionDistance = 3.5 --The radius you have to be in to interact with the vehicle.
lockDistance = 25 --The radius you have to be in to lock your vehicle.

--  V A R I A B L E S --
engineoff = false
saved = false
controlsave_bool = false

-- E N G I N E --
IsEngineOn = true
RegisterNetEvent('engine')
AddEventHandler('engine',function() 
	local player = GetPlayerPed(-1)
	
	if (IsPedSittingInAnyVehicle(player)) then 
		local vehicle = GetVehiclePedIsIn(player,false)
		
		if IsEngineOn == true then
			IsEngineOn = false
			SetVehicleEngineOn(vehicle,false,false,false)
		else
			IsEngineOn = true
			SetVehicleUndriveable(vehicle,false)
			SetVehicleEngineOn(vehicle,true,false,false)
		end
		
		while (IsEngineOn == false) do
			SetVehicleUndriveable(vehicle,true)
			Citizen.Wait(0)
		end
	end
end)

RegisterNetEvent('engineoff')
AddEventHandler('engineoff',function() 
		local player = GetPlayerPed(-1)

        if (IsPedSittingInAnyVehicle(player)) then 
            local vehicle = GetVehiclePedIsIn(player,false)
			engineoff = true
			ShowNotification("Engine ~r~off~s~.")
			while (engineoff) do
			SetVehicleEngineOn(vehicle,false,false,false)
			SetVehicleUndriveable(vehicle,true)
			Citizen.Wait(0)
			end
		end
end)
RegisterNetEvent('engineon')
AddEventHandler('engineon',function() 
    local player = GetPlayerPed(-1)

        if (IsPedSittingInAnyVehicle(player)) then 
            local vehicle = GetVehiclePedIsIn(player,false)
			engineoff = false
			SetVehicleUndriveable(vehicle,false)
			SetVehicleEngineOn(vehicle,true,false,false)
			ShowNotification("Engine ~g~on~s~.")
	end
end)
-- T R U N K --
RegisterNetEvent('trunk')
AddEventHandler('trunk',function() 
	local player = GetPlayerPed(-1)
			if controlsave_bool == true then
				vehicle = saveVehicle
			else
				vehicle = GetVehiclePedIsIn(player,true)
			end
			
			local isopen = GetVehicleDoorAngleRatio(vehicle,5)
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,5,0,0)
				TriggerServerEvent('3dme:shareDisplay', "Otevírá kufr na dálku")
				Citizen.Wait(1000)
				TriggerServerEvent('3ddo:shareDisplay', "Kufr se otevrel")
				else
				SetVehicleDoorShut(vehicle,5,0)
				TriggerServerEvent('3dme:shareDisplay', "Zavírá kufr na dálku")
				Citizen.Wait(1000)
				TriggerServerEvent('3ddo:shareDisplay', "Kufr se zavrel")
				end
			else
				ShowNotification("~r~You must be near your vehicle to do that.")
			end
end)
-- R E A R  D O O R S --
RegisterNetEvent('rdoors')
AddEventHandler('rdoors',function() 
	local player = GetPlayerPed(-1)
    		if controlsave_bool == true then
				vehicle = saveVehicle
			else
				vehicle = GetVehiclePedIsIn(player,true)
			end
			local isopen = GetVehicleDoorAngleRatio(vehicle,2) and GetVehicleDoorAngleRatio(vehicle,3)
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,2,0,0)
				SetVehicleDoorOpen(vehicle,3,0,0)
				else
				SetVehicleDoorShut(vehicle,2,0)
				SetVehicleDoorShut(vehicle,3,0)
				end
			else
				ShowNotification("~r~You must be near your vehicle to do that.")
			end
end)		

-- H O O D --
RegisterNetEvent('hood')
AddEventHandler('hood',function() 
	local player = GetPlayerPed(-1)
    	if controlsave_bool == true then
			vehicle = saveVehicle
		else
			vehicle = GetVehiclePedIsIn(player,true)
		end
			
			local isopen = GetVehicleDoorAngleRatio(vehicle,4)
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,4,0,0)
				else
				SetVehicleDoorShut(vehicle,4,0)
				end
			else
				ShowNotification("~r~You must be near your vehicle to do that.")
			end
end)
-- L O C K --
RegisterNetEvent('lockLights')
AddEventHandler('lockLights',function()
local vehicle = saveVehicle
	StartVehicleHorn(vehicle, 100, 1, false)
	SetVehicleLights(vehicle, 2)
	Wait (200)
	SetVehicleLights(vehicle, 0)
	StartVehicleHorn(vehicle, 100, 1, false)
	Wait (200)
	SetVehicleLights(vehicle, 2)
	Wait (400)
	SetVehicleLights(vehicle, 0)
end)

RegisterNetEvent('lock')
AddEventHandler('lock',function()
	local player = GetPlayerPed(-1)
    local vehicle = saveVehicle
	local islocked = GetVehicleDoorLockStatus(vehicle)
	local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
		if DoesEntityExist(vehicle) then
			if distanceToVeh <= lockDistance then
				if (islocked == 1)then
				SetVehicleDoorsLocked(vehicle, 2)
				ShowNotification("Zamknul/a jsi vozidlo ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))) .. "~w~.")
				TriggerEvent('lockLights')
				else
				SetVehicleDoorsLocked(vehicle,1)
				ShowNotification("Odemknul/a jsi vozidlo ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))) .. "~w~.")
				TriggerEvent('lockLights')
				end
			else
				ShowNotification("~r~Musis byt blizko sveho vozidla aby jsi toto mohl/a udelat.")
			end
		else
			ShowNotification("~r~Nemas ulozene vozidlo.")
		end
	end)

function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end
-- S A V E --
RegisterNetEvent('save')
AddEventHandler('save',function() 
	local player = GetPlayerPed(-1)
	if (IsPedSittingInAnyVehicle(player)) then 
		if  saved == true then
			--remove from saved.
			saveVehicle = nil
			RemoveBlip(targetBlip)
			ShowNotification("Ulozene vozidlo ~r~odstraneno~w~.")
			saved = false
		else
			RemoveBlip(targetBlip)
			saveVehicle = GetVehiclePedIsIn(player,true)
			local vehicle = saveVehicle
			targetBlip = AddBlipForEntity(vehicle)
			SetBlipSprite(targetBlip,225)
			ShowNotification("This ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))) .. "~w~ is now your~g~ saved ~w~vehicle.")
			saved = true
		end
	end
end)
-- R E M O T E --
RegisterNetEvent('controlsave')
AddEventHandler('controlsave',function() 
		if controlsave_bool == false then
			controlsave_bool = true
			if saveVehicle == nil then
			ShowNotification("~r~Zadne ulozene vozidlo.")
			else
			ShowNotification("Ztratil/a jsi kontrolu nad vozidlem ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(saveVehicle))))
			end
		else
			controlsave_bool = false
			if saveVehicle == nil then
			ShowNotification("~r~Zadne ulozene vozidlo.")
			else
			ShowNotification("Ztratil/a jsi kontrolu nad vozidlem ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(saveVehicle))))
			end
		end
end)

RegisterCommand("engine", function(source, args)
    TriggerEvent('engine', source)   
end)

RegisterCommand("trunk", function(source, args)
    TriggerEvent('trunk', source)   
end)

RegisterCommand("rdoors", function(source, args)
    TriggerEvent('rdoors', source)   
end)

RegisterCommand("hood", function(source, args)
    TriggerEvent('hood', source)   
end)

RegisterCommand("lock", function(source, args)
    TriggerEvent('lock', source)   
end)

RegisterCommand("save", function(source, args)
    TriggerEvent('save', source)   
end)

RegisterCommand("sveh", function(source, args)
    TriggerEvent('controlsave', source)   
end)

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/engine',  'Zapnout/Vypnout motor')
	TriggerEvent('chat:addSuggestion', '/trunk',  'Otevřít/Zavřít kufr')
	TriggerEvent('chat:addSuggestion', '/rdoors',  'Otevřít/Zavřít dveře')
	TriggerEvent('chat:addSuggestion', '/hood',  'Otevřít/Zavřít kapotu')
	TriggerEvent('chat:addSuggestion', '/lock',  'Zamknout/odemknout auto')
	TriggerEvent('chat:addSuggestion', '/save',  'Nastavit aktivní vozidlo')
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('chat:removeSuggestion', '/engine')
		TriggerEvent('chat:removeSuggestion', '/trunk')
		TriggerEvent('chat:removeSuggestion', '/rdoors')
		TriggerEvent('chat:removeSuggestion', '/hood')
		TriggerEvent('chat:removeSuggestion', '/lock')
		TriggerEvent('chat:removeSuggestion', '/save')
	end
end)

