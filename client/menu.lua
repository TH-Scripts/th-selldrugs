currentDrug = 'Intet'
canSell = nil
disabledEcstasy = nil

function checkCount()
    if ecstasy <= 1 then
        disabledEcstasy = true
    end
end


function Drugmenu()
    if sellstarted == nil then
        lib.registerContext({
            id = 'selldrugs_notstarted',
            title = 'Påbegynd salg af drugs',
            options = {
            {
                title = Config.Title..'\n Drug valgt: ' ..currentDrug,
            },
            {
                title = 'Vælg dryg-type',
                description = 'Vælg hvilket drug-type du ønsker at sælge',
                icon = 'clipboard',
                onSelect = function()
                    print('hello')
                    if cannabis > 0 or ecstasy > 0 then
                        DrugmenuStoffer()
                        canSell = true
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
                    if canSell == nil then
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
    checkCount()
    if sellstarted == nil then
        lib.registerContext({
            id = 'drug_type_notstarted',
            title = 'Forskellige drugs',
            menu = 'selldrugs_notstarted',
            onBack = function()
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
                end
            },
            {
                title = 'Cannabis',
                description = 'Tryk for at vælge cannabis!\n ANTAL: '..cannabis,
                icon = 'cannabis',
                onSelect = function()
                    currentDrug = 'Cannabis - Antal '..cannabis..''
                    Drugmenu()
                end
            },
            }
        })
        lib.showContext('drug_type_notstarted')
    end
end