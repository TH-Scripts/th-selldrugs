currentDrug = 'Intet'
sellEcstasy = false
sellCannabis = false
sellHeroin = false


function Drugmenu()
    if sellstarted == nil then
        lib.registerContext({
            id = 'selldrugs_notstarted',
            title = 'Påbegynd salg af drugs',
            onExit = function()
                currentDrug = 'Intet'
                sellstarted = nil
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
                    if sellstarted == nil then
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
                    sellstarted = nil
                    currentDrug = 'Intet'
                    notifySalgStop()
                    sellEcstasy = false
                    sellCannabis = false
                    sellHeroin = false
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
            menu = 'selldrugs_notstarted',
            onBack = function()
                currentDrug = 'Intet'
                sellstarted = nil
            end,
            onExit = function()
                currentDrug = 'Intet'
                sellstarted = nil
            end, 
            options = {
            {
                title = Config.Title,
            },
            {
                title = 'Ecstasy',
                description = 'Tryk for at vælge ecstasy!\n ANTAL: '..ecstasy,
                icon = 'tablets',
                disabled = disabledEcstasy,
                onSelect = function()
                    currentDrug = 'Ecstasy - Antal '..ecstasy..''
                    Drugmenu()
                    sellEcstasy = true
                    sellstarted = true
                end
            },
            {
                title = 'Joints',
                description = 'Tryk for at vælge joints!\n ANTAL: '..cannabis,
                icon = 'joint',
                disabled = disabledCannabis,
                onSelect = function()
                    currentDrug = 'Joints - Antal '..cannabis..''
                    Drugmenu()
                    sellCannabis = true
                    sellstarted = true
                end
            },
            {
                title = 'Heroin',
                description = 'Tryk for at vælge heroin!\n ANTAL: '..heroin,
                icon = 'syringe',
                disabled = disabledHeroin,
                onSelect = function()
                    currentDrug = 'Heroin - Antal '..heroin..''
                    Drugmenu()
                    sellHeroin = true
                    sellstarted = true
                end
            },
            }
        })
        lib.showContext('drug_type_notstarted')
    end
end