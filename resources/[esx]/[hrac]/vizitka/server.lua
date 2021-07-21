local ESX = nil
local playerData = {}

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) 
    ESX = obj 
end)

ESX.RegisterServerCallback('esx_vizitka:getVizitkaData', function(source, cb)
	local identifier = GetPlayerIdentifiers(source)[1]

	if playerData[identifier] then
		cb(playerData[identifier])
		return
	end

	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
		['@identifier'] = identifier
	})
	local user = result[1]
	local data = {}
	
	data.name = user['firstname'] .. ' ' .. user['lastname']
	data.dob = user['dateofbirth']
	data.height = user['height'] .. "cm"
	data.phone = user['phone_number']
	
	if user['sex'] == 'm' then
		data.sex = 'Muž'
	else
		data.sex = 'Žena'
	end

	playerData[identifier] = data
	cb(data)
end)