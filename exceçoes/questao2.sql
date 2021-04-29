DECLARE 
    v_avg_sal VARCHAR(300); --Resultado: 6461,68
    v_max_sal NUMBER; --Resultado: 24000
    c_threshold CONSTANT NUMBER := 5000;
    salary_error EXCEPTION;
BEGIN

    SELECT MAX(e.salary), AVG(e.salary) 
    INTO v_max_sal, v_avg_sal
    FROM OEHR_EMPLOYEES e;
    
    IF ((v_max_sal - v_avg_sal) < c_threshold) THEN
        dbms_output.put_line('Dentro da lei');
    ELSE
        RAISE salary_error;
    END IF;

EXCEPTION
    WHEN salary_error THEN 
        dbms_output.put_line('Fora da lei');
END;