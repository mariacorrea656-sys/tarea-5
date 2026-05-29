--
-- Scripts de Manipulación de una dato (campo) JSON
-- Tabla: "perfil" de la Base de Datos  - SGBD PostgreSQL
--

-- Agregue un NUEVO  campo tipo JSON a la tabla “perfil” (otro JSON DIFERENTE al original que creo en la tarea anterior)
-- Proponga un contenido y nombre pertinente y coherente en ese campo; y construya una estructura de dato tipo semi-estructurado
-- Realice cada una de las operaciones con el dato campo creado

--
-- Instrucción "ALTER TABLE" para agregar campo JSON en tabla "perfil"
--
ALTER TABLE perfil
ADD COLUMN informacion_extra JSONB;




--
-- 1.- Inserción del dato semi estructurado en nuevo campo JSON
--
UPDATE perfil
SET informacion_extra =
'{
  "redes_sociales": ["LinkedIn", "GitHub"],
  "experiencia": "2 años",
  "idiomas": ["Español", "Inglés"],
  "disponible": true
}'
WHERE id_perfil = 1;




--
-- 2.- Consulta de los datos del campo 
-- 
SELECT
    id_perfil,
    informacion_extra
FROM perfil
WHERE id_perfil = 1;






--
-- 3.- Modificación de uno de los datos dentro la semi estructura
-- 
UPDATE perfil
SET informacion_extra =
jsonb_set(
    informacion_extra,
    '{experiencia}',
    '"3 años"'
)
WHERE id_perfil = 1;

SELECT
    id_perfil,
    informacion_extra
FROM perfil
WHERE id_perfil = 1;



--
-- 4.- Eliminación de uno de los datos dentro la semi estructura
-- 
UPDATE perfil
SET informacion_extra =
informacion_extra - 'disponible'
WHERE id_perfil = 1;

SELECT
    id_perfil,
    informacion_extra
FROM perfil
WHERE id_perfil = 1;





