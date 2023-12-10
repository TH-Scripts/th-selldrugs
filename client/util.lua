

function freezePed(ped)
    SetEntityAsMissionEntity(ped)
    ClearPedTasks(ped)
    FreezeEntityPosition(ped, true)
    TaskStandStill(ped, 9)
end

function unFreezePed(oldped)
    SetEntityAsMissionEntity(oldped)
    SetPedAsNoLongerNeeded(oldped)
    FreezeEntityPosition(oldped, false)
end

function freezePlayer(player)
    FreezeEntityPosition(player, true)
end

function unFreezePlayer(player)
    FreezeEntityPosition(player, false)
end

function createObjectBag()
    paperBag = CreateObject(GetHashKey('prop_paper_bag_small'), 0.0, 0.0, 0.0, true, true, false)
end

function paperAnim(player)
    local dict = "mp_common"
    local upAnim = "givetake1_b"
    createObjectBag()
    local boneIndex = GetPedBoneIndex(player, 0x68FB)
    local rotation = GetEntityRotation(paperBag, 2)
    LoadAnim(dict)
    AttachEntityToEntity(paperBag, player, boneIndex, 0.16, 0.03, 0.0, 0.0, 0.0, 0.0, false, true, false, false, rotation, false)
    TaskPlayAnim(player, dict, upAnim, 8.0, 8.0, 2400, 1, 1, 0, 0, 0)
    Wait(1600)
    deleteObject()
    unFreezePlayer(player)
end

function moneyAnim(ped)
    local dict = "mp_common"
    local upAnim = "givetake1_b"
    LoadAnim(dict)
    TaskPlayAnim(ped, dict, upAnim, 8.0, 8.0, 2400, 1, 1, 0, 0, 0)
    Wait(1600)
    unFreezePed(oldped)
end

function deleteObject()
    DetachEntity(paperBag, true, true)
    DeleteObject(paperBag)
end

function LoadAnim(dict)
	while not HasAnimDictLoaded(dict) do
		RequestAnimDict(dict)
		Citizen.Wait(1)
	end
end