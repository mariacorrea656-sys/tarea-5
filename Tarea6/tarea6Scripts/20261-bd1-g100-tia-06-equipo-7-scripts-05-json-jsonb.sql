--
-- Scripts de comparación de rendimiento de datos semi estructurados: JSON y JSONB
-- de la Base de Datos  - SGBD PostgreSQL
-- 
--

-- 1. Prueba de escritura JSON (500 operaciones)

DO $$
DECLARE
    i INTEGER;
BEGIN
    FOR i IN 1..500 LOOP
       UPDATE perfil
      SET informacion_json =
        '{
          "redes_sociales": ["LinkedIn", "GitHub"],
          "experiencia": "3 años",
          "idiomas": ["Español", "Inglés"],
          "disponible": true
        }'
        WHERE id_perfil = 1;
    END LOOP;
END $$;

EXPLAIN ANALYZE
SELECT informacion_json
FROM perfil;


-- 2. Prueba de escritura JSONB (500 operaciones)

DO $$
DECLARE
    i INTEGER;
BEGIN
    FOR i IN 1..500 LOOP
        UPDATE perfil
        SET informacion_extra_jsonb =
        '{
          "redes_sociales": ["LinkedIn", "GitHub"],
          "experiencia": "3 años",
          "idiomas": ["Español", "Inglés"],
          "disponible": true
        }'
        WHERE id_perfil = 1;
    END LOOP;
END $$;

EXPLAIN ANALYZE
SELECT informacion_extra_jsonb
FROM perfil;

--
-- 1.- Utilice la instrucción EXPLAIN ANALYZE para medir el rendimiento
-- Realice una operación de inserción y una de lectura de 500 registros en el campo tipo JSON. 
-- Registre el tiempo de preparación y ejecución de cada operación (escritura y lectura)
--
-- Escritura JSON (500 operaciones)

DO $$
DECLARE
    i INTEGER;
BEGIN
    FOR i IN 1..500 LOOP
        UPDATE perfil
        SET informacion_json =
        '{
          "redes_sociales":["LinkedIn","GitHub"],
          "experiencia":"3 años",
          "idiomas":["Español","Inglés"],
          "disponible":true
        }'
        WHERE id_perfil = 1;
    END LOOP;
END $$;

-- Lectura JSON

EXPLAIN ANALYZE
SELECT informacion_json
FROM perfil;



--
-- 2.- Utilice la instrucción EXPLAIN ANALYZE para medir el rendimiento
-- Realice una operación de inserción y una de lectura de 500 registros en el campo tipo JSONB. 
-- Registre el tiempo de preparación y lectura de cada operación (escritura y lectura)
--
-- Escritura JSONB (500 operaciones)

DO $$
DECLARE
    i INTEGER;
BEGIN
    FOR i IN 1..500 LOOP
        UPDATE perfil
        SET informacion_extra_jsonb =
        '{
          "redes_sociales":["LinkedIn","GitHub"],
          "experiencia":"3 años",
          "idiomas":["Español","Inglés"],
          "disponible":true
        }'
        WHERE id_perfil = 1;
    END LOOP;
END $$;

-- Lectura JSONB

EXPLAIN ANALYZE
SELECT informacion_extra_jsonb
FROM perfil;

--
-- 3.- Recuerde de registrar los valores obtenidos en el cuadro del Informe
-- 
--
-- JSON
-- Execution Time: 0.096 ms

-- JSONB
-- Execution Time: 0.066 ms
