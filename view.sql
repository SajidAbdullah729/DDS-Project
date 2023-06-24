set serveroutput on;
set verify off;

Drop view DOCTOR_WITH_TOTAL_APPOINTMENT;
create view DOCTOR_WITH_TOTAL_APPOINTMENT AS
SELECT doctor_id  , count(*) as "total appointments " from appointmentone group by doctor_id; 

SELECT * FROM DOCTOR_WITH_TOTAL_APPOINTMENT;

CREATE VIEW PATIENT_WITH_TOTAL_APPOINTMENT AS
select patient_name,count(*) as "Total Doctor" from appointmentone group by patient_name ;

SELECT * FROM PATIENT_WITH_TOTAL_APPOINTMENT;
commit;