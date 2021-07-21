local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

local Notification = nil
local isBeingShown = false

AddEventHandler("nncore:sendSmsNotification", function(text, contact)
    local contactName = contact
    if contact == 'cosanostra' then
        contactName = 'Taxi'
    end
    Notification = {
        text = text,
        contact = 'Od: ' .. contactName,
    }
end)

RegisterNetEvent('nncore:sendNotification')
AddEventHandler("nncore:sendNotification", function(text, label)
    Notification = {
        text = text,
        contact = label,
    }
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if Notification ~= nil and not isBeingShown then
            isBeingShown = true
            SendNUIMessage({ type = "sendNotificaton", text = Notification.text, contact = Notification.contact})
            Citizen.Wait(5000)
            Notification = nil
            isBeingShown = false
            SendNUIMessage({ type = "clearNotification"})
        end
    end
end)
