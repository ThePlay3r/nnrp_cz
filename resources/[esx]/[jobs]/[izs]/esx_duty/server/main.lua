ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

RegisterServerEvent('duty:police')
AddEventHandler('duty:police', function(job)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'police' then
        sendLogToDiscord(source, Config.LogsUrl.Police, 'OffDuty')
    elseif xPlayer.job.name == 'offpolice' then
        sendLogToDiscord(source, Config.LogsUrl.Police, 'OnDuty')
    end

    if xPlayer.job.name == 'police' and xPlayer.job.grade == 1 then
        xPlayer.setJob('offpolice', 1)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 2 then
        xPlayer.setJob('offpolice', 2)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 0 then
        xPlayer.setJob('offpolice', 0)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 5 then
        xPlayer.setJob('offpolice', 5)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 6 then
        xPlayer.setJob('offpolice', 6)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 7 then
        xPlayer.setJob('offpolice', 7)	
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 8 then
        xPlayer.setJob('offpolice', 8)	
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 3 then
        xPlayer.setJob('offpolice', 3)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 4 then
        xPlayer.setJob('offpolice', 4)
    end

    if xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 1 then
        xPlayer.setJob('police', 1)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 2 then
        xPlayer.setJob('police', 2)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 0 then
        xPlayer.setJob('police', 0)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 5 then
        xPlayer.setJob('police', 5)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 6 then
        xPlayer.setJob('police', 6)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 7 then
        xPlayer.setJob('police', 7)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 8 then
        xPlayer.setJob('police', 8)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 3 then
        xPlayer.setJob('police', 3)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 4 then
        xPlayer.setJob('police', 4)
    end
end)


RegisterServerEvent('duty:sheriff')
AddEventHandler('duty:sheriff', function(job)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'sheriff' then
        sendLogToDiscord(source, Config.LogsUrl.Sheriff, 'OffDuty')
    elseif xPlayer.job.name == 'offsheriff' then
        sendLogToDiscord(source, Config.LogsUrl.Sheriff, 'OnDuty')
    end

    if xPlayer.job.name == 'sheriff' then
        xPlayer.setJob('offsheriff', xPlayer.job.grade)
    end

    if xPlayer.job.name == 'offsheriff' then
        xPlayer.setJob('sheriff', xPlayer.job.grade)
    end
end)

RegisterServerEvent('duty:ambulance')
AddEventHandler('duty:ambulance', function(job)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'ambulance' then
        sendLogToDiscord(source, Config.LogsUrl.Ambulance, 'OffDuty')
    elseif xPlayer.job.name == 'offambulance' then
        sendLogToDiscord(source, Config.LogsUrl.Ambulance, 'OnDuty')
    end

    if xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 1 then
        xPlayer.setJob('offambulance', 1)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 2 then
        xPlayer.setJob('offambulance', 2)
	elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 0 then
        xPlayer.setJob('offambulance', 0)
	elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 4 then
        xPlayer.setJob('offambulance', 4)	
	elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 5 then
        xPlayer.setJob('offambulance', 5)
	elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 6 then
        xPlayer.setJob('offambulance', 6)
	elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 7 then
        xPlayer.setJob('offambulance', 7)
	elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 8 then
        xPlayer.setJob('offambulance', 8)
	elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 9 then
        xPlayer.setJob('offambulance', 9)
	elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 10 then
        xPlayer.setJob('offambulance', 10)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 11 then
        xPlayer.setJob('offambulance', 11)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 12 then
        xPlayer.setJob('offambulance', 12)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 3 then
        xPlayer.setJob('offambulance', 3)
    end

    if xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 1 then
        xPlayer.setJob('ambulance', 1)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 2 then
        xPlayer.setJob('ambulance', 2)
	elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 0 then
        xPlayer.setJob('ambulance', 0)	
	elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 4 then
        xPlayer.setJob('ambulance', 4)
	elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 5 then
        xPlayer.setJob('ambulance', 5)
	elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 6 then
        xPlayer.setJob('ambulance', 6)
	elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 7 then
        xPlayer.setJob('ambulance', 7)
	elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 8 then
        xPlayer.setJob('ambulance', 8)
	elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 9 then
        xPlayer.setJob('ambulance', 9)
	elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 10 then
        xPlayer.setJob('ambulance', 10)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 11 then
        xPlayer.setJob('ambulance', 11)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 12 then
        xPlayer.setJob('ambulance', 12)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 3 then
        xPlayer.setJob('ambulance', 3)
    end
end)

