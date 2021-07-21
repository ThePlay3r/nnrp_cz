-- Announcing
TriggerEvent('es:addGroupCommand', 'announce', "helper", function(source, args, user)
	TriggerClientEvent('chat:addMessage', -1, {
        args = {"^1ANNOUNCEMENT", table.concat(args, " ")}
    })
    local msg = ("Admin %s napsal oznameni: %s"):format(GetPlayerName(source), table.concat(args, " "))
    sendAdminLogToDiscordWithTime(msg)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", _U('insufficienct_permissions')} })
end, {help = "Poslat admin oznameni celemu serveru", params = {{name = "announcement", help = "Text oznameni"}}})
