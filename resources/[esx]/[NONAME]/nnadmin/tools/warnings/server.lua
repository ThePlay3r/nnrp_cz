local ESX = nil

Citizen.CreateThread(function()
    TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
    while ESX == nil do Wait(0) end

    ESX.RegisterServerCallback("warnings:warn", function(source, cb, target, message)
        if not target or not message then
            return
        end

        local xPlayer = ESX.GetPlayerFromId(source)
        local xTarget = ESX.GetPlayerFromId(target)
        
        if not xPlayer or not xTarget then
            cb(nil)
            return
        end
        
        if isAdmin(xPlayer) then
            sendWarningToPlayer(xPlayer,xTarget,message)
            cb(true)
        else
            logUnauthorizedUsage(xPlayer)
            cb(false)
        end
    end)
end)

function sendWarningToPlayer (xPlayer, xTarget, message)
    MySQL.Async.execute(
        "INSERT INTO warnings(id,user,user_name,admin,admin_name,message) VALUES(NULL,@user,@username,@admin,@adminname,@message)",
        {
            ["@user"] = xTarget.identifier,
            ["@username"] = xTarget.getName(),
            ["@admin"] = xPlayer.identifier,
            ["@adminname"] = xPlayer.getName(),
            ["@message"] = message,
        }
    )
    TriggerClientEvent("warnings:receiveWarn", xTarget.source, xPlayer.getName(), message)
    sendMessageToAllAdmins(("Admin ^1%s^7 varoval ^1%s^7 (%s), text: '%s'"):format(xPlayer.getName(),xTarget.getName(),xTarget.identifier,message))
    sendMessageToDiscord(("Admin %s varoval %s (%s) \ntext: '%s'"):format(xPlayer.getName(),xTarget.getName(),xTarget.identifier,message))
end

function isAdmin (xPlayer)
    for k,v in ipairs(Config.admin_groups) do
        if xPlayer.getGroup() == v then return true end
    end
    return false
end

function logUnauthorizedUsage (xPlayer)
    if not xPlayer then return end
    
    print(("[^1"..GetCurrentResourceName().."^7] Hráč %s (%s) se pokusil použít /warn."):format(xPlayer.getName(), xPlayer.identifier))
    sendMessageToAllAdmins(("Hráč %s (%s) se pokusil použít /warn."):format(xPlayer.getName(), xPlayer.identifier))
end

function sendMessageToAllAdmins (msg)
    for k,v in ipairs(ESX.GetPlayers()) do
        if isAdmin(ESX.GetPlayerFromId(v)) then
            TriggerClientEvent("chat:addMessage", v, {color={255,0,0}, multiline=false, args={"VAROVÁNÍ: ", msg}})
        end
    end
end

function sendMessageToDiscord (msg)
    if Config.warningsDiscordHook~=nil then
        PerformHttpRequest(Config.warningsDiscordHook, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
    end
end