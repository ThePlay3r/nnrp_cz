local idVisable = true
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(2000)
	ESX.TriggerServerCallback('esx_scoreboard:getConnectedPlayers', function(connectedPlayers)
		UpdatePlayerTable(connectedPlayers)
	end)
end)

Citizen.CreateThread(function()
	Citizen.Wait(500)
	SendNUIMessage({
		action = 'updateServerInfo',

		maxPlayers = GetConvarInt('sv_maxclients', 80),
		uptime = 'unknown',
		playTime = '00h 00m'
	})
end)

RegisterNetEvent('esx_scoreboard:updateConnectedPlayers')
AddEventHandler('esx_scoreboard:updateConnectedPlayers', function(connectedPlayers)
	UpdatePlayerTable(connectedPlayers)
end)

RegisterNetEvent('esx_scoreboard:updatePing')
AddEventHandler('esx_scoreboard:updatePing', function(connectedPlayers)
	SendNUIMessage({
		action  = 'updatePing',
		players = connectedPlayers
	})
end)

RegisterNetEvent('esx_scoreboard:toggleID')
AddEventHandler('esx_scoreboard:toggleID', function(state)
	if state then
		idVisable = state
	else
		idVisable = not idVisable
	end

	SendNUIMessage({
		action = 'toggleID',
		state = idVisable
	})
end)

RegisterNetEvent('uptime:tick')
AddEventHandler('uptime:tick', function(uptime)
	SendNUIMessage({
		action = 'updateServerInfo',
		uptime = uptime
	})
end)

function UpdatePlayerTable(connectedPlayers)
	local formattedPlayerList, num = {}, 1
	local ems, police, hasici, sheriff, taxi, ammu, mechanic, mecano, bazar, benefactor, state, galdin, unicorn, vigne, casino, pivovar, easyway, coffee, ranch, cozinheiro, lifeinvader, farma, gang, players = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

	for k,v in pairs(connectedPlayers) do

		if num == 1 then
			table.insert(formattedPlayerList, ('<tr><td>%s</td><td>%s</td><td>%s</td>'):format(v.name, v.id, v.ping))
			num = 2
		elseif num == 2 then
			table.insert(formattedPlayerList, ('<td>%s</td><td>%s</td><td>%s</td></tr>'):format(v.name, v.id, v.ping))
			num = 1
		end

		players = players + 1

		if v.job == 'ambulance' then
			ems = ems + 1
		elseif v.job == 'police' then
			police = police + 1
		elseif v.job == 'hasici' then
			hasici = hasici + 1
		elseif v.job == 'sheriff' then
			sheriff = sheriff + 1
		elseif v.job == 'cosanostra' then
			taxi = taxi + 1
		elseif v.job == 'ammu' then
			ammu = ammu + 1
		elseif v.job == 'mechanic' then
			mechanic = mechanic + 1
		elseif v.job == 'mecano' then
			mecano = mecano + 1
		elseif v.job == 'bazar' then
			bazar = bazar + 1
		elseif v.job == 'benefactor' then
			benefactor = benefactor + 1
		elseif v.job == 'state' then
			state = state + 1
		elseif v.job == 'galdin' then
			galdin = galdin + 1
		elseif v.job == 'unicorn' then
			unicorn = unicorn + 1
		elseif v.job == 'vigne' then
			vigne = vigne + 1
		elseif v.job == 'casino' then
			casino = casino + 1
		elseif v.job == 'pivovar' then
			pivovar = pivovar + 1
		elseif v.job == 'coffee' then
			coffee = coffee + 1
		elseif v.job == 'easyway' then
			easyway = easyway + 1
		elseif v.job == 'ranch' then
			ranch = ranch + 1
		elseif v.job == 'lifeinvader' then
			lifeinvader = lifeinvader + 1
		elseif v.job == 'farma' then
			farma = farma + 1
		elseif v.job == 'cozinheiro' then
			cozinheiro = cozinheiro + 1
		elseif v.job == 'gang' then
			gang = gang + 1
		end
	end

	if num == 1 then
		table.insert(formattedPlayerList, '</tr>')
	end

	SendNUIMessage({
		action  = 'updatePlayerList',
		players = table.concat(formattedPlayerList)
	})

	SendNUIMessage({
		action = 'updatePlayerJobs',
		jobs   = {
			ems = ems,
			police = police,
			sheriff = sheriff,
			hasici = hasici,
			taxi = taxi,
			ammu = ammu,
			mechanic = mechanic,
			mecano = mecano,
			bazar = bazar,
			benefactor = benefactor,
			state = state,
			galdin = galdin,
			unicorn = unicorn,
			vigne = vigne,
			casino = casino,
			pivovar = pivovar,
			coffee = coffee,
			easyway = easyway,
			ranch = ranch,
			cozinheiro = cozinheiro,
			lifeinvader = lifeinvader,
			farma = farma,
			gang = gang,
			player_count = players
		}
	})
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if IsControlJustReleased(3, 178) and IsInputDisabled(0) then
			ToggleScoreBoard()
			Citizen.Wait(200)
		end
	end
end)

-- Close scoreboard when game is paused
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(300)

		if IsPauseMenuActive() and not IsPaused then
			IsPaused = true
			SendNUIMessage({action  = 'close'})
		elseif not IsPauseMenuActive() and IsPaused then
			IsPaused = false
		end
	end
end)

function ToggleScoreBoard()
	SendNUIMessage({action = 'toggle'})
end

Citizen.CreateThread(function()
	local playMinute, playHour = 0, 0

	while true do
		Citizen.Wait(1000 * 60) -- every minute
		playMinute = playMinute + 1
	
		if playMinute == 60 then
			playMinute = 0
			playHour = playHour + 1
		end

		SendNUIMessage({
			action = 'updateServerInfo',
			playTime = string.format("%02dh %02dm", playHour, playMinute)
		})
	end
end)
