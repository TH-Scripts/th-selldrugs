ESX          = exports["es_extended"]:getSharedObject()
sellstarted  = nil
sellingnow   = false
currentped   = nil
interactedNPCs = {}
forbiddenPeds = Config.forbiddenPeds

RegisterCommand(Config.DrugmenuCommand, function()
    TriggerEvent('th-selldrugs:getDrugCounts')
    Drugmenu()
end)

RegisterKeyMapping(Config.DrugmenuCommand, 'Åben drugmenu', 'keyboard', Config.defaultKeybind)

AddEventHandler('th-selldrugs:getDrugCounts', function()
    ESX.TriggerServerCallback('th-selldrugs:drugCountEcstasy', function(count)
        ecstasy = count

        if ecstasy <= 0 then
            disabledEcstasy = true
        else
            disabledEcstasy = false
        end

    end)
    ESX.TriggerServerCallback('th-selldrugs:drugCountCannabis', function(count2)
        cannabis = count2

        if cannabis <= 0 then
            disabledCannabis = true
        else
            disabledCannabis = false
        end

    end)
    ESX.TriggerServerCallback('th-selldrugs:drugCountHeroin', function(count3)
        heroin = count3

        if heroin <= 0 then
            disabledHeroin = true
        else
            disabledHeroin = false
        end

    end)
end)

Citizen.CreateThread(function(ecstasy, cannabis)
    while true do
        Citizen.Wait(10)
        if sellstarted then
            local player = GetPlayerPed(-1)
            local playerlocation = GetEntityCoords(player)
            local handle, ped = FindFirstPed()
            local success
            repeat
                success, ped = FindNextPed(handle)
                local pedPos = GetEntityCoords(ped)
                local distance = GetDistanceBetweenCoords(pedPos.x, pedPos.y, pedPos.z, playerlocation.x, playerlocation.y, playerlocation.z, true)
                if sellEcstasy or sellCannabis or sellHeroin then
                    if DoesEntityExist(ped) then
                        if not IsPedInAnyVehicle(player) and not IsPedDeadOrDying(ped) and not IsPedDeadOrDying(player) and not IsPedInAnyVehicle(ped) then
                            local pedType = GetPedType(ped)
                            if pedType ~= 28 and IsPedAPlayer(ped) == false then
                                currentped = pos
                                if distance <= Config.MaxDistance and ped ~= player and ped ~= oldped and IsControlJustPressed(1, 38) then
                                    if not sellingnow then 
                                        local isForbiddenPed = false
                                        for _, forbiddenPedHash in ipairs(forbiddenPeds) do
                                            if GetEntityModel(ped) == GetHashKey(forbiddenPedHash) then
                                                isForbiddenPed = true
                                                notifyForbiddenPed()
                                                break
                                            end
                                        end

                                        if not isForbiddenPed then
                                            local hasInteracted = false
                                            for _, npc in ipairs(interactedNPCs) do
                                                if npc == ped then
                                                    hasInteracted = true
                                                    notifyClientAlready()
                                                    break
                                                end
                                            end

                                            if not hasInteracted then
                                                if distance <= Config.MaxDistance then
                                                    local RejectChance = math.random(1, Config.PedReject)
                                                    if RejectChance == Config.PedReject then
                                                        oldped = ped
                                                        local reportCrime = math.random(1, Config.Cops)
                                                        table.insert(interactedNPCs, ped)
                                                        if reportCrime == Config.Cops then
                                                            notifyPoliceCall()
                                                            TriggerServerEvent('th-selldrug:dispatch', pedPos)
                                                        else
                                                            notifyPedReject()
                                                        end
                                                    else
                                                        oldped = ped
                                                        freezePed(ped)
                                                        freezePlayer(player)
                                                        
                                                        TaskTurnPedToFaceEntity(player, ped, -1)
                                                        TaskTurnPedToFaceEntity(ped, player, -1)
                                                        
                                                        table.insert(interactedNPCs, ped)
                                                        if lib.progressBar({
                                                            duration = Config.Progress.tid,
                                                            label = Config.Progress.tekst,
                                                            useWhileDead = Config.Progress.useWhileDead,
                                                            canCancel = Config.Progress.canCancel,
                                                        }) then 
                                                            paperAnim(player)
                                                            moneyAnim(ped)
                                                            sellingnow = true
                                                            sellDrugs(sellCannabis, sellEcstasy, sellHeroin)
                                                        end
                                                    end
                                                else
                                                    notifyToLongDistance()
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            until not success

            EndFindPed(handle)
        end
    end
end)

RegisterNetEvent('th-selldrugs:stopDrugSale')
AddEventHandler('th-selldrugs:stopDrugSale', function()
    sellstarted = nil
    currentDrug = 'Intet'
    sellEcstasy = false
    sellCannabis = false
    sellHeroin = false
    canStartSell = nil
end)

function sellDrugs(sellCannabis, sellEcstasy, sellHeroin)
    if sellingnow then
        TriggerServerEvent('th-selldrugs:sell', sellCannabis, sellEcstasy, sellHeroin)
        -- indsæt dit zone export, eller serverevent her
        sellingnow = false
    end
end