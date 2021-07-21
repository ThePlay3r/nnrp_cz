ESX = nil
local doorState = {}

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)


function updateDoorsState (categoryIndex, doorIndex, state)
	if not doorState[categoryIndex] then
		doorState[categoryIndex] = {}
	end

	doorState[categoryIndex][doorIndex] = state
	TriggerClientEvent('esx_doorlock:setDoorState', -1, categoryIndex, doorIndex, state)
end

-- RegisterServerEvent('esx_doorlock:updateState')
-- AddEventHandler('esx_doorlock:updateState', function(categoryIndex, doorIndex, state)
-- 	local xPlayer = ESX.GetPlayerFromId(source)
-- 	local isEverythingDefined = xPlayer and type(categoryIndex) == 'string' and type(doorIndex) == 'string' and type(state) == 'boolean'

-- 	if isEverythingDefined ~= true then
-- 		return
-- 	end

-- 	local jobName = xPlayer.job.name
-- 	local doors = Config.DoorList[categoryIndex][doorIndex]

-- 	local authorizedJobs = doors.authorizedJobs
-- 	local hasJobAuthorization = HasAuthorizedJob(jobName, authorizedJobs)

-- 	if hasJobAuthorization then
-- 		updateDoorsState(categoryIndex, doorIndex, state)
-- 	end
-- end)

ESX.RegisterServerCallback('esx_doorlock:getDoorState', function(source, cb)
	cb(doorState)
end)

-- function HasAuthorizedJob (jobName, authorizedJobs)
-- 	for k, job in pairs(authorizedJobs) do
-- 		if job == jobName then
-- 			return true
-- 		end
-- 	end

-- 	return false
-- end

function handleDoorsUnlock (categoryIndex, doorIndex)
	local state = false

	if doorState[categoryIndex] and doorState[categoryIndex][doorIndex] ~= nil then
		state = not doorState[categoryIndex][doorIndex]
	end

	updateDoorsState(categoryIndex, doorIndex, state)
end

function getAvailableDoorsName (source, categoryIndex, doorNames)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerCoords = xPlayer.getCoords(true)
	local doorNamesResult = nil

	for k, doorName in ipairs(doorNames) do
		local doorsCoords
		if Config.DoorList[categoryIndex][doorName].doors then
			doorsCoords = Config.DoorList[categoryIndex][doorName].doors[1].objCoords
		else
			doorsCoords = Config.DoorList[categoryIndex][doorName].objCoords
		end
		local distance = #(playerCoords - doorsCoords)
		
		if distance <= Config.DoorList[categoryIndex][doorName].maxDistance then
			if doorNamesResult == nil then
				doorNamesResult = {}
			end
			table.insert(doorNamesResult, doorName)
		end
	end
	
	return doorNamesResult
end

function registerUsableItem (itemName, categoryIndex, doorNames)
	ESX.RegisterUsableItem(itemName, function(source)
		if string.match(itemName, "remote") then
			local doorNames = getAvailableDoorsName(source, categoryIndex, doorNames)

			if doorNames then
				for k,v in ipairs(doorNames) do
					handleDoorsUnlock(categoryIndex, v)
				end
			end
		else
			local doorNames = getAvailableDoorsName(source, categoryIndex, doorNames)

			if doorNames then
				TriggerClientEvent("esx_doorlock:lockAnimation", source)
				SetTimeout(1000, function()
					for k,v in ipairs(doorNames) do
						handleDoorsUnlock(categoryIndex, v)
					end
				end)
			end
		end
	end)
end

for categoryIndex in pairs(Config.Keys) do
	for keyName in pairs(Config.Keys[categoryIndex]) do
		registerUsableItem(keyName, categoryIndex, Config.Keys[categoryIndex][keyName])
	end
end