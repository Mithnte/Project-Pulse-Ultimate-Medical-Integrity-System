CREATE TABLE IF NOT EXISTS `patient_profiles` (
    `citizenid` VARCHAR(50) PRIMARY KEY,
    `blood_type` VARCHAR(5) DEFAULT 'O+',
    `allergies` TEXT DEFAULT 'Tidak Ada'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `medical_records` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `citizenid` VARCHAR(50),
    `patient_name` VARCHAR(100),
    `doctor_name` VARCHAR(100),
    `diagnosis` TEXT,
    `treatment` TEXT,
    `time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
