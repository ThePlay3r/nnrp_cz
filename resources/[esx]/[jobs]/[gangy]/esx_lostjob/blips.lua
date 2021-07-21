local JobBlips = {}

AddEventHandler('esx_lostjob:handleBlips', function(jobName, jobGrade)
	deleteBlips()
	createBlips(jobName, jobGrade)
end)

function createBlip (blipMarker, jobName, jobGrade)
	if blipMarker.IsPublic == false and jobName ~= 'lost' then
		return
	end

	if blipMarker.hiddenForGrade and blipMarker.hiddenForGrade == jobGrade then
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

function createBlips(jobName, jobGrade)
	createBlip(Config.Blips.Lost, jobName, jobGrade)
	createBlip(Config.Blips.LostProdej, jobName, jobGrade)
end

function deleteBlips()
	if #JobBlips then
		for i = 1, #JobBlips, 1 do
			RemoveBlip(JobBlips[i])
			JobBlips[i] = nil
		end
	end
end