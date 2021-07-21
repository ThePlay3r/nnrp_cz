local isSwimmingUnderWat = false
local hasSwimingMask = false

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

        if isSwimmingUnderWat then
            local remainingTime = GetPlayerUnderwaterTimeRemaining(PlayerId())
            local msg = 'Dech: ~r~' .. math.floor(remainingTime) .. '~s~s'

            if remainingTime > 20 then
                msg = 'Dech: ~y~' .. math.floor(remainingTime) .. '~s~s'
            end
            if remainingTime > 60 then
                msg = 'Dech: ~g~' .. math.floor(remainingTime) .. '~s~s'
            end

            Draw2DText(msg, 0, 1, 0.5, 0.92, 0.4, 255,255,255,255)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        
        local ped = GetPlayerPed(-1)
        isSwimmingUnderWat = IsPedSwimmingUnderWater(ped)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(15000)
        
        TriggerEvent('skinchanger:getSkin', function(skin)
            local isFemale = skin.sex == 1
            local hasMaleBreath = not isFemale and (skin.mask_1 == 37 or skin.mask_1 == 39 or skin.glasses_1 == 22 or skin.glasses_1 == 26)
            local hasFemaleBreath = isFemale and (skin.mask_1 == 36 or skin.mask_1 == 38 or skin.glasses_1 == 25 or skin.glasses_1 == 30)

            if hasMaleBreath or hasFemaleBreath then
                hasSwimingMask = true
            else
                hasSwimingMask = false
            end

            if hasSwimingMask then
                local playerPed = GetPlayerPed(-1)
                SetEnableScuba(playerPed, true)
                SetPedMaxTimeUnderwater(playerPed, 300.0)
            else
                local playerPed = GetPlayerPed(-1)
                SetEnableScuba(playerPed, false)
                SetPedMaxTimeUnderwater(playerPed, 30.0)
            end
        end)
    end
end)