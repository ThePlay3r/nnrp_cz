function createBlip (blipMarker)
	local blip = AddBlipForCoord(blipMarker.Pos.x, blipMarker.Pos.y, blipMarker.Pos.z)
	SetBlipSprite(blip, blipMarker.Sprite)
	SetBlipDisplay(blip, blipMarker.Display)
	SetBlipScale(blip, blipMarker.Scale)
	SetBlipColour(blip, blipMarker.Colour)
	SetBlipAsShortRange(blip, true)
    
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(blipMarker.label)
	EndTextCommandSetBlipName(blip)
end


Citizen.CreateThread(function()
	for k, v in ipairs(Config.Blips) do
		createBlip(v)
	end
end)
