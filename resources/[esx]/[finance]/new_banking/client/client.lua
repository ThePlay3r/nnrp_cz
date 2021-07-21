--================================================================================================
--==                                VARIABLES - DO NOT EDIT                                     ==
--================================================================================================
ESX				= nil
inMenu			= true
local showblips	= true
local atbank	= false
local bankMenu	= true
local banks = {
	{name="Bank", id=108, x=150.266, y=-1040.203, z=29.374},
	{name="Bank", id=108, x=-1212.980, y=-330.841, z=37.787},
	{name="Bank", id=108, x=-2962.582, y=482.627, z=15.703},
	{name="Bank", id=108, x=-112.202, y=6469.295, z=31.626},
	{name="Bank", id=108, x=314.187, y=-278.621, z=54.170},
	{name="Bank", id=108, x=-351.534, y=-49.529, z=49.042},
	{name="Bankomat", id=431, x=-386.733, y=6045.953, z=31.501},
	{name="Bankomat", id=431, x=-284.037, y=6224.385, z=31.187},
	{name="Bankomat", id=431, x=-284.037, y=6224.385, z=31.187},
	{name="Bankomat", id=431, x=-135.165, y=6365.738, z=31.101},
	{name="Bankomat", id=431, x=-110.753, y=6467.703, z=31.784},
	{name="Bankomat", id=431, x=-94.9690, y=6455.301, z=31.784},
	{name="Bankomat", id=431, x=155.4300, y=6641.991, z=31.784},
	{name="Bankomat", id=431, x=174.6720, y=6637.218, z=31.784},
	{name="Bankomat", id=431, x=1701.23, y=6426.27, z=32.76},
	{name="Bankomat", id=431, x=1735.114, y=6411.035, z=35.164},
	{name="Bankomat", id=431, x=1702.842, y=4933.593, z=42.051},
	{name="Bankomat", id=431, x=1967.333, y=3744.293, z=32.272},
	{name="Bankomat", id=431, x=1821.917, y=3683.483, z=34.244},
	{name="Bankomat", id=431, x=1174.532, y=2705.278, z=38.027},
	{name="Bankomat", id=431, x=540.0420, y=2671.007, z=42.177},
	{name="Bankomat", id=431, x=2564.399, y=2585.100, z=38.016},
	{name="Bankomat", id=431, x=2558.683, y=349.6010, z=108.050},
	{name="Bankomat", id=431, x=2558.051, y=389.4817, z=108.660},
	{name="Bankomat", id=431, x=1077.692, y=-775.796, z=58.218},
	{name="Bankomat", id=431, x=1139.018, y=-469.886, z=66.789},
	{name="Bankomat", id=431, x=1168.975, y=-457.241, z=66.641},
	{name="Bankomat", id=431, x=1153.884, y=-326.540, z=69.245},
	{name="Bankomat", id=431, x=381.2827, y=323.2518, z=103.270},
	{name="Bankomat", id=431, x=236.4638, y=217.4718, z=106.840},
	{name="Bankomat", id=431, x=265.0043, y=212.1717, z=106.780},
	{name="Bankomat", id=431, x=285.2029, y=143.5690, z=104.970},
	{name="Bankomat", id=431, x=157.7698, y=233.5450, z=106.450},
	{name="Bankomat", id=431, x=-164.568, y=233.5066, z=94.919},
	{name="Bankomat", id=431, x=-1827.04, y=785.5159, z=138.020},
	{name="Bankomat", id=431, x=-1409.39, y=-99.2603, z=52.473},
	{name="Bankomat", id=431, x=-1205.35, y=-325.579, z=37.870},
	{name="Bankomat", id=431, x=-1215.64, y=-332.231, z=37.881},
	{name="Bankomat", id=431, x=-2072.41, y=-316.959, z=13.345},
	{name="Bankomat", id=431, x=-2975.72, y=379.7737, z=14.992},
	{name="Bankomat", id=431, x=-2962.60, y=482.1914, z=15.762},
	{name="Bankomat", id=431, x=-2955.70, y=488.7218, z=15.486},
	{name="Bankomat", id=431, x=-3044.22, y=595.2429, z=7.595},
	{name="Bankomat", id=431, x=-3144.13, y=1127.415, z=20.868},
	{name="Bankomat", id=431, x=-3241.10, y=996.6881, z=12.500},
	{name="Bankomat", id=431, x=-3241.11, y=1009.152, z=12.877},
	{name="Bankomat", id=431, x=-1305.40, y=-706.240, z=25.352},
	{name="Bankomat", id=431, x=-538.225, y=-854.423, z=29.234},
	{name="Bankomat", id=431, x=-711.156, y=-818.958, z=23.768},
	{name="Bankomat", id=431, x=-717.614, y=-915.880, z=19.268},
	{name="Bankomat", id=431, x=-526.566, y=-1222.90, z=18.434},
	{name="Bankomat", id=431, x=-256.831, y=-719.646, z=33.444},
	{name="Bankomat", id=431, x=-203.548, y=-861.588, z=30.205},
	{name="Bankomat", id=431, x=112.4102, y=-776.162, z=31.427},
	{name="Bankomat", id=431, x=112.9290, y=-818.710, z=31.386},
	{name="Bankomat", id=431, x=119.9000, y=-883.826, z=31.191},
	{name="Bankomat", id=431, x=149.4551, y=-1038.95, z=29.366},
	{name="Bankomat", id=431, x=-846.304, y=-340.402, z=38.687},
	{name="Bankomat", id=431, x=-1204.35, y=-324.391, z=37.877},
	{name="Bankomat", id=431, x=-1216.27, y=-331.461, z=37.773},
	{name="Bankomat", id=431, x=-56.1935, y=-1752.53, z=29.452},
	{name="Bankomat", id=431, x=-261.692, y=-2012.64, z=30.121},
	{name="Bankomat", id=431, x=-273.001, y=-2025.60, z=30.197},
	{name="Bankomat", id=431, x=314.187, y=-278.621, z=54.170},
	{name="Bankomat", id=431, x=-351.534, y=-49.529, z=49.042},
	{name="Bankomat", id=431, x=24.589, y=-946.056, z=29.357},
	{name="Bankomat", id=431, x=-254.112, y=-692.483, z=33.616},
	{name="Bankomat", id=431, x=-1570.197, y=-546.651, z=34.955},
	{name="Bankomat", id=431, x=-1415.909, y=-211.825, z=46.500},
	{name="Bankomat", id=431, x=-1430.112, y=-211.014, z=46.500},
	{name="Bankomat", id=431, x=33.232, y=-1347.849, z=29.497},
	{name="Bankomat", id=431, x=129.216, y=-1292.347, z=29.269},
	{name="Bankomat", id=431, x=287.645, y=-1282.646, z=29.659},
	{name="Bankomat", id=431, x=289.012, y=-1256.545, z=29.440},
	{name="Bankomat", id=431, x=295.839, y=-895.640, z=29.217},
	{name="Bankomat", id=431, x=1686.753, y=4815.809, z=42.008},
	{name="Bankomat", id=431, x=-302.408, y=-829.945, z=32.417},
	{name="Bankomat", id=431, x=5.134, y=-919.949, z=29.557},
	{name="Bankomat", id=431, x=527.26, y=-160.76, z=57.09},
	{name="Bankomat", id=431, x=-867.19, y=-186.99, z=37.84},
	{name="Bankomat", id=431, x=-821.62, y=-1081.88, z=11.13},
	{name="Bankomat", id=431, x=-1315.32, y=-835.96, z=16.96},
	{name="Bankomat", id=431, x=-660.71, y=-854.06, z=24.48},
	{name="Bankomat", id=431, x=-1109.73, y=-1690.81, z=4.37},
	{name="Bankomat", id=431, x=-1091.5, y=2708.66, z=18.95},
	{name="Bankomat", id=431, x=1171.98, y=2702.55, z=38.18},
	{name="Bankomat", id=431, x=2683.09, y=3286.53, z=55.24},
	{name="Bankomat", id=431, x=89.61, y=2.37, z=68.31},
	{name="Bankomat", id=431, x=-30.3, y=-723.76, z=44.23},
	{name="Bankomat", id=431, x=-28.07, y=-724.61, z=44.23},
	{name="Bankomat", id=431, x=-613.24, y=-704.84, z=31.24},
	{name="Bankomat", id=431, x=-618.84, y=-707.9, z=30.5},
	{name="Bankomat", id=431, x=-1289.23, y=-226.77, z=42.45},
	{name="Bankomat", id=431, x=-1285.6, y=-224.28, z=42.45},
	{name="Bankomat", id=431, x=-1286.24, y=-213.39, z=42.45},
	{name="Bankomat", id=431, x=-1282.54, y=-210.45, z=42.45},
	{name="Bankomat", id=431, x=-549.71, y=-204.06, z=38.22},
	{name="Bankomat", id=431, x=314.5653, y=-593.5123, z=42.29851},
	{name="Bankomat", id=431, x=-2240.97, y=-611.52, z=13.88},

	{name="Pacific Bank", id=457, x=241.727, y=220.706, z=106.286, principal = true},
	{name="Bank", id=108, x=1175.0643310547, y=2706.6435546875, z=38.094036102295},
	{name="Bankomat", id=431, x=903.45, y=-163.42, z=74.17},
	{name="Bankomat", id=431, x=-38.36, y=-1114.58, z=26.44},
	{name="Bankomat", id = 431, x= -702.34, y=5791.37, z=17.53},
	{name="Bankomat", id = 431, x= -1189.34, y=-1573.12, z=4.35},
	{name="Bankomat", id = 431, x= 920.39, y=41.02, z=81.1},
	{name="Bankomat", id = 431, x= -1879.9, y=2047.32, z=140.98},
	{name="Bankomat", id = 431, x= 920.39, y=40.99, z=81.1},
	{name="Bankomat", id = 431, x= 258.24, y=-260.55, z=54.04},
}	

