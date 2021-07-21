local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) 
    ESX = obj 
end)

function reviveCommand (source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if args[1] ~= nil then
		local xTarget = ESX.GetPlayerFromId(args[1])
		exports.nnadmin:sendAdminLogToDiscordWithTime(('Admin %s pouzil revive na hrace %s (%s)'):format(xPlayer.getName(), xTarget.getName(), xTarget.identifier))
	else
		exports.nnadmin:sendAdminLogToDiscordWithTime(('Admin %s pouzil revive na sebe'):format(xPlayer.getName()))
	end

    if args[1] ~= nil then
        if GetPlayerName(tonumber(args[1])) ~= nil then
				print(('^1SYSTEM:^2 %s ^0použil revive'):format(GetPlayerName(source)))
				TriggerClientEvent('esx_ambulancejob:reILovePizzavive', tonumber(args[1]))
				TriggerClientEvent('mythic_hospital:client:ResetLimbs', tonumber(args[1]))
				TriggerClientEvent('mythic_hospital:client:RemoveBleed', tonumber(args[1]))
        end
    else
        TriggerClientEvent('esx_ambulancejob:reILovePizzavive', source)
        TriggerClientEvent('mythic_hospital:client:ResetLimbs', source)
        TriggerClientEvent('mythic_hospital:client:RemoveBleed', source)
    end
end

TriggerEvent('es:addGroupCommand', 'revive', 'helper', function(source, args, user)
	reviveCommand(source, args)
end, function(source, args, user)
    TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, { help = _U('revive_help'), params = {{ name = 'id' }} })

RegisterServerEvent('nnadmin:callRevive')
AddEventHandler('nnadmin:callRevive', function(target)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local group = xPlayer.getGroup()
	local args = {}
	table.insert(args, target)

	if group == 'superadmin' or group == 'admin' or group == 'mod' or group =='helper' then
		reviveCommand(_source, args)
	end
end)