--[[

	Holograms / Floating text Script by Meh
	
	Just put in the coordinates you get when standing on the ground, it's above the ground then
	By default, you only see the hologram when you are within 10m of it, to change that, edit the 10.0 infront of the "then"
	The Default holograms are at the Observatory.
	
	If you want to add a line to the hologram, just make a new Draw3DText line with the same coordinates, and edit the vertical offset.
	
	Formatting:
			Draw3DText( x, y, z  vertical offset, "text", font, text size, text size)
			
			
	To add a new hologram, copy paste this example under the existing ones, and put coordinates and text into it.
	
		if GetDistanceBetweenCoords( X, Y, Z, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( X, Y, Z,  -1.400, "TEXT", 4, 0.1, 0.1)
			Draw3DText( X, Y, Z,  -1.600, "TEXT", 4, 0.1, 0.1)
			Draw3DText( X, Y, Z,  -1.800, "TEXT", 4, 0.1, 0.1)		
		end


]]--

Citizen.CreateThread(function()
    Holograms()
end)

function Holograms()
	while true do
		Citizen.Wait(0)			
		local playerCoords = GetEntityCoords(GetPlayerPed(-1))

		-- if GetDistanceBetweenCoords( 2895.75, 6368.84, 0.95, playerCoords) < 4.0 then
		-- 	Draw3DText( 2895.75, 6368.84, 0.95  -0.020, "Tajny seznam receptu na vyrobu zbrani", 4, 0.1, 0.1)
		-- 	Draw3DText( 2892.6, 6371.11, 1.05  -0.200, "Potrebny material ZELEZO/SOUCASTKY NA ZBRANE", 4, 0.1, 0.1)
		-- 	Draw3DText( 2895.75, 6368.84, 0.95  -0.200, "CarbineRifle 335/300", 4, 0.1, 0.1)
		-- 	Draw3DText( 2895.75, 6368.84, 0.95  -0.400, "Revolver 210/130", 4, 0.1, 0.1)
		-- 	Draw3DText( 2895.75, 6368.84, 0.95  -0.600, "Pistol 50/60", 4, 0.1, 0.1)
		-- 	Draw3DText( 2895.75, 6368.84, 0.95  -0.800, "CombatPistol 60/50", 4, 0.1, 0.1)
		-- 	Draw3DText( 2895.75, 6368.84, 0.95  -1.000, "APPistol 290/100", 4, 0.1, 0.1)
		-- 	Draw3DText( 2895.75, 6368.84, 0.95  -1.200, "Pistol50 240/100", 4, 0.1, 0.1)
		-- 	Draw3DText( 2895.75, 6368.84, 0.95  -1.400, "SNSPistol 55/25", 4, 0.1, 0.1)
		-- 	Draw3DText( 2895.75, 6368.84, 0.95  -1.600, "HeavyPistol 100/70", 4, 0.1, 0.1)
		-- 	Draw3DText( 2895.75, 6368.84, 0.95  -1.800, "VintagePistol 90/90", 4, 0.1, 0.1)
		-- 	Draw3DText( 2895.75, 6368.84, 0.95  -2.000, "MicroSMG 260/200", 4, 0.1, 0.1)
		-- 	Draw3DText( 2895.75, 6368.84, 0.95  -2.200, "MiniSMG 220/260", 4, 0.1, 0.1)
		-- 	Draw3DText( 2895.75, 6368.84, 0.95  -2.400, "SMG 290/200", 4, 0.1, 0.1)		
		-- end	
		
		-- if GetDistanceBetweenCoords( 2892.6, 6371.11, 1.05, playerCoords) < 4.0 then
		-- 	Draw3DText( 2892.6, 6371.11, 1.05  -0.020, "Pro vyrobu zbrani je potreba specialni karta", 4, 0.1, 0.1)
		-- 	Draw3DText( 2892.6, 6371.11, 1.05  -0.200, "Potrebny material ZELEZO/SOUCASTKY NA ZBRANE", 4, 0.1, 0.1)
		-- 	Draw3DText( 2892.6, 6371.11, 1.05  -0.400, "AssaultSMG 250/250", 4, 0.1, 0.1)
		-- 	Draw3DText( 2892.6, 6371.11, 1.05  -0.600, "PDW 310/300", 4, 0.1, 0.1)
		-- 	Draw3DText( 2892.6, 6371.11, 1.05  -0.800, "MachinePistol 210/210", 4, 0.1, 0.1)
		-- 	Draw3DText( 2892.6, 6371.11, 1.05  -1.000, "AdvancedRifle 310/260", 4, 0.1, 0.1)
		-- 	Draw3DText( 2892.6, 6371.11, 1.05  -1.200, "BullPupRifle 310/270", 4, 0.1, 0.1)
		-- 	Draw3DText( 2892.6, 6371.11, 1.05  -1.400, "CompactRifle 310/250", 4, 0.1, 0.1)
		-- 	Draw3DText( 2892.6, 6371.11, 1.05  -1.600, "PumpShotgun 360/200", 4, 0.1, 0.1)
		-- 	Draw3DText( 2892.6, 6371.11, 1.05  -1.800, "SawnOff 250/260", 4, 0.1, 0.1)
		-- 	Draw3DText( 2892.6, 6371.11, 1.05  -2.000, "BullpupShotGun 325/295", 4, 0.1, 0.1)
		-- 	Draw3DText( 2892.6, 6371.11, 1.05  -2.200, "HeavyShotGun 320/290", 4, 0.1, 0.1)
		-- 	Draw3DText( 2892.6, 6371.11, 1.05  -2.400, "DoubleBarrel Shotgun 315/245", 4, 0.1, 0.1)
		-- end	

		-- if GetDistanceBetweenCoords( 2893.67, 6369.13, 1.08 - 0.200, playerCoords) < 6.0 then
		-- 	Draw3DText( 2893.67, 6369.13, 1.08  -0.400, "Pro vyrobu predmetu je potreba specialni karta", 4, 0.1, 0.1)
		-- 	Draw3DText( 2893.67, 6369.13, 1.08  -0.600, "Potrebny material ZELEZO/SOUCASTKY NA ZBRANE/KUZE", 4, 0.1, 0.1)
	
		-- 	Draw3DText( 2893.67, 6369.13, 1.08  -0.800, "Krabicka naboju 10/5/1", 4, 0.1, 0.1)
		-- 	Draw3DText( 2893.67, 6369.13, 1.08  -1.000, "Neprustrelna vesta 2/10/3", 4, 0.1, 0.1)
		-- 	Draw3DText( 2893.67, 6369.13, 1.08  -1.200, "Padak 1/1/5", 4, 0.1, 0.1)
		-- 	Draw3DText( 2893.67, 6369.13, 1.08  -1.400, "Flare 2/3/0", 4, 0.1, 0.1)
		-- 	Draw3DText( 2893.67, 6369.13, 1.08  -1.600, "Flaregun 1/6/0", 4, 0.1, 0.1)
		-- end	

		-- if GetDistanceBetweenCoords( 930.97, 42.83, 81.1, playerCoords) < 8.0 then
		-- 	Draw3DText( 930.97, 42.83, 81.1 -0.400, "Vstupem do kasina potvrzuješ, že je ti v reálném svete minimálne 18 let.", 4, 0.1, 0.1)
		-- 	Draw3DText( 930.97, 42.83, 81.1 -0.600, "V kasinu nelze hrát za reálnou menu a ani nelze za výhry reálnou menu získat.", 4, 0.1, 0.1)
		-- end
			
		if GetDistanceBetweenCoords( -853.07, -1279.76, 5.1, playerCoords) < 20.0 then
			Draw3DText( -853.07, -1279.76, 5.1 -0.400, "Hotel Puerto Del Sol Yacht Club", 4, 0.1, 0.1)
			Draw3DText(-853.07, -1279.76, 5.1 -0.600, "Jiz brzy bude otevirat!", 4, 0.1, 0.1)
		end

		if GetDistanceBetweenCoords( -1473.84, 890.1, 181.86, playerCoords) < 20.0 then
			Draw3DText( -1473.84, 890.1, 181.86 -0.400, "Rehabilitacni centrum", 4, 0.1, 0.1)
			Draw3DText( -1473.84, 890.1, 181.86 -0.600, "Jiz brzy bude otevirat! Vstup Zakazan!", 4, 0.1, 0.1)
		end
		
		if GetDistanceBetweenCoords( 331.38, -595.57, 43.28, playerCoords) < 2.0 then
			Draw3DText( 331.38, -595.57, 43.28  -1.400, "Zadní vchod", 4, 0.1, 0.1)
		end
		
		if GetDistanceBetweenCoords( 329.68, -601.02, 43.28, playerCoords) < 2.0 then
			Draw3DText( 329.68, -601.02, 43.28  -1.400, "Garáž", 4, 0.1, 0.1)
		end
		
		if GetDistanceBetweenCoords( 327.43, -603.06, 43.28, playerCoords) < 2.0 then
			Draw3DText( 327.43, -602.92, 43.28 -1.400, "Heliport", 4, 0.1, 0.1)
		end
	end
end

-------------------------------------------------------------------------------------------------------------------------
function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY, colorCustom)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
	local scale = (1/dist)*20
	local fov = (1/GetGameplayCamFov())*100
	local scale = scale*fov   
	local color = {r = 250, g = 250, b = 250}
	if colorCustom then
		color = colorCustom
	end
	SetTextScale(scaleX*scale, scaleY*scale)
	SetTextFont(fontId)
	SetTextProportional(1)
	SetTextColour(color.r, color.g, color.b, 255)		-- You can change the text color here
	SetTextDropshadow(1, 1, 1, 1, 255)
	SetTextEdge(2, 0, 0, 0, 150)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(textInput)
	SetDrawOrigin(x,y,z+2, 0)
	DrawText(0.0, 0.0)
	ClearDrawOrigin()
end