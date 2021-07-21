local parachuteState = -1
local aboveGroundPosition = 0

local function Draw2DText(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(6)
	SetTextProportional(6)
	SetTextScale(scale/1.0, scale/1.0)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)

	DrawText(0.477, 0.025)
	DrawRect(0.477, 0.038, 0.08, 0.035, 0, 0, 0, 150)
end

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
        
        if parachuteState ~= -1 then
            local msg = 'Vyska: ~r~' .. math.floor(aboveGroundPosition) .. 'm~s~'

            if aboveGroundPosition > 100 then
                msg = 'Vyska: ~y~' .. math.floor(aboveGroundPosition) .. 'm~s~'
            end
            if aboveGroundPosition > 250 then
                msg = 'Vyska: ~g~' .. math.floor(aboveGroundPosition) .. 'm~s~'
            end

            Draw2DText(msg, 0, 1, 0.5, 0.92, 0.4, 255,255,255,255)
        end
	end
end)

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
        
        local playerPed = GetPlayerPed(-1)
        parachuteState = GetPedParachuteState(playerPed)

        if parachuteState ~= -1 then
            local playerPos = GetEntityCoords(playerPed)
            local _, groundZ = GetGroundZFor_3dCoord(playerPos.x, playerPos.y, playerPos.z, true)

            aboveGroundPosition = playerPos.z - groundZ
            Citizen.Wait(100)
        else
            Citizen.Wait(1000)
        end
	end
end)
