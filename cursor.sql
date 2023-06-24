set serveroutput on;
set verify off;
DECLARE 
   p_name Appointmentone.patient_name%type; 
   p_age APPOINTMENTone.patient_age%type; 
   p_contact Appointmentone.patient_contact%type; 
   CURSOR patients is 
      SELECT patient_name, patient_age, patient_contact FROM Appointmentone; 
BEGIN 
   OPEN patients; 
   LOOP 
   FETCH patients into p_name, p_age, p_contact; 
      EXIT WHEN patients%notfound; 
      IF p_age>20 then
	  dbms_output.put_line(p_name || ' ' || p_age || ' ' || p_contact);
      end if;	  
   END LOOP; 
   CLOSE patients; 
END; 
/

DECLARE 
   p_name Appointmentone.patient_name%type; 
   p_age APPOINTMENTone.patient_age%type; 
   p_contact Appointmentone.patient_contact%type; 
   CURSOR patientstwo is 
      SELECT patient_name, patient_age, patient_contact FROM Appointmentone; 
BEGIN 
   OPEN patientstwo; 
   LOOP 
   FETCH patientstwo into p_name, p_age, p_contact; 
      EXIT WHEN patientstwo%notfound; 
      IF p_age<=22 then
	  dbms_output.put_line(p_name || ' ' || p_age || ' ' || p_contact);
      end if;	  
   END LOOP; 
   CLOSE patientstwo; 
END; 
/