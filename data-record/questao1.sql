DECLARE
    TYPE employee_rec_type IS RECORD (
    last_name OEHR_EMPLOYEES.LAST_NAME%TYPE,
    email OEHR_EMPLOYEES.EMAIL%TYPE,
    department OEHR_DEPARTMENTS.DEPARTMENT_NAME%TYPE);
    employee employee_rec_type;

BEGIN
    SELECT E.last_name, E.email || '@store.com',  (SELECT D.DEPARTMENT_NAME FROM OEHR_DEPARTMENTS D WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID)
    INTO employee
    FROM OEHR_EMPLOYEES E
    WHERE E.EMPLOYEE_ID = 101;

    dbms_output.put_line('Last_name: ' || employee.last_name);
    dbms_output.put_line('Email: ' || employee.email);
    dbms_output.put_line('Department_name: ' || employee.department);
END;