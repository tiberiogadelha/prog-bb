DECLARE
    v_codigo INTEGER;
    v_sexo CHAR(1);
    v_nascimento DATE;
    v_nome VARCHAR2(10);
BEGIN
    FOR i IN 1..500 LOOP
        IF MOD(i,2) = 0 THEN
            v_nome := 'Mr. ' || i;
            v_sexo := 'M';
        ELSE
            v_nome := 'Mrs. ' || i;
            v_sexo := 'F';
        END IF;
        v_nascimento := SYSDATE - i;
        v_codigo := i;
        INSERT INTO SINTETICA
        (codigo, nome, nascimento, sexo) 
        VALUES
        (v_codigo, v_nome, v_nascimento, v_sexo);
    END LOOP;   
END;

--Código 2:
SELECT COUNT(DISTINCT(nome)) as Quantidade_Nomes_Diferentes 
FROM sintetica;