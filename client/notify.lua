function notifySalgStart()
    lib.notify({
        id = 'salg_started',
        title = 'Drugs',
        description = 'Du har påbegyndt salg af drugs',
        position = Config.NotifyStyle.position,
        style = Config.NotifyStyle,
        icon = 'cannabis',
        iconColor = '#2bc726'
    })
end

function notifySalgStop()
    lib.notify({
        id = 'salg_started',
        title = 'Drugs',
        description = 'Du har stoppet salget af drugs',
        position = Config.NotifyStyle.position,
        style = Config.NotifyStyle,
        icon = 'circle-xmark',
        iconColor = '#e82e20'
    })
end

function notifyChooseDrug()
    lib.notify({
        id = 'salg_started',
        title = 'Drugs',
        description = 'Du har ikke valgt et drug endnu',
        position = Config.NotifyStyle.position,
        style = Config.NotifyStyle,
        icon = 'exclamation' ,
        iconColor = '#e82e20'
    })
end

function notifyHarIngenDrugs()
    lib.notify({
        id = 'drugs_ingen',
        title = 'Drugs',
        description = 'Du har ingen drugs',
        position = Config.NotifyStyle.position,
        style = Config.NotifyStyle,
        icon = 'exclamation' ,
        iconColor = '#e82e20'
    })
end

function notifyPedReject()
    lib.notify({
        id = 'ped_reject',
        title = 'Person',
        description = 'Personen ønskede ikke at købe dine drugs',
        position = Config.NotifyStyle.position,
        style = Config.NotifyStyle,
        icon = 'hand' ,
        iconColor = '#e82e20'
    })
end

function notifyPedReject()
    lib.notify({
        id = 'ped_reject',
        title = 'Person',
        description = 'Personen ønskede ikke at købe dine drugs',
        position = Config.NotifyStyle.position,
        style = Config.NotifyStyle,
        icon = 'hand' ,
        iconColor = '#e82e20'
    })
end

function notifyPoliceCall()
    lib.notify({
        id = 'ped_reject_police',
        title = 'Politiet',
        description = 'Personen ringede til politiet',
        position = Config.NotifyStyle.position,
        style = Config.NotifyStyle,
        icon = 'phone' ,
        iconColor = '#e82e20'
    })
end

function notifyDrugsMissing()
    lib.notify({
        id = 'drugs_mangler',
        title = 'Salg',
        description = 'Du har ikke flere drugs',
        position = Config.NotifyStyle.position,
        style = Config.NotifyStyle,
        icon = 'circle-xmark',
        iconColor = '#e82e20'
    })
end

function notifyClientAlready()
    lib.notify({
        id = 'client_already',
        title = 'Klient',
        description = 'Du har allerede handlet med denne klient',
        position = Config.NotifyStyle.position,
        style = Config.NotifyStyle,
        icon = 'circle-xmark',
        iconColor = '#e82e20'
    })
end

function notifyForbiddenPed()
    lib.notify({
        id = 'client_already',
        title = 'PED',
        description = 'Det er ikke tilladt at sælge til denne PED',
        position = Config.NotifyStyle.position,
        style = Config.NotifyStyle,
        icon = 'circle-xmark',
        iconColor = '#e82e20'
    })
end

function notifyToLongDistance()
    lib.notify({
        id = 'client_already',
        title = 'Afstand',
        description = 'Det er ikke tilladt at sælge til denne PED',
        position = Config.NotifyStyle.position,
        style = Config.NotifyStyle,
        icon = 'arrows-left-right',
        iconColor = '#e82e20'
    })
end

RegisterNetEvent('th-selldrugs:allDrugsSold', function()
    lib.notify({
        id = 'sold_all_drugs',
        title = 'Drugs',
        description = 'Du har solgt alle dine drugs',
        position = Config.NotifyStyle.position,
        style = Config.NotifyStyle,
        icon = 'circle-xmark',
        iconColor = '#e82e20'
    })
end)