set serveroutput on;
set verify off;

DROP PROCEDURE PATIENT_DETAILS;
CREATE OR REPLACE PROCEDURE Patient_Details
AS 
   
BEGIN 


   DBMS_OUTPUT.PUT_LINE( 'Patient_name' || ' ' || 'Patient Age ' || ' ' || '        Contact'  );
   
   for R in (Select * from appointmentone )  LOOP
     DBMS_OUTPUT.PUT_LINE( R.patient_name || '         ' || R.patient_age || '                ' || R.patient_contact || '           ' ); 
   END LOOP;
   
END; 
/ 

declare 
BEGIN
  
  Patient_Details;
end;
/ 
commit;


DROP PROCEDURE FULL_TABLE_Appointment;

CREATE OR REPLACE PROCEDURE FULL_TABLE_Appointment
AS 
   
BEGIN 


   DBMS_OUTPUT.PUT_LINE( 'Appointment id             '||'Patient_name            ' || ' ' || 'Patient Age ' || '      ' || '        Contact ' || ' Doctor fee    ' ||  '        Appointment date ');
   
   for R in (Select * from appointmentone full join appointmenttwo@mahi_link on appointmentone.appointment_id=appointmenttwo@mahi_link.appointment_id)  LOOP
     DBMS_OUTPUT.PUT_LINE(R.appointment_id ||'      '|| R.patient_name || '         ' || R.patient_age || '                ' || R.patient_contact || '           ' || R.fee || '     ' || R.appointment_date ); 
   END LOOP;
   
END; 
/

DECLARE

BEGIN
   FULL_TABLE_Appointment;
END;

DROP PROCEDURE FULL_TABLE_Doctorlist;
CREATE OR REPLACE PROCEDURE FULL_TABLE_Doctorlist
AS 
   
BEGIN 


   DBMS_OUTPUT.PUT_LINE( 'Doctor NAME' || ' ' || 'Doctor speciality ' || '          Doctor Degree');
   
   for R in (select * from doctorlistone union select * from doctorlisttwo@mahi_link)  LOOP
     DBMS_OUTPUT.PUT_LINE(R.doctor_name ||'      '|| R.speciality || '         ' || R.degree ); 
   END LOOP;
   
END; 
/

DECLARE

BEGIN
   FULL_TABLE_Doctorlist;
END;
/


DROP PROCEDURE Two_in_site;
CREATE OR REPLACE PROCEDURE Two_in_site
AS 
   
BEGIN 


   DBMS_OUTPUT.PUT_LINE( 'Doctor NAME' || ' ' || 'Doctor speciality ' ||   '       Patient NAME' || '     Patient Age' || '   Doctor Degree' );
   
   for R in (select * from doctorlistone join appointmentone on doctorlistone.doctor_id=appointmentone.doctor_id)  LOOP
     DBMS_OUTPUT.PUT_LINE(R.doctor_name ||'      '|| R.speciality ||  '                ' || R.patient_name ||  '              ' || R.patient_age || '            '|| R.degree ); 
   END LOOP;
   
END; 
/

DECLARE

BEGIN
   Two_in_site;
END;
/
