DECLARE
    v_ex_max_deptno NUMBER;
    v_new_max_deptno NUMBER;
    deptno NUMBER;
    dname VARCHAR2(300);
    man_id NUMBER;
    loc NUMBER;      
BEGIN
    SELECT MAX(d.DEPARTMENT_ID)
    INTO v_ex_max_deptno
    FROM OEHR_DEPARTMENTS d;
    v_new_max_deptno := v_ex_max_deptno + 10;

    INSERT INTO OEHR_DEPARTMENTS
    (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
    VALUES
    (v_new_max_deptno, 'EDUCATION', man_id, loc);

    SELECT d.DEPARTMENT_ID, d.DEPARTMENT_NAME
    INTO deptno, dname
    FROM OEHR_DEPARTMENTS d
    WHERE d.DEPARTMENT_ID = (SELECT MAX(DEPARTMENT_ID) from OEHR_DEPARTMENTS);

    dbms_output.put_line(deptno || ' ' || dname);
END