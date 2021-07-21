local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_casinojob:getVaultWeapons', function(source, cb)
    TriggerEvent('esx_datastore:getSharedDataStore', 'society_casino', function(store)
        local weapons = store.get('weapons')

        if weapons == nil then
            weapons = {}
        end

        cb(weapons)
    end)
end)

ESX.RegisterServerCallback('esx_casinojob:addVaultWeapon', function(source, cb, weaponName)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeWeapon(weaponName)

    TriggerEvent('esx_datastore:getSharedDataStore', 'society_casino', function(store)
        local weapons = store.get('weapons')

        if weapons == nil then
            weapons = {}
        end

        local foundWeapon = false

        for i=1, #weapons, 1 do
            if weapons[i].name == weaponName then
            weapons[i].count = weapons[i].count + 1
            foundWeapon = true
            end
        end

        if not foundWeapon then
            table.insert(weapons, {
            name  = weaponName,
            count = 1
            })
        end

        store.set('weapons', weapons)
        cb()
    end)
end)

ESX.RegisterServerCallback('esx_casinojob:removeVaultWeapon', function(source, cb, weaponName)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addWeapon(weaponName, 1000)

    TriggerEvent('esx_datastore:getSharedDataStore', 'society_casino', function(store)
        local weapons = store.get('weapons')

        if weapons == nil then
            weapons = {}
        end

        local foundWeapon = false

        for i=1, #weapons, 1 do
            if weapons[i].name == weaponName then
                weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
                foundWeapon = true
            end
        end

        if not foundWeapon then
            table.insert(weapons, {
                name  = weaponName,
                count = 0
            })
        end

        store.set('weapons', weapons)
        cb()
    end)
end)