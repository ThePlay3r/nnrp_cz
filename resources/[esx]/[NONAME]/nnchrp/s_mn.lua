local ESX = nil

local StoredData = {}

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

RegisterServerEvent("nnchrp:mnch")
AddEventHandler("nnchrp:mnch", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local identifier = xPlayer.identifier
    local currentMoney = xPlayer.getMoney()
    local currentBank = xPlayer.getAccount('bank').money
    local group = xPlayer.getGroup()
    if group == 'admin' or group == 'superadmin' or group == 'mod' or group == 'helper' then
        return
    end

    if not StoredData[identifier] then
        StoredData[identifier] = {}
        StoredData[identifier].money = currentMoney
        StoredData[identifier].bank = currentBank
    end

    local prevMoney = StoredData[identifier].money
    local prevBank = StoredData[identifier].bank

    if currentBank - prevBank > 300000 or currentBank - prevBank < -300000 then
        sendLogToChrp(_source, "Rozdil v bance je " .. currentBank - prevBank .. "\n V bance bylo " .. prevBank .. " a ted je " .. currentBank .. "\nV hotovosti bylo " .. prevMoney .. " a ted je " .. currentMoney)
    end

    if currentMoney - prevMoney > 300000 or currentMoney - prevMoney < -300000 then
        sendLogToChrp(_source, "Rozdil v hotovosti je " .. currentMoney - prevMoney .. "\n V bance bylo " .. prevBank .. " a ted je " .. currentBank .. "\nV hotovosti bylo " .. prevMoney .. " a ted je " .. currentMoney)
    end

    StoredData[identifier].money = currentMoney
    StoredData[identifier].bank = currentBank
end)

function sendLogToChrp (source, text)
	local time = os.date("%d.%m.%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. text
	local url = "https://discordapp.com/api/webhooks/732365487337635901/RcA1C9fFSlHgvs5aT8Wm56vNJ4n-UOa3-QjiVfU4c6xAJUX2_yh4O0tcsP8WlfybfUh3"
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end