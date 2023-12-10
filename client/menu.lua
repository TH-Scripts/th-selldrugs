currentDrug = 'Intet'
sellEcstasy = false
sellCannabis = false
sellHeroin = false
canStartSell = nil


function Drugmenu()
    if sellstarted == nil then
        lib.registerContext({
            id = 'selldrugs_notstarted',
            title = TranslateCap('drugmenu_title_context'),
            onExit = function()
                currentDrug = 'Intet'
                sellstarted = nil
                canStartSell = nil
            end,
            options = {
            {
                title = Config.Title..'\n Drug valgt: ' ..currentDrug,
            },
            {
                title = TranslateCap('drugmenu_title'),
                description = TranslateCap('drugmenu_title_desc'),
                icon = 'clipboard',
                onSelect = function()
                    if cannabis > 0 or ecstasy > 0 or heroin > 0 then
                        DrugmenuStoffer()
                    else
                        notifyHarIngenDrugs()
                    end
                end
            },
            {
                title = TranslateCap('drugmenu_sale_title'),
                description = TranslateCap('drugmenu_sale_title_desc'),
                icon = 'circle-check',
                onSelect = function()
                    if canStartSell == nil then
                        notifyChooseDrug()
                    else 
                        sellstarted = true
                        notifySalgStart()
                    end
                end
            },
            }
        })
        lib.showContext('selldrugs_notstarted')
    end

    if sellstarted then
        lib.registerContext({
            id = 'selldrugs_started',
            title = TranslateCap('drugmenu_sale_stop_title'),
            options = {
            {
                title = Config.Title,
            },
            {
                title = TranslateCap('drugmenu_sale_stop'),
                description = TranslateCap('drugmenu_sale_stop_desc'),
                icon = 'circle-xmark',
                onSelect = function()
                    TriggerEvent('th-selldrugs:stopDrugSale')
                end
            },
            }
        })
        lib.showContext('selldrugs_started')
    end
end

function DrugmenuStoffer()
    if sellstarted == nil then
        lib.registerContext({
            id = 'drug_type_notstarted',
            title = 'Forskellige drugs',
            onExit = function()
                currentDrug = 'Intet'
                sellstarted = nil
                canStartSell = nil
            end, 
            options = {
            {
                title = Config.Title,
            },
            {
                title = TranslateCap("ecstasy_context_title"),
                description = TranslateCap("ecstasy_context_desc")..'\n ANTAL: '..ecstasy,
                icon = 'tablets',
                disabled = disabledEcstasy,
                onSelect = function()
                    currentDrug = TranslateCap("ecstasy_context_currentDrug")..' - Antal '..ecstasy..''
                    Drugmenu()
                    sellEcstasy = true
                    canStartSell = true
                end
            },
            {
                title = TranslateCap('joints_context_title'),
                description = TranslateCap("joints_context_desc")..'\n ANTAL: '..cannabis,
                icon = 'joint',
                disabled = disabledCannabis,
                onSelect = function()
                    currentDrug = TranslateCap("joints_context_currentDrug")..' - Antal '..cannabis..''
                    Drugmenu()
                    sellCannabis = true
                    canStartSell = true
                end
            },
            {
                title = TranslateCap('heroin_context_title'),
                description = TranslateCap("heroin_context_desc")..'\n ANTAL: '..heroin,
                icon = 'syringe',
                disabled = disabledHeroin,
                onSelect = function()
                    currentDrug = TranslateCap("heroin_context_currentDrug")..' - Antal '..heroin..''
                    Drugmenu()
                    sellHeroin = true
                    canStartSell = true
                end
            },
            }
        })
        lib.showContext('drug_type_notstarted')
    end
end
