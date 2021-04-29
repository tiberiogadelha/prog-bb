DECLARE
    TYPE employee_rec_type IS RECORD (
    	last_name OEHR_EMPLOYEES.LAST_NAME%TYPE,
   	 email OEHR_EMPLOYEES.EMAIL%TYPE,
    	department OEHR_DEPARTMENTS.DEPARTMENT_NAME%TYPE,
    hire_date OEHR_EMPLOYEES.HIRE_DATE%TYPE);
    employee employee_rec_type;
    c_days_in_a_year CONSTANT INTEGER  := 365;
    v_days_worked INTEGER;
    v_is_apt VARCHAR2(20); 

BEGIN
    SELECT E.last_name, E.email || '@store.com',  (SELECT D.DEPARTMENT_NAME FROM OEHR_DEPARTMENTS D WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID), E.hire_date
    INTO employee
    FROM OEHR_EMPLOYEES E
    WHERE E.HIRE_DATE = (SELECT MIN(hire_date) FROM OEHR_EMPLOYEES);

    dbms_output.put_line('Last_name: ' || employee.last_name);
    dbms_output.put_line('Email: ' || employee.email);
    dbms_output.put_line('Department_name: ' || employee.department);
    dbms_output.put_line('Hire_date: ' || to_char(employee.hire_date, 'dd/mon/yyyy'));

    v_days_worked := SYSDATE - employee.hire_date;
    dbms_output.put_line('Days_worked: ' || v_days_worked);

    -- Se a quantidade de dias trabalhados for maior ou igual a 365 * 25 anos
    -- Ele estará apto a se aposentar
    IF  v_days_worked >= c_days_in_a_year * 25 THEN
        v_is_apt := 'Apto';
    ELSE
        v_is_apt := 'Inapto';
    END IF;
   
    dbms_output.put_line('Aposentadoria: ' || v_is_apt);

END;