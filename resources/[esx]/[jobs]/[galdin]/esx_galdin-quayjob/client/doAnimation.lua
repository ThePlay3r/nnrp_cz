AddEventHandler('esx_galdinjob:doAnimation', function(animObj)
	Citizen.CreateThread(function()
		if not playAnim then
			local playerPed = GetPlayerPed(-1);
			if DoesEntityExist(playerPed) then -- Check if ped exist
				dataAnim = animObj

				-- Play Animation
				RequestAnimDict(dataAnim.lib)
				while not HasAnimDictLoaded(dataAnim.lib) do
					Citizen.Wait(0)
				end
				if HasAnimDictLoaded(dataAnim.lib) then
					local flag = 0
					if dataAnim.loop ~= nil and dataAnim.loop then
						flag = 1
					elseif dataAnim.move ~= nil and dataAnim.move then
						flag = 49
					end

					TaskPlayAnim(playerPed, dataAnim.lib, dataAnim.anim, 8.0, -8.0, 6000, flag, 0, 0, 0, 0)
					playAnimation = true
				end

				-- Wait end animation
				while true do
					Citizen.Wait(0)
					if not IsEntityPlayingAnim(playerPed, dataAnim.lib, dataAnim.anim, 3) then
						playAnim = false
						TriggerEvent('ft_animation:ClFinish')
						break
					end
				end
			end -- end ped exist
		end
	end)
end)