ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

function hasIZSJob (job)
    if job == 'police' or job == 'sheriff' or job == 'hasici' or job == 'ambulance' or job == 'state' then
        return true
    end
    return false
end

local savedSources = {}

RegisterNetEvent('izsblips:registerBlip')
AddEventHandler('izsblips:registerBlip', function()
	local playerId = source
	local xPlayer = ESX.GetPlayerFromId(playerId)
	local identifier = xPlayer.identifier
	local jobName = xPlayer.job.name

	local alreadyRegisteredIndex = nil
	local hasSameJob = false
	local hasAllowedJob = hasIZSJob(jobName)
	for k,v in ipairs(savedSources) do
		if v.id == playerId or v.identifier == identifier then
			alreadyRegisteredIndex = k
			if v.jobName == jobName then
				hasSameJob = true
			end
		end
	end

	if not hasSameJob then
		if alreadyRegisteredIndex and hasAllowedJob then
			savedSources[alreadyRegisteredIndex] = {jobName = xPlayer.job.name, id = playerId, name = xPlayer.name, identifier = identifier}
		elseif alreadyRegisteredIndex and not hasAllowedJob then
			table.remove(savedSources, alreadyRegisteredIndex)
		elseif not alreadyRegisteredIndex and hasAllowedJob then
			table.insert(savedSources, {jobName = xPlayer.job.name, id = playerId, name = xPlayer.name, identifier = identifier})
		end
		TriggerClientEvent('izsblips:createBlips', -1, savedSources)
	end
end)


AddEventHandler('playerDropped', function()
	local playerId = source

	if playerId then
		local xPlayer = ESX.GetPlayerFromId(playerId)

		if xPlayer and hasIZSJob(xPlayer.job.name) then
			for k,v in ipairs(savedSources) do
				if v.id == playerId then
					table.remove(savedSources, k)
				end
			end
			TriggerClientEvent('izsblips:createBlips', -1, savedSources)
		end
	end
end)

-- Announcing
TriggerEvent('es:addGroupCommand', 'izsblipdebug', "superadmin", function(source, args, user)
	print(ESX.DumpTable(savedSources))
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", _U('insufficienct_permissions')} })
end)
