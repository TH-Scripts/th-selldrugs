function notifySalgStart()
    lib.notify({
        id = 'salg_started',
        title = 'Drugs',
        description = 'Du har påbegyndt salg af drugs',
        position = 'right-top',
        style = {
            backgroundColor = '#141517',
            color = '#C1C2C5',
            ['.description'] = {
              color = '#909296'
            }
        },
        icon = 'cannabis',
        iconColor = '#2bc726'
    })
end

function notifySalgStop()
    lib.notify({
        id = 'salg_started',
        title = 'Drugs',
        description = 'Du har stoppet salget af drugs',
        position = 'right-top',
        style = {
            backgroundColor = '#141517',
            color = '#C1C2C5',
            ['.description'] = {
              color = '#909296'
            }
        },
        icon = 'circle-xmark',
        iconColor = '#e82e20'
    })
end

function notifyChooseDrug()
    lib.notify({
        id = 'salg_started',
        title = 'Drugs',
        description = 'Du har ikke valgt et drug endnu',
        position = 'right-top',
        style = {
            backgroundColor = '#141517',
            color = '#C1C2C5',
            ['.description'] = {
              color = '#909296'
            }
        },
        icon = 'exclamation' ,
        iconColor = '#e82e20'
    })
end

function notifyHarIngenDrugs()
    lib.notify({
        id = 'drugs_ingen',
        title = 'Drugs',
        description = 'Du har ingen drugs',
        position = 'right-top',
        style = {
            backgroundColor = '#141517',
            color = '#C1C2C5',
            ['.description'] = {
              color = '#909296'
            }
        },
        icon = 'exclamation' ,
        iconColor = '#e82e20'
    })
end