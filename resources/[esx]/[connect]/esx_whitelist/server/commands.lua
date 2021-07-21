TriggerEvent('es:addGroupCommand', 'reloadwl', 'helper', function (source, args, user)
	loadWhiteList(function()
		TriggerClientEvent('chat:addMessage', source, { args = { '^1WL: ', '^0Whitelist nacten!' } })
	end)
end, true, {help = _U('help_whitelist_load')})

TriggerEvent('es:addGroupCommand', 'addwl', 'mod', function (source, args, user)
	if not args[1] then
		TriggerClientEvent('chat:addMessage', source, { args = { '^1WL: ', '^0Chybi zadany HEX!' } })
		return
	end

	local license = args[1]

	if WhiteList[license] then
		TriggerClientEvent('chat:addMessage', source, { args = { '^1WL: ', '^0Hrac uz na whitelistu je!' } })
	else
		MySQL.Async.execute('INSERT INTO whitelist (identifier) VALUES (@identifier)', {
			['@identifier'] = 'steam:' .. license
		}, function(rowsChanged)
			WhiteList['steam:' .. license] = true
			TriggerClientEvent('chat:addMessage', source, { args = { '^1WL: ', '^0Hrac byl pridan na whitelist!' } })
		end)
	end
end, function (source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficienct permissions!' } })
end, {help = "Pridat hrace na whitelist", params = {{name = "steam hex", help = "steam hex od hrace"}}})

local DiscordLogUrl = 'https://discordapp.com/api/webhooks/727453833902555257/CsNdIcX7ffRyuQEMqFp3bDOef_RxgyJg3zk697pXVW8-gTb8LkjJX2wLrpqfH9raCaPs'

function sendBanLogToDiscord(source, hex, reason, length, targetName)
	local time = os.date("%d/%m/%Y %X")
	local name = GetPlayerName(source)
    local identifier = GetPlayerIdentifiers(source)
    local msg = nil
    if targetName then
        msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. 'udelil ban na hrace **' .. targetName .. '** **' .. hex .. '** za **' .. reason .. '** na **' .. length .. '** den/dny/dni'
    else
        msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. 'udelil offline ban na hex hrace **' .. hex .. '** za **' .. reason .. '** na **' .. length .. '** den/dny/dni'
    end
	PerformHttpRequest(DiscordLogUrl, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end

TriggerEvent("es:addGroupCommand", 'ban', "helper", function(source, args, user)
    local _source = source

    if not args[1] then
        TriggerClientEvent('chat:addMessage', source, { args = {"^1NNBAN", "Musis zadat ID hrace"}})
        return
    end

    if not args[2] then
        TriggerClientEvent('chat:addMessage', source, { args = {"^1NNBAN", "Musis zadat delku banu v dnech"}})
        return
    end

    local target = tonumber(args[1])

    -- TIME
    local length = tonumber(args[2])
    local time = os.time() + length * 60 * 60 * 24
    if length == 0 then
        time = 0
    end

    -- REASON
    local reason = args
    table.remove(reason, 1)
    table.remove(reason, 1)
    if (#reason == 0) then
        reason = "Byl/a jsi zabanovan na tomto serveru"
    else
        reason = "" .. table.concat(reason, " ")
    end

    if GetPlayerName(target) then
        local targetName = GetPlayerName(target)
        local targetIdentifiers = GetPlayerIdentifiers(target)
        local targetHex = targetIdentifiers[1]

        sendBanLogToDiscord(_source, targetHex, reason, length, targetName)
        insertNewBanIntoDatabase(targetHex, time, reason, GetPlayerName(source), targetIdentifiers)
        if length ~= 0 then
            DropPlayer(target, "Dostal/a jsi ban za: " .. reason .. "\nVyprsi: " .. (os.date("%d/%m/%Y %X", time)))
        else
            DropPlayer(target, "Dostal/a jsi perma ban za: " .. reason)
        end
        TriggerClientEvent('chat:addMessage', -1, {
            args = {"^1SYSTEM", "^2" .. targetName .. "^0 byl/a vyhozen/a (^2" .. reason .. "^0)"}
        })
    else
        TriggerClientEvent('chat:addMessage', source, { args = {"^1NNBAN", "Hrac s timto ID neni ve hre"}})
    end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^1NNBAN", "Insufficienct permissions!"} })
end, {
	help = "Zabanovat hrace",
	params = {{name = "userid", help = "ID hrace"},
	{name = "delka", help = "Delka banu (dny)"},
	{name = "duvod", help = "Duvod"}}}
)

TriggerEvent("es:addGroupCommand", 'oban', "helper", function(source, args, user)
    local _source = source

    if not args[1] then
        TriggerClientEvent('chat:addMessage', source, { args = {"^1NNBAN", "Musis zadat HEX hrace"}})
        return
    end

    if not args[2] then
        TriggerClientEvent('chat:addMessage', source, { args = {"^1NNBAN", "Musis zadat delku banu v dnech"}})
        return
    end

    local targetHex = args[1]

    -- TIME
    local length = tonumber(args[2])
    local time = os.time() + length * 60 * 60 * 24
    if length == 0 then
        time = 0
    end

    -- REASON
    local reason = args
    table.remove(reason, 1)
    table.remove(reason, 1)
    if (#reason == 0) then
        reason = "Byl/a jsi zabanovan na tomto serveru"
    else
        reason = "" .. table.concat(reason, " ")
    end

    sendBanLogToDiscord(_source, targetHex, reason, length)
    insertNewBanIntoDatabase('steam:' .. targetHex, time, reason, GetPlayerName(source))
    TriggerClientEvent('chat:addMessage', source, { args = {"^1NNBAN", "Hrac zabanovan!"}})
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^1NNBAN", "Insufficienct permissions!"} })
end, {
	help = "Zabanovat hrace",
	params = {{name = "HEX", help = "HEX hrace"},
	{name = "delka", help = "Delka banu (dny)"},
	{name = "duvod", help = "Duvod"}}}
)