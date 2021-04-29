DECLARE
    CURSOR cursor_dep IS
    SELECT D.DEPARTMENT_NAME, (SELECT COUNT(*) FROM OEHR_EMPLOYEES E WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID) as qty
    FROM OEHR_DEPARTMENTS D
    WHERE (SELECT COUNT(*) FROM OEHR_EMPLOYEES E WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID) > 5;
    rec_dep cursor_dep%ROWTYPE;
BEGIN
    OPEN cursor_dep;
    LOOP
        FETCH cursor_dep INTO rec_dep;
        EXIT WHEN cursor_dep%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Nome: ' || rec_dep.DEPARTMENT_NAME || ' | Quantidade empregados: ' || rec_dep.qty || ' | Row Count: ' || cursor_dep%ROWCOUNT);
    END LOOP;
    CLOSE cursor_dep;
END;