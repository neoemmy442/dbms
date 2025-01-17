SELECT 
    p.PatientID,
    p.FullName,
    a.KnownAllergy,
    ec.ContactName,
    ec.ContactPhone
FROM 
    Patients p
JOIN 
    Allergies a ON p.PatientID = a.PatientID
JOIN 
    EmergencyContacts ec ON p.PatientID = ec.PatientID;
