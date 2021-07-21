ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

local playerNames = {}

RegisterServerEvent('esx-rally-races:addTime')
AddEventHandler('esx-rally-races:addTime', function(time, race)
    local xPlayer = ESX.GetPlayerFromId(source)

	local name = "none"
	
	if playerNames[xPlayer.identifier] then
		name = playerNames[xPlayer.identifier]
	else
		local sql = [[
			SELECT
				firstname, lastname
			FROM
				users
			WHERE
				identifier = @identifier
		]]

		MySQL.Async.fetchAll(sql, { ["@identifier"] = xPlayer["identifier"] }, function(response)
			if response[1] ~= nil then
				name = response[1]["firstname"] .. " " .. response[1]["lastname"]
				playerNames[xPlayer.identifier] = response[1]["firstname"] .. " " .. response[1]["lastname"]
			end
		end)
	end

    time = time

    Citizen.Wait(1000)

    MySQL.Async.fetchAll(
        'SELECT name, time FROM user_rally_races WHERE name = @identifier and race = @race', {['@identifier'] = name, ['@race'] = race},
    function(result)
        if result[1] ~= nil and result[1].time > time then
            MySQL.Async.execute(
                'UPDATE user_gym_races SET time = @time WHERE name = @identifier and race = @race',
                {
                    ['@identifier'] = name,
                    ['@race'] = race,
                    ['@time'] = time
                }
            )
        elseif result[1] == nil then
            MySQL.Async.execute('INSERT INTO user_rally_races (name, time, race) VALUES (@name, @time, @race)',
                {
                    ['@name'] = name,
                    ['@time'] = time,
                    ['@race'] = race
                }
            )
        end
    end)
end)

ESX.RegisterServerCallback('esx-rally-races:getScoreboard', function(source, cb, race)
    local identifier = ESX.GetPlayerFromId(source).identifier

    MySQL.Async.fetchAll(
        'SELECT * FROM user_rally_races WHERE race = @race ORDER BY time ASC LIMIT 25', {['@race'] = race},
    function(result)

        local Races = {}

        for i=1, #result, 1 do
            table.insert(Races, {
                name   = result[i].name,
                time = result[i].time,
            })
        end

        cb(Races)
    end)  
end)