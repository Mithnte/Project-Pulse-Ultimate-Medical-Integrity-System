local isBleeding, isKnockedOut, isOperating, isMonitoring = false, false, false, false
local injuries = { legs = false, arms = false, head = false }
local anesthesiaLevel, heartRate = 0, 80
local surgeryCam = nil

-- 1. SISTEM TRAUMA & KO (Optimized 0.01ms)
CreateThread(function()
    while true do
        local sleep = 1000
        local ped = PlayerPedId()
        if HasEntityBeenDamagedByAnyPed(ped) then
            sleep = 0
            local _, bone = GetPedLastDamageBone(ped)
            if (bone == 11816 or bone == 58271) then 
                injuries.legs = true 
                RequestAnimSet("move_m@injured")
                SetPedMovementClipset(ped, "move_m@injured", 1.0)
            elseif bone == 31086 then TriggerKnockout(20) end
            if GetEntityHealth(ped) < 150 then isBleeding = true end
            ClearEntityLastDamageEntity(ped)
        end
        Wait(sleep)
    end
end)

-- 2. KNOCKOUT & AUDIO FX (TINNITUS)
function TriggerKnockout(seconds)
    if isKnockedOut then return end
    isKnockedOut = true
    PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", true) 
    StartAudioScene("PROLOGUE_MUTE_PARTY") 
    SetTimecycleModifier("fbi_filter")
    AnimpostfxPlay("Dont_Tapa_Me_Line", 0, true)
    
    CreateThread(function()
        local timer = seconds
        while timer > 0 do
            SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
            Wait(1000)
            timer = timer - 1
        end
        isKnockedOut = false
        StopAudioScene("PROLOGUE_MUTE_PARTY")
        AnimpostfxStopAll()
        ClearTimecycleModifier()
    end)
end

-- 3. SURGERY SYSTEM (Cinematic Overhead View)
RegisterNetEvent('imer_med:client:startSurgery')
AddEventHandler('imer_med:client:startSurgery', function(targetId, organ)
    local targetPed = GetPlayerPed(GetPlayerFromServerId(targetId))
    isOperating = true
    
    -- Kamera Overhead (Persis Foto Kamu)
    local coords = GetEntityCoords(targetPed)
    surgeryCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(surgeryCam, coords.x, coords.y, coords.z + 1.6)
    SetCamRot(surgeryCam, -90.0, 0.0, GetEntityHeading(targetPed))
    SetCamActive(surgeryCam, true)
    RenderScriptCams(true, true, 1000, true, true)

    -- Fase Bedah Bertahap
    if lib.progressCircle({duration = 5000, label = 'Incision (Sayatan)...'}) then
        -- Particle Darah
        RequestNamedPtfxAsset("core")
        while not HasNamedPtfxAssetLoaded("core") do Wait(1) end
        UseParticleFxAssetNextCall("core")
        StartParticleFxLoopedAtCoord("ent_brk_blood_raster", GetEntityCoords(targetPed), 0.0, 0.0, 0.0, 1.0, false, false, false, false)

        if lib.progressCircle({duration = 10000, label = 'Mengganti Organ: '..organ}) then
            if lib.progressCircle({duration = 5000, label = 'Suturing (Menjahit)...'}) then
                TriggerServerEvent('imer_med:server:saveRecord', targetId, "Bedah "..organ, "Sukses")
            end
        end
    end

    RenderScriptCams(false, true, 1000, true, true)
    DestroyCam(surgeryCam, false)
    isOperating = false
end)

-- 4. DYNAMIC HEART MONITOR SOUND
CreateThread(function()
    while true do
        local sleep = 1000
        if isOperating or isMonitoring then
            if heartRate > 110 then sleep = 400 elseif heartRate < 50 then sleep = 1500 else sleep = 800 end
            PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", true)
        end
        Wait(sleep)
    end
end)
