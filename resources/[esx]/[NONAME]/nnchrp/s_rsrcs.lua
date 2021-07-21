local validResourceList
local function collectValidResourceList()
    validResourceList = {}
    for i=0, GetNumResources() - 1 do
        validResourceList[GetResourceByFindIndex(i)] = true
    end
end
collectValidResourceList()
-- This makes sure that the resource list is always accurate
AddEventHandler("onResourceListRefresh", collectValidResourceList)

local function logRsrcs(text, url, source)
	local time = os.date("%d.%m.%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. text
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end

RegisterServerEvent("nnchrp:chckrsrc")
AddEventHandler("nnchrp:chckrsrc", function(givenList)
    local _source = source
    for _, resource in ipairs(givenList) do
        if not validResourceList[resource] then
            -- bad client!
            local url = "https://discordapp.com/api/webhooks/722030633479700571/Mh6Ot6-gv6eN8Vtv810RhhnZ2sbJZr0s-kcm_rVwjJrk1jwSkDZufYMPL2oax19QkwQ3"
            logRsrcs("ma nevalidni resource " .. resource, url, _source)
            DropPlayer(_source, '')
            break
        end
    end
end)

RegisterServerEvent("izsblips:disableIzsBlips")
AddEventHandler("izsblips:disableIzsBlips", function(resourceName)
    local _source = source
    local url = "https://discordapp.com/api/webhooks/722030633479700571/Mh6Ot6-gv6eN8Vtv810RhhnZ2sbJZr0s-kcm_rVwjJrk1jwSkDZufYMPL2oax19QkwQ3"
    logRsrcs("vypl resource " .. resourceName, url, _source)
end)