local atms = {
}
--================================================================================================
--==                                THREADING - DO NOT EDIT                                     ==
--================================================================================================

--===============================================
--==           Base ESX Threading              ==
--===============================================
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)





--===============================================
--==             Core Threading                ==
--===============================================
if bankMenu then
	Citizen.CreateThread(function()
	while true do
		Wait(0)
	if nearBank() or nearATM() then
			DisplayHelpText("Stiskni ~INPUT_PICKUP~ k otevrení bankovního uctu ~b~")
	
		if IsControlJustPressed(1, 38) then
			inMenu = true
			SetNuiFocus(true, true)
			SendNUIMessage({type = 'openGeneral'})
			TriggerServerEvent('bank:balance')
			local ped = GetPlayerPed(-1)
		end
	end
				
		if IsControlJustPressed(1, 322) then
		inMenu = false
			SetNuiFocus(false, false)
			SendNUIMessage({type = 'close'})
		end
	end
	end)
end


--===============================================
--==             Map Blips	                   ==
--===============================================
Citizen.CreateThread(function()
	if showblips then
		for k,v in ipairs(banks)do
		local blip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite(blip, v.id)
		SetBlipScale(blip, 0.6)
		SetBlipAsShortRange(blip, true)
		if v.principal ~= nil and v.principal then
			SetBlipColour(blip, 77)
		else
			SetBlipColour(blip, 43)
		end
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(tostring(v.name))
		EndTextCommandSetBlipName(blip)
		end
	end
end)



