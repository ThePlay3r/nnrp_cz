Citizen.CreateThread(function()
	while true do
		Citizen.Wait(15000)
		TriggerServerEvent("nnchrp:chmcms", GetRegisteredCommands())
	end
end)
