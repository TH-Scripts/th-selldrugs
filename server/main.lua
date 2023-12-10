ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback('th-selldrugs:drugCountEcstasy', function(source, cb)
    local countEcstasy = exports.ox_inventory:GetItemCount(1, Config.Drugs.ecstasy)
    cb(countEcstasy)
end)

ESX.RegisterServerCallback('th-selldrugs:drugCountCannabis', function(source, cb)
    local countCannabis = exports.ox_inventory:GetItemCount(1, Config.Drugs.cannabis)
    cb(countCannabis)
end)

RegisterNetEvent('th-selldrugs:sell', function(sellCannabis, sellEcstasy)
    local ecstacy  = exports.ox_inventory:GetItemCount(1, Config.Drugs.ecstasy)
    local cannabis = exports.ox_inventory:GetItemCount(1, Config.Drugs.cannabis)
    local drugType = nil

    if sellEcstasy then
        drugType = Config.Drugs.ecstasy
        if ecstacy < 1 then
            TriggerClientEvent('th-selldrugs:stopDrugSale', source)
            x = 0
        elseif ecstacy == 1 then
            x = 1
        elseif ecstacy == 2 then
            x = math.random(1,2)
        elseif ecstacy >= 3 then
            x = math.random(1,3)
        end
    end

    if sellCannabis then
        drugType = Config.Drugs.cannabis
        if cannabis < 1 then
            x = 0
            TriggerClientEvent('th-selldrugs:stopDrugSale', source)
        elseif cannabis == 1 then
            x = 1
        elseif cannabis == 2 then
            x = math.random(1,2)
        elseif cannabis >= 3 then
            x = math.random(1,3)
        end
    end

    if drugType == Config.Drugs.ecstasy then
        money = Config.Drugs.ecstasyPrice * x
    elseif drugType == Config.Drugs.cannabis then
        money = Config.Drugs.cannabisPrice * x
    end

    if drugType ~= nil then
        exports.ox_inventory:RemoveItem(1, drugType, x)
    end

    exports.ox_inventory:AddItem(1, Config.BlackMoneyItem, money)
end)

RegisterNetEvent('th-selldrug:dispatch', function(pedPos)
    if Config.Calllist == 'omikkel' then
        exports["omik_callist"]:newCall(source, "Drug salg", Config.PoliceJob, pedPos)
    elseif Config.Calllist == 'visualz' then
        exports['visualz_opkaldsliste']:AddCall(source, "Drug salg", Config.PoliceJob, pedPos)
    elseif Config.Callist == 'custom' then
        print('[X] Calllist indsat forkert!')
        --Indsæt dit eget dispatch system her
    end
end)