local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) 
    ESX = obj 
end)

function healCommand (source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	-- heal another player - don't heal source
	if args[1] then
		local xTarget = ESX.GetPlayerFromId(args[1])
		local playerId = tonumber(args[1])
		exports.nnadmin:sendAdminLogToDiscordWithTime(('Admin %s pouzil revive na hrace %s (%s)'):format(xPlayer.getName(), xTarget.getName(), xTarget.identifier))
		-- is the argument a number?
		if playerId then
			-- is the number a valid player?
			if GetPlayerName(playerId) then
				print(('^1SYSTEM: ^2%s ^0vyléčil ^3%s'):format(GetPlayerName(source), GetPlayerIdentifier(playerId, 0)))
				TriggerClientEvent('esx_basicneeds:healPlayer', playerId)
				TriggerClientEvent('chat:addMessage', source, { args = { '^5HEAL', ' Byl jsi vylecen.' } })
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', ' Hrac neni online.' } })
			end
		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', ' Spatne ID hrace.' } })
		end
	else
		exports.nnadmin:sendAdminLogToDiscordWithTime(('Admin %s pouzil heal na sebe'):format(xPlayer.getName()))
		print(('^1SYSTEM: ^2%s ^0se vyléčil.'):format(GetPlayerName(source)))
		TriggerClientEvent('esx_basicneeds:healPlayer', source)
	end
end

TriggerEvent('es:addGroupCommand', 'heal', 'helper', function(source, args, user)
	healCommand(source, args)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'Heal a player, or yourself - restores thirst, hunger and health.', params = {{name = 'playerId', help = '(optional) player id'}}})

RegisterServerEvent('nnadmin:callHeal')
AddEventHandler('nnadmin:callHeal', function(target)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local group = xPlayer.getGroup()
	local args = {}
	table.insert(args, target)

	if group == 'superadmin' or group == 'admin' or group == 'mod' or group =='helper' then
		healCommand(_source, args)
	end
end)