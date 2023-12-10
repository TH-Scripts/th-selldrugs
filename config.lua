Config = {}
Config.Locale = 'da'

-- Drug item & priser
Config.Drugs = {
    ecstasy = 'burger',
    ecstasyPrice = 200,
    joints = 'water',
    jointsPrice = 150,
    heroin = 'cola',
    heroinPrice = 250
}

--Politi handlinger
Config.Calllist = 'custom' -- 'visualz' (Visualz callliste) 'omikkel' (Omikkels callliste) 'custom' (Indsæt eget dispatch)

Config.PedReject = 5 -- 1=100%, 2=50%, 3=33%, 4=25%, 5=20%
Config.Cops = 2 --1=100%, 2=50%, 3=33%, 4=25%, 5=20%
Config.PoliceJob = 'police'

-- Basale ting
Config.MaxDistance = 2
Config.DrugmenuCommand = 'drugmenu'
Config.defaultKeybind = 'F7'
Config.Title = 'TH - Development'
Config.BlackMoneyItem = 'black_money'

-- Progress bar
Config.Progress = {
    tid = 2000, -- millisekunder
    tekst = 'Forhandler...',
    canCancel = true,
    useWhileDead = false
}

Config.forbiddenPeds = {
        -- Human peds
        `mp_m_freemode_01`,
        `mp_f_freemode_01`,
        `csb_cop`,
        `ig_trafficwarden`,
        `s_f_y_cop_01`,
        `s_m_m_snowcop_01`,
        `s_m_y_cop_01`,
        `s_m_y_hwaycop_01`,
        `mp_m_shopkeep_01`,
        `mp_m_fibsec_01`,
        `mp_s_m_armoured_01`,
        `mp_m_securoguard_01`,
        `s_m_y_swat_01`,
        `s_m_y_sheriff_01`,
        `s_m_m_paramedic_01`,
        `s_m_m_paramedic_01`,
    
        -- Animal peds
        `a_c_boar`,
        `a_c_cat_01`,
        `a_c_chickenhawk`,
        `a_c_chimp`,
        `a_c_chop`,
        `a_c_cormorant`,
        `a_c_cow`,
        `a_c_coyote`,
        `a_c_crow`,
        `a_c_deer`,
        `a_c_dolphin`,
        `a_c_fish`,
        `a_c_hen`,
        `a_c_humpback`,
        `a_c_husky`,
        `a_c_killerwhale`,
        `a_c_mtlion`,
        `a_c_pig`,
        `a_c_pigeon`,
        `a_c_poodle`,
        `a_c_pug`,
        `a_c_rabbit_01`,
        `a_c_rat`,
        `a_c_retriever`,
        `a_c_rhesus`,
        `a_c_rottweiler`,
        `a_c_seagull`,
        `a_c_sharkhammer`,
        `a_c_sharktiger`,
        `a_c_shepherd`,
        `a_c_stingray`,
        `a_c_westy`,
}