local function collectAndSendResourceList()
    local resourceList = {}
    for i=0, GetNumResources() - 1 do
        resourceList[i+1] = GetResourceByFindIndex(i)
    end
    TriggerServerEvent("nnchrp:chckrsrc", resourceList)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(15000)
		collectAndSendResourceList()
	end
end)