RegisterServerEvent('duty:hasici')
AddEventHandler('duty:hasici', function(job)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'hasici' then
        sendLogToDiscord(source, Config.LogsUrl.Hasici, 'OffDuty')
    elseif xPlayer.job.name == 'offhasici' then
        sendLogToDiscord(source, Config.LogsUrl.Hasici, 'OnDuty')
    end

    if xPlayer.job.name == 'hasici' and xPlayer.job.grade == 0 then
        xPlayer.setJob('offhasici', 0)
    elseif xPlayer.job.name == 'hasici' and xPlayer.job.grade == 1 then
        xPlayer.setJob('offhasici', 1)
    elseif xPlayer.job.name == 'hasici' and xPlayer.job.grade == 2 then
        xPlayer.setJob('offhasici', 2)
    elseif xPlayer.job.name == 'hasici' and xPlayer.job.grade == 3 then
        xPlayer.setJob('offhasici', 3)
    elseif xPlayer.job.name == 'hasici' and xPlayer.job.grade == 4 then
        xPlayer.setJob('offhasici', 4)
    elseif xPlayer.job.name == 'hasici' and xPlayer.job.grade == 5 then
        xPlayer.setJob('offhasici', 5)
    elseif xPlayer.job.name == 'hasici' and xPlayer.job.grade == 6 then
        xPlayer.setJob('offhasici', 6)
    elseif xPlayer.job.name == 'hasici' and xPlayer.job.grade == 7 then
        xPlayer.setJob('offhasici', 7)
    elseif xPlayer.job.name == 'hasici' and xPlayer.job.grade == 8 then
        xPlayer.setJob('offhasici', 8)
    elseif xPlayer.job.name == 'hasici' and xPlayer.job.grade == 9 then
        xPlayer.setJob('offhasici', 9)
    end

    if xPlayer.job.name == 'offhasici' and xPlayer.job.grade == 0 then
        xPlayer.setJob('hasici', 0)
    elseif xPlayer.job.name == 'offhasici' and xPlayer.job.grade == 1 then
        xPlayer.setJob('hasici', 1)
    elseif xPlayer.job.name == 'offhasici' and xPlayer.job.grade == 2 then
        xPlayer.setJob('hasici', 2)
    elseif xPlayer.job.name == 'offhasici' and xPlayer.job.grade == 3 then
        xPlayer.setJob('hasici', 3)
    elseif xPlayer.job.name == 'offhasici' and xPlayer.job.grade == 4 then
        xPlayer.setJob('hasici', 4)
    elseif xPlayer.job.name == 'offhasici' and xPlayer.job.grade == 5 then
        xPlayer.setJob('hasici', 5)
    elseif xPlayer.job.name == 'offhasici' and xPlayer.job.grade == 6 then
        xPlayer.setJob('hasici', 6)
    elseif xPlayer.job.name == 'offhasici' and xPlayer.job.grade == 7 then
        xPlayer.setJob('hasici', 7)
    elseif xPlayer.job.name == 'offhasici' and xPlayer.job.grade == 8 then
        xPlayer.setJob('hasici', 8)
    elseif xPlayer.job.name == 'offhasici' and xPlayer.job.grade == 9 then
        xPlayer.setJob('hasici', 9)
    end
end)

RegisterServerEvent('duty:state')
AddEventHandler('duty:state', function(job)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'state' then
        sendLogToDiscord(source, Config.LogsUrl.State, 'OffDuty')
    elseif xPlayer.job.name == 'offstate' then
        sendLogToDiscord(source, Config.LogsUrl.State, 'OnDuty')
    end

    if xPlayer.job.name == 'state' and xPlayer.job.grade == 0 then
        xPlayer.setJob('offstate', 0)
    elseif xPlayer.job.name == 'state' and xPlayer.job.grade == 1 then
        xPlayer.setJob('offstate', 1)
    elseif xPlayer.job.name == 'state' and xPlayer.job.grade == 2 then
        xPlayer.setJob('offstate', 2)
    elseif xPlayer.job.name == 'state' and xPlayer.job.grade == 3 then
        xPlayer.setJob('offstate', 3)
    elseif xPlayer.job.name == 'state' and xPlayer.job.grade == 4 then
        xPlayer.setJob('offstate', 4)
    elseif xPlayer.job.name == 'state' and xPlayer.job.grade == 5 then
        xPlayer.setJob('offstate', 5)
    elseif xPlayer.job.name == 'state' and xPlayer.job.grade == 6 then
        xPlayer.setJob('offstate', 6)
    end

    if xPlayer.job.name == 'offstate' and xPlayer.job.grade == 0 then
        xPlayer.setJob('state', 0)
    elseif xPlayer.job.name == 'offstate' and xPlayer.job.grade == 1 then
        xPlayer.setJob('state', 1)
    elseif xPlayer.job.name == 'offstate' and xPlayer.job.grade == 2 then
        xPlayer.setJob('state', 2)
    elseif xPlayer.job.name == 'offstate' and xPlayer.job.grade == 3 then
        xPlayer.setJob('state', 3)
    elseif xPlayer.job.name == 'offstate' and xPlayer.job.grade == 4 then
        xPlayer.setJob('state', 4)
    elseif xPlayer.job.name == 'offstate' and xPlayer.job.grade == 5 then
        xPlayer.setJob('state', 5)
    elseif xPlayer.job.name == 'offstate' and xPlayer.job.grade == 6 then
        xPlayer.setJob('state', 6)
    end
end)

--notification
function sendNotification(xSource, message, messageType, messageTimeout)
    TriggerClientEvent("pNotify:SendNotification", xSource, {
        text = message,
        type = messageType,
        queue = "qalle",
        timeout = messageTimeout,
        layout = "bottomCenter"
    })
end

function sendLogToDiscord (source, url, state)
    local time = os.date("%d/%m/%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' se pipnul/a ' .. state
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end