Citizen.CreateThread(function()
    local dict = "anim@amb@nightclub@peds@"
    
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
    local handsup = false
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1, 47) then --Start holding g
            if not handsup then
                TaskPlayAnim(GetPlayerPed(-1), dict, "rcmme_amanda1_stand_loop_cop", 2.5, 2.5, -1, 50, 0, false, false, false)
                handsup = true
            else
                handsup = false
                ClearPedTasks(GetPlayerPed(-1))
            end
        end
        if IsControlJustReleased(1, 47) then
            handsup = false
            ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)
	