TriggerEvent('chat:addSuggestion', '/did', 'Vyhodnoti danou situaci jestli se povedla s vysledkem ANO/NE')
TriggerEvent('chat:addSuggestion', '/try', 'Vyhodnoti danou situaci jestli se povedla s vysledkem ANO/NE')

RegisterCommand('did', function(source, args, rawCommand)
    sendTry()
end)

RegisterCommand('try', function(source, args, rawCommand)
    sendTry()
end)

local table = {
    [1] = "ANO", 
    [2] = "NE",
}

function sendTry ()
    local result = table[math.random(1,2)]

    TriggerServerEvent('3ddo:shareDisplay', '[ ' .. result .. ' ]', true)
end