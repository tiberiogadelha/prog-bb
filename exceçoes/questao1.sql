DECLARE 
    v_email VARCHAR(300);
    v_id NUMBER;

BEGIN
    v_id := 101;
    SELECT e.email
    INTO v_email
    FROM OEHR_EMPLOYEES e
    WHERE e.employee_id = v_id;
    dbms_output.put_line('E-mail: ' || v_email);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Empregado inexistente');
    WHEN VALUE_ERROR THEN
        dbms_output.put_line('Código inválido');
END;