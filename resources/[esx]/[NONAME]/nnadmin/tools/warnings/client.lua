local ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

-- COMMAND
RegisterCommand("warn", function(source, args)
    local message = args
	local target = args[1]
        table.remove(message , 1)
        message = table.concat(message , ' ')

	ESX.TriggerServerCallback("warnings:warn", function(success) end, target, message)
end)

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/warn',  'Varovat hráče', {
		{ name = "id", help = "ID hrace"},
		{ name = "text", help = "Text varování"},
	})
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('chat:removeSuggestion', '/warn')
	end
end)

-- USER EVENT
RegisterNetEvent("warnings:receiveWarn")
AddEventHandler("warnings:receiveWarn",function(admin, message)
	TriggerEvent("chat:addMessage", {color={255,255,0}, multiline = true, args={"VAROVÁNÍ: ", "Dostal jsi varování od " .. admin .."!\n-> "..message}})
	
	Citizen.CreateThread(function()
		local scaleform = RequestScaleformMovie("mp_big_message_freemode")
		while not HasScaleformMovieLoaded(scaleform) do Citizen.Wait(0) end
		
		BeginScaleformMovieMethod(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
		PushScaleformMovieMethodParameterString("~y~VAROVÁNÍ")
		PushScaleformMovieMethodParameterString(message)
		PushScaleformMovieMethodParameterInt(5)
		EndScaleformMovieMethod()
		PlaySoundFrontend(-1, "LOSER", "HUD_AWARDS")
		
		local drawing = true
		Citizen.SetTimeout(Config.warning_screentime, function()
			drawing = false
		end)
		while drawing do
			Citizen.Wait(0)
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
		end
		SetScaleformMovieAsNoLongerNeeded(scaleform)
	end)
end)