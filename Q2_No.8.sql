CREATE TABLE geographical_location (
    Location_ID INT(11) PRIMARY KEY,
    Village VARCHAR(100),
    Parish VARCHAR(100),
    Sub_County VARCHAR(100),
    County VARCHAR(100),
    Region VARCHAR(100),
    Population INT(11),
    Coordinates VARCHAR(100),
    Malaria_Risk_Level VARCHAR(50),
    Health_Facilities_Count INT(11),
    ITN_Coverage DECIMAL(5,2),
    Reported_Cases INT(11)
);

CREATE TABLE supply_chain (
    Supply_ID INT(11) PRIMARY KEY,
    Resource_ID INT(11),
    Facility_ID INT(11),
    Quantity_Shipped INT(11),
    Shipment_Date DATE,
    Expected_Arrival_Date DATE,
    Shipped_By VARCHAR(50),
    Status VARCHAR(50),
    Update_Date DATE,
    FOREIGN KEY (Resource_ID) REFERENCES resource(Resource_ID),
    FOREIGN KEY (Facility_ID) REFERENCES health_facility(Facility_ID)
);

CREATE TABLE epidemiological_data (
    Data_ID INT(11) PRIMARY KEY,
    Location_ID INT(11),
    Recorded_Date DATE,
    Cases_Per_Thousand_People INT(11),
    Rainfall INT(11),
    Average_Temperature DECIMAL(5,2),
    Added_By INT(11),
    Update_Date DATE,
    FOREIGN KEY (Location_ID) REFERENCES geographical_location(Location_ID),
    FOREIGN KEY (Added_By) REFERENCES user(User_ID)
);

CREATE TABLE training (
    Training_ID INT(11) PRIMARY KEY,
    User_ID INT(11),
    Training_Type VARCHAR(100),
    Training_Date DATE,
    Completion_Status VARCHAR(50),
    Update_Date DATE,
    FOREIGN KEY (User_ID) REFERENCES user(User_ID)
);

CREATE TABLE laboratory_tests (
    Test_ID INT(11) PRIMARY KEY,
    Patient_ID INT(11),
    Test_Type VARCHAR(100),
    Test_Result VARCHAR(50),
    Test_Date DATE,
    Technician_ID INT(11),
    FOREIGN KEY (Patient_ID) REFERENCES patient_data(Patient_ID),
    FOREIGN KEY (Technician_ID) REFERENCES user(User_ID)
);

CREATE TABLE health_facility (
    Facility_ID INT(11) PRIMARY KEY,
    Facility_Name VARCHAR(100),
    Location_ID INT(11),
    Facility_Type INT(11),
    Contact_Details VARCHAR(100),
    Added_By INT(11),
    Update_Date DATE,
    FOREIGN KEY (Location_ID) REFERENCES geographical_location(Location_ID),
    FOREIGN KEY (Facility_Type) REFERENCES facility_type(Facility_Type_ID),
    FOREIGN KEY (Added_By) REFERENCES user(User_ID)
);

CREATE TABLE malaria_cases_by_region (
    Region_ID INT(11) PRIMARY KEY,
    Region_Name VARCHAR(100),
    Cases INT(11),
    Update_Date DATE
);

CREATE TABLE resource (
    Resource_ID INT(11) PRIMARY KEY,
    Facility_ID INT(11),
    Resource_Type VARCHAR(100),
    Quantity INT(11),
    Update_Date DATE,
    FOREIGN KEY (Facility_ID) REFERENCES health_facility(Facility_ID)
);

CREATE TABLE treatment (
    Treatment_ID INT(11) PRIMARY KEY,
    Treatment_Name VARCHAR(50),
    Description TEXT,
    Dosage VARCHAR(50),
    Update_Date DATE
);

CREATE TABLE visit_record (
    Visit_ID INT(11) PRIMARY KEY,
    Patient_ID INT(11),
    Visit_Date DATE,
    Facility_ID INT(11),
    Update_Date DATE,
    FOREIGN KEY (Patient_ID) REFERENCES patient_data(Patient_ID),
    FOREIGN KEY (Facility_ID) REFERENCES health_facility(Facility_ID)
);

CREATE TABLE malaria_type (
    Type_ID INT(11) PRIMARY KEY,
    Type_Name VARCHAR(100),
    Description TEXT,
    Added_By INT(11),
    Update_Date DATE,
    FOREIGN KEY (Added_By) REFERENCES user(User_ID)
);

CREATE TABLE user (
    User_ID INT(11) PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Preferred_Name VARCHAR(50),
    Role_ID INT(11),
    Username VARCHAR(50),
    Password VARCHAR(100),
    Update_Date DATE,
    FOREIGN KEY (Role_ID) REFERENCES user_role(Role_ID)
);

CREATE TABLE referral (
    Referral_ID INT(11) PRIMARY KEY,
    Patient_ID INT(11),
    Facility_ID INT(11),
    Referral_Date DATE,
    Update_Date DATE,
    FOREIGN KEY (Patient_ID) REFERENCES patient_data(Patient_ID),
    FOREIGN KEY (Facility_ID) REFERENCES health_facility(Facility_ID)
);

CREATE TABLE user_role (
    Role_ID INT(11) PRIMARY KEY,
    Role_Name VARCHAR(50)
);

CREATE TABLE malaria_cases (
    Case_ID INT(11) PRIMARY KEY,
    Patient_ID INT(11),
    Case_Date DATE,
    Malaria_Type_ID INT(11),
    Treatment_ID INT(11),
    Facility_ID INT(11),
    Reported_By INT(11),
    Update_Date DATE,
    FOREIGN KEY (Patient_ID) REFERENCES patient_data(Patient_ID),
    FOREIGN KEY (Malaria_Type_ID) REFERENCES malaria_type(Type_ID),
    FOREIGN KEY (Treatment_ID) REFERENCES treatment(Treatment_ID),
    FOREIGN KEY (Facility_ID) REFERENCES health_facility(Facility_ID),
    FOREIGN KEY (Reported_By) REFERENCES user(User_ID)
);

CREATE TABLE interventions (
    Intervention_ID INT(11) PRIMARY KEY,
    Name VARCHAR(100),
    Description TEXT,
    Update_Date DATE
);

CREATE TABLE system_log (
    Log_ID INT(11) PRIMARY KEY,
    User_ID INT(11),
    Action VARCHAR(100),
    Action_Date DATE,
    FOREIGN KEY (User_ID) REFERENCES user(User_ID)
);

CREATE TABLE patient_data (
    Patient_ID INT(11) PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    DOB DATE,
    Gender VARCHAR(10),
    Address VARCHAR(100),
    Phone_Number VARCHAR(20),
    Email VARCHAR(50),
    Update_Date DATE,
    Location_ID INT(11),
    FOREIGN KEY (Location_ID) REFERENCES geographical_location(Location_ID)
);

CREATE TABLE patient_visit (
    Visit_ID INT(11) PRIMARY KEY,
    Patient_ID INT(11),
    Facility_ID INT(11),
    Visit_Date DATE,
    Visit_Notes TEXT,
    Update_Date DATE,
    FOREIGN KEY (Patient_ID) REFERENCES patient_data(Patient_ID),
    FOREIGN KEY (Facility_ID) REFERENCES health_facility(Facility_ID)
);
