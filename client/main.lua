ESX = exports["es_extended"]:getSharedObject()
sellstarted = nil

RegisterCommand(Config.DrugmenuCommand, function()
    Drugmenu()
    TriggerEvent('th-selldrugs:getDrugCounts')
end)

RegisterKeyMapping(Config.DrugmenuCommand, 'Åben drugmenu', 'keyboard', Config.defaultKeybind)

AddEventHandler('th-selldrugs:getDrugCounts', function()
    ESX.TriggerServerCallback('th-selldrugs:drugCountEcstasy', function(count)
        ecstasy = count
    end)
    ESX.TriggerServerCallback('th-selldrugs:drugCountCannbis', function(count2)
        cannabis = count2
    end)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        local player = GetPlayerPed(-1)
        local playerlocation = GetEntityCoords(player)
        local handle, ped = FindFirstPed()
        local success
        repeat
            success, ped = FindNextPed(handle)
            local pedPos = GetEntityCoords(ped)
            local distance = GetDistanceBetweenCoords(pedPos.x, pedPos.y, pedPos.z, playerlocation['x'],playerlocation['y'],playerlocation['z'], true)
            if sellstarted then
                if DoesEntityExist(ped) then
                    if distance <= 3 and ped ~= player and ped ~= oldped and IsControlJustPressed(1, 38) then
                        print('solgt')
                        oldped = ped
                    end
                end
            end
        until not success

        EndFindPed(handle)
    end
end)



