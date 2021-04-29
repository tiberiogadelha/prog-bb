DECLARE
    v_department_id INTEGER;
    v_department_name VARCHAR2(500);
BEGIN
    v_department_id := 10;
    WHILE v_department_id <= 270 LOOP
        SELECT d.department_name
        INTO v_department_name
        FROM oehr_departments d
        WHERE d.department_id = v_department_id;
        dbms_output.put_line(v_department_name);
        v_department_id := v_department_id + 10;
    END LOOP;
END;