--===============================================
--==           Deposit Event                   ==
--===============================================
RegisterNetEvent('currentbalance1')
AddEventHandler('currentbalance1', function(balance)
	local id = PlayerId()
	local playerName = GetPlayerName(id)
	
	SendNUIMessage({
		type = "balanceHUD",
		balance = balance,
		player = playerName
		})
end)
--===============================================
--==           Deposit Event                   ==
--===============================================
RegisterNUICallback('deposit', function(data)
	TriggerServerEvent('bank:depILovePizzaosit', tonumber(data.amount))
	TriggerServerEvent('bank:balance')
end)

--===============================================
--==          Withdraw Event                   ==
--===============================================
RegisterNUICallback('withdrawl', function(data)
	TriggerServerEvent('bank:withdILovePizzaraw', tonumber(data.amountw))
	TriggerServerEvent('bank:balance')
end)

--===============================================
--==         Balance Event                     ==
--===============================================
RegisterNUICallback('balance', function()
	TriggerServerEvent('bank:balance')
end)

RegisterNetEvent('balance:back')
AddEventHandler('balance:back', function(balance)
	SendNUIMessage({type = 'balanceReturn', bal = balance})
end)


--===============================================
--==         Transfer Event                    ==
--===============================================
RegisterNUICallback('transfer', function(data)
	TriggerServerEvent('bank:tranILovePizzasfer', data.to, data.amountt)
	TriggerServerEvent('bank:balance')
end)

--===============================================
--==         Result   Event                    ==
--===============================================
RegisterNetEvent('bank:result')
AddEventHandler('bank:result', function(type, message)
	SendNUIMessage({type = 'result', m = message, t = type})
end)

--===============================================
--==               NUIFocusoff                 ==
--===============================================
RegisterNUICallback('NUIFocusOff', function()
	inMenu = false
	SetNuiFocus(false, false)
	SendNUIMessage({type = 'closeAll'})
end)


--===============================================
--==            Capture Bank Distance          ==
--===============================================
function nearBank()
	local player = GetPlayerPed(-1)
	local playerloc = GetEntityCoords(player, 0)
	
	for _, search in pairs(banks) do
		local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
		
		if distance <= 1.5 then
			return true
		end
	end
end

function nearATM()
	local player = GetPlayerPed(-1)
	local playerloc = GetEntityCoords(player, 0)
	
	for _, search in pairs(atms) do
		local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
		print(distance)
		if distance <= 1.5 then
			return true
		end
	end
end


function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end