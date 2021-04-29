DECLARE
    v_salario OEHR_EMPLOYEES.SALARY%Type;
BEGIN 
    SELECT SALARY
    INTO v_salario
    FROM OEHR_EMPLOYEES
    WHERE EMPLOYEE_ID = 101;

    dbms_output.put_line('Salário: ' || v_salario);
    dbms_output.put_line('Row Count: ' || SQL%ROWCOUNT);
    IF (SQL%ISOPEN) THEN
        dbms_output.put_line('aberto');
    ELSE 
        dbms_output.put_line('fechado');
    END IF;

    IF (SQL%FOUND) THEN
        dbms_output.put_line('encontrou');
    ELSE 
        dbms_output.put_line('não encontrou');
    END IF;
END;
