create database project;
use project;

CREATE TABLE Hospital_data1 (
  Hospital_Name VARCHAR(200),
  Location VARCHAR(100),
  Department VARCHAR(200),
  Doctors_Count INT,
  Patients_Count INT,
  Admission_Date DATE,
  Discharge_Date DATE,
  Medical_Expenses VARCHAR(255)
);
select*from Hospital_data1;

-- 1.Total Number of Patients
-- o Write an SQL query to find the total number of patients across all hospitals.
SELECT SUM(Patients_Count) AS Total_Patients
FROM Hospital_data1;

-- 2.Average Number of Doctors per Hospital
-- o Retrieve the average count of doctors available in each hospital.
SELECT Hospital_Name, AVG(Doctors_Count) AS Average_Doctors
FROM Hospital_data1
GROUP BY Hospital_Name;

-- 3.Top 3 Departments with the Highest Number of Patients
-- o Find the top 3 hospital departments that have the highest number of patients.
SELECT Department, SUM(Patients_Count) AS Total_Patients
FROM Hospital_data1
GROUP BY Department
ORDER BY Total_Patients DESC
LIMIT 3;

-- 4.Hospital with the Maximum Medical Expenses
-- oIdentify the hospital that recorded the highest medical expenses.
SELECT Hospital_Name, MAX(CAST(Medical_Expenses AS DECIMAL(10, 2))) AS Max_Expenses
FROM Hospital_data1
GROUP BY Hospital_Name
ORDER BY Max_Expenses DESC
LIMIT 1;

-- 5.Daily Average Medical Expenses
-- o Calculate the average medical expenses per day for each hospital.
SELECT 
    Hospital_Name, 
    SUM(CAST(Medical_Expenses AS DECIMAL(10, 2))) / 
    DATEDIFF(MAX(Discharge_Date), MIN(Admission_Date)) AS Daily_Avg_Medical_Expenses
FROM 
    Hospital_data1
GROUP BY 
    Hospital_Name
LIMIT 0, 2000;

-- 6.Longest Hospital Stay
-- o Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.
SELECT 
    Hospital_Name,
    Location,
    Department,
    Doctors_Count,
    Patients_Count,
    Admission_Date,
    Discharge_Date,
    DATEDIFF(Discharge_Date, Admission_Date) AS Stay_Duration
FROM 
    Hospital_data1
ORDER BY 
    Stay_Duration DESC
LIMIT 1;

-- 7.Total Patients Treated Per City
-- o Count the total number of patients treated in each city.
SELECT 
    Location AS City, 
    SUM(Patients_Count) AS Total_Patients_Treated
FROM 
    Hospital_data1
GROUP BY 
    Location;
    
-- 8-- .Average Length of Stay Per Department
-- o Calculate the average number of days patients spend in each department.
SELECT 
    Department, 
    AVG(DATEDIFF(Discharge_Date, Admission_Date)) AS Average_Length_of_Stay
FROM 
    Hospital_data1
GROUP BY 
    Department;
    
-- 9.Identify the Department with the Lowest Number of Patients
-- o Find the department with the least number of patients.
SELECT 
    Department, 
    SUM(Patients_Count) AS Total_Patients
FROM 
    Hospital_data1
GROUP BY 
    Department
ORDER BY 
    Total_Patients ASC
LIMIT 1;

-- 10.Monthly Medical Expenses Report
-- • Group the data by month and calculate the total medical expenses for each month.
SELECT 
    YEAR(Admission_Date) AS Year,
    MONTH(Admission_Date) AS Month,
    SUM(CAST(Medical_Expenses AS DECIMAL(10, 2))) AS Total_Medical_Expenses
FROM 
    Hospital_data1
GROUP BY 
    YEAR(Admission_Date), MONTH(Admission_Date)
ORDER BY 
    Year DESC, Month DESC;






