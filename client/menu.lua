currentDrug = 'Intet'
canSell     = false
sellEcstasy = false
sellCannabis = false


function Drugmenu()
    if sellstarted == nil then
        lib.registerContext({
            id = 'selldrugs_notstarted',
            title = 'Påbegynd salg af drugs',
            onExit = function()
                canSell     = false
                currentDrug = 'Intet'
                sellstarted = nil
            end,
            options = {
            {
                title = Config.Title..'\n Drug valgt: ' ..currentDrug,
            },
            {
                title = 'Vælg drug-type',
                description = 'Vælg hvilket drug-type du ønsker at sælge',
                icon = 'clipboard',
                onSelect = function()
                    if cannabis > 0 or ecstasy > 0 then
                        DrugmenuStoffer()
                    else
                        notifyHarIngenDrugs()
                    end
                end
            },
            {
                title = 'Påbegynd salg',
                description = 'Påbegynd salg af dit valgte drug her',
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
            title = 'Stop salg af drugs',
            options = {
            {
                title = Config.Title,
            },
            {
                title = 'Afslut salg',
                description = 'Stop med at sælge stoffer',
                icon = 'circle-xmark',
                onSelect = function()
                    sellstarted = nil
                    currentDrug = 'Intet'
                    notifySalgStop()
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
                canSell     = false
                currentDrug = 'Intet'
                sellstarted = nil
            end,
            onExit = function()
                canSell     = false
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
                    currentDrug = 'Ecstasy- Antal '..ecstasy..''
                    Drugmenu()
                    canSell     = true
                    sellEcstasy = true
                    sellstarted = true
                end
            },
            {
                title = 'Cannabis',
                description = 'Tryk for at vælge cannabis!\n ANTAL: '..cannabis,
                icon = 'cannabis',
                disabled = disabledCannabis,
                onSelect = function()
                    currentDrug = 'Cannabis - Antal '..cannabis..''
                    Drugmenu()
                    canSell      = true
                    sellCannabis = true
                    sellstarted = true
                end
            },
            }
        })
        lib.showContext('drug_type_notstarted')
    end
end