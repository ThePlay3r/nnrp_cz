function sendLogToDiscordWithCustomUrl (msg, url)
    PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end

function sendAdminLogToDiscord (msg)
    if Config.AdminLogHook~=nil and Config.AdminLogEnabled then
        PerformHttpRequest(Config.AdminLogHook, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
    end
end

function sendAdminLogToDiscordWithTime (message)
    if Config.AdminLogHook~=nil and Config.AdminLogEnabled then
        local msg = os.date("%d.%m.%Y %X") .. ' - ' .. message
        PerformHttpRequest(Config.AdminLogHook, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
    end
end

exports('sendAdminLogToDiscord', sendAdminLogToDiscord)
exports('sendAdminLogToDiscordWithTime', sendAdminLogToDiscordWithTime)