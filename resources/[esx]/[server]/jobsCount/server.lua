local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

local savedJobs = {}

RegisterServerEvent('jobscount:registerJob')
AddEventHandler('jobscount:registerJob', function()
	local playerId = source
	local xPlayer = ESX.GetPlayerFromId(playerId)
	local identifier = xPlayer.identifier
	local jobName = xPlayer.job.name

	savedJobs[identifier] = jobName
end)

AddEventHandler('playerDropped', function()
	local _source = source
	local identifier = GetPlayerIdentifiers(_source)[1]

	if savedJobs[identifier] then
		savedJobs[identifier] = nil
	end
end)

ESX.RegisterServerCallback('jobscount:getJobsCount', function(source, cb)
	cb(savedJobs)
end)

AddEventHandler('jobscount:getJobs', function(cb)
	cb(savedJobs)
end)

-- Announcing
TriggerEvent('es:addGroupCommand', 'jobscountdebug', "superadmin", function(source, args, user)
	print(ESX.DumpTable(savedJobs))
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", _U('insufficienct_permissions')} })
end)
