WhiteList = {}
local prevLength = 0
local currentLength = 0
local Bans = {}

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

function loadWhiteList(cb)
	Whitelist = {}
	prevLength = tablelength(WhiteList)

	MySQL.Async.fetchAll('SELECT identifier FROM whitelist', {}, function(result)
		for k,v in ipairs(result) do
			WhiteList[v.identifier] = true
		end

		currentLength = tablelength(WhiteList)

		if prevLength == 0 then
			prevLength = currentLength
		end

		if cb then
			cb()
		end
	end)
end

function sendWLInfoToDiscord()
	local msg = 'Whitelist nacten pro cekajici lidi! (' .. currentLength - prevLength .. ')'
	local url = 'https://discordapp.com/api/webhooks/729307703582654466/yt0vdpGNXAOwWuutKOwE9CLCVI5qT3HHUMGDsU-8NM8pDACUo_WIdFIxaU22KSMtL8gT'
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end

function Autoload ()
	if prevLength ~= currentLength then
		loadWhiteList(function()
			sendWLInfoToDiscord()
		end)
	end
	SetTimeout(Config.AutoReloadInterval, Autoload)
end

function loadBansFromDatabase ()
	MySQL.Async.fetchAll('SELECT * FROM bans', {}, function(bans)
		for k, item in ipairs(bans) do
			Bans[item.identifier] = item
		end
	end)
end

function insertNewBanIntoDatabase (identifier, expires, reason, admin, identifiers)
	if Bans[identifier] then
		deleteBanFromDatabase(identifier)
	end

    MySQL.Async.execute(
        "INSERT INTO bans (identifier, expires, reason, admin, identifiers) VALUES(@identifier, @expires, @reason, @admin, @identifiers)",
        {
			["@identifier"] = identifier,
			["@expires"] = expires,
			["@reason"] = reason,
			["@admin"] = admin,
			["@identifiers"] = identifiers,
		}, function(rowsChanged)
			if rowsChanged > 0 then
				Bans[identifier] = {
					identifier = identifier,
					expires = expires,
					reason = reason,
					admin = admin,
				}
			end
		end
    )
end

function deleteBanFromDatabase (identifier)
	MySQL.Async.execute('DELETE FROM bans WHERE identifier = @identifier', {
		['@identifier'] = identifier,
	}, function(rowsChanged)
		if rowsChanged > 0 then
			for k, item in ipairs(Bans) do
				if item.identifier == identifier then
					table.remove(Bans, k)
				end
			end
		end
	end)
end

MySQL.ready(function()
	loadWhiteList()
	loadBansFromDatabase()
	-- SetTimeout(Config.AutoReloadInterval, Autoload)
end)

function HasPlayerAnyBan (identifier)
	if Bans[identifier] then
		local item = Bans[identifier]
		local banExpires = tonumber(item.expires)

		if banExpires > 0 and banExpires <= os.time() then
			deleteBanFromDatabase(identifier)
			return nil
		else
			return item
		end
	end

	return nil
end

AddEventHandler('playerConnecting', function(name, setCallback, deferrals)
	-- Mark this connection as deferred, this is to prevent problems while checking player identifiers.
	deferrals.defer()

	local playerId, kickReason, identifier = source
	
	-- Letting the user know what's going on.
	deferrals.update(_U('whitelist_check'))
	
	-- Needed, not sure why.
	Citizen.Wait(100)
	
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'steam:') then
			identifier = v
			break
		end
	end

	local playerBan = HasPlayerAnyBan(identifier)

	if playerBan then
		if playerBan.expires == 0 then
			kickReason = string.format( "Mas ban: " .. playerBan.reason .. "\nVyprsi: PERMA")
		else
			kickReason = string.format( "Mas ban: " .. playerBan.reason .. "\nVyprsi: " .. (os.date("%d/%m/%Y %X", playerBan.expires)) )
		end
	elseif #WhiteList == 0 then
		kickReason = _U('whitelist_empty')
	elseif not identifier then
		kickReason = _U('license_missing')
	elseif not WhiteList[identifier] then
		kickReason = _U('not_whitelisted')
	end

	if kickReason then
		deferrals.done(kickReason)
	else
		deferrals.done()
	end
end)
