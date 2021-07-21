local JobBlips = {}

AddEventHandler('esx_hasici2:handleBlips', function(jobName)
	deleteBlips()
	createBlips(jobName)
end)

function createBlip (blipMarker, jobName)
	if blipMarker.IsPublic == false and jobName ~= 'hasici' then
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

function createBlips(jobName)
	createBlip(Config.Blips.Med, jobName)
	createBlip(Config.Blips.Lahve, jobName)
	createBlip(Config.Blips.Sell, jobName)
	createBlip(Config.Blips.Lod, jobName)
end

function deleteBlips()
	if #JobBlips then
		for i = 1, #JobBlips, 1 do
			RemoveBlip(JobBlips[i])
			JobBlips[i] = nil
		end
	end
end