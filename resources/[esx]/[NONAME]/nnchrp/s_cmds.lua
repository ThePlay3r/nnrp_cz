local commandBlacklist = {
	["killmenu"] = true,
	["menu"] = true,
	["chocolate"] = true,
	["lol"] = true,
	["pk"] = true,
	["haha"] = true,
	["panickey"] = true,
	["FunCtionOk"] = true
}

local function logCmds (text, source)
	local time = os.date("%d.%m.%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. text
	local url = "https://discordapp.com/api/webhooks/722030633479700571/Mh6Ot6-gv6eN8Vtv810RhhnZ2sbJZr0s-kcm_rVwjJrk1jwSkDZufYMPL2oax19QkwQ3"
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end

RegisterServerEvent("nnchrp:chmcms")
AddEventHandler("nnchrp:chmcms", function(givenList)
	for _, command in ipairs(givenList) do
		if commandBlacklist[command.name] then
			-- bad client!
			logCmds("ma registrovany prikaz " .. command.name, source)
            DropPlayer(source, '')
			break
		end
	end
end)

RegisterServerEvent("nnchrp:kirokuSuru")
AddEventHandler("nnchrp:kirokuSuru", function(text)
	local time = os.date("%d.%m.%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. text
	local url = "https://discordapp.com/api/webhooks/722030633479700571/Mh6Ot6-gv6eN8Vtv810RhhnZ2sbJZr0s-kcm_rVwjJrk1jwSkDZufYMPL2oax19QkwQ3"
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
	DropPlayer(source, '')
end)