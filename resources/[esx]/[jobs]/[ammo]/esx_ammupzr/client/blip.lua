local JobBlips = {}

AddEventHandler('esx_ammujob:handleBlips', function(jobName)
	deleteBlips()
	createMapBlips(jobName)
end)

function createMapBlip (blipMarker, jobName)
	if blipMarker.publicBlip == false and jobName ~= 'ammu' then
		return
	end

	local blip = AddBlipForCoord(blipMarker.Pos.x, blipMarker.Pos.y, blipMarker.Pos.z)
	table.insert(JobBlips, blip)

 	SetBlipSprite(blip, blipMarker.Sprite)
	SetBlipDisplay(blip, blipMarker.Display)
	SetBlipScale(blip, blipMarker.Scale)
	SetBlipColour(blip, blipMarker.Colour)
	SetBlipAsShortRange(blip, true)
    
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(blipMarker.label)
	EndTextCommandSetBlipName(blip)
end

function createMapBlips(jobName)
	createMapBlip(Config.Blips.Blip, jobName)
	createMapBlip(Config.Blips.Blip2, jobName)
	createMapBlip(Config.Blips.Blip3, jobName)
end

function deleteBlips()
	if #JobBlips then
		for i = 1, #JobBlips, 1 do
			RemoveBlip(JobBlips[i])
			JobBlips[i] = nil
		end
	end
end