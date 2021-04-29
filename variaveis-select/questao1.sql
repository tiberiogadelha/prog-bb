DECLARE 
    v_salario_anual NUMBER;
    v_percent_bonus NUMBER;
    v_salario_final NUMBER(38,2);
BEGIN
    v_salario_anual := 5000;
    v_percent_bonus := 10;
    v_salario_final := v_salario_anual + (v_salario_anual * (v_percent_bonus/100));
    dbms_output.put_line(v_salario_final);
END