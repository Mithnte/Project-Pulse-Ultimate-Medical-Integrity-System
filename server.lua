local QBCore = exports['qb-core']:GetCoreObject()
local MySQL = exports.oxmysql

-- 1. SAVE MEDICAL RECORD TO SQL
RegisterNetEvent('imer_med:server:saveRecord', function(targetId, diag, treat)
    local Doctor = QBCore.Functions.GetPlayer(source)
    local Patient = QBCore.Functions.GetPlayer(targetId)
    
    MySQL.insert('INSERT INTO medical_records (citizenid, patient_name, doctor_name, diagnosis, treatment) VALUES (?, ?, ?, ?, ?)', {
        Patient.PlayerData.citizenid, 
        Patient.PlayerData.charinfo.firstname .. " " .. Patient.PlayerData.charinfo.lastname,
        Doctor.PlayerData.charinfo.firstname .. " " .. Doctor.PlayerData.charinfo.lastname,
        diag, treat
    })
    
    -- Print Surat Izin Sakit Otomatis (Item Physical)
    local info = { title = "SURAT SAKIT", doctor = Doctor.PlayerData.charinfo.firstname, patient = Patient.PlayerData.charinfo.firstname, date = os.date("%d/%m/%Y") }
    Doctor.Functions.AddItem("medical_paper", 1, false, info)
    TriggerClientEvent('hospital:client:Revive', targetId) -- Revive Pasien
end)

-- 2. FETCH HISTORY & PROFILES
QBCore.Functions.CreateCallback('imer_med:server:getMedicalData', function(source, cb, targetId)
    local Patient = QBCore.Functions.GetPlayer(targetId)
    MySQL.query('SELECT * FROM patient_profiles WHERE citizenid = ?', {Patient.PlayerData.citizenid}, function(profile)
        MySQL.query('SELECT * FROM medical_records WHERE citizenid = ? ORDER BY time DESC LIMIT 5', {Patient.PlayerData.citizenid}, function(history)
            cb({profile = profile[1], history = history})
        end)
    end)
end)
