--
-- Scripts de Manipulación de una dato (campo) JSONB
-- Tabla: "perfil" de la Base de Datos  - SGBD PostgreSQL
--

-- Agregue un NUEVO campo tipo JSONB a la tabla “perfil” (otro JSONB DIFERENTE al original que creo en la tarea anterior).
-- Utilice la misma estructura del campo tipo JSON del ítem anterior. Nota: solo cambie el nombre del campo para diferenciarlo
-- Realice cada una de las operaciones con el dato campo creado

--
-- Instrucción "ALTER TABLE" para agregar campo JSONB en tabla "perfil"
--
ALTER TABLE perfil
ADD COLUMN IF NOT EXISTS informacion_extra_jsonb JSONB;




--
-- 1.- Inserción del dato semi estructurado en nuevo campo 
--
UPDATE perfil
SET informacion_extra_jsonb =
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
    informacion_extra_jsonb
FROM perfil
WHERE id_perfil = 1;






--
-- 3.- Modificación de uno de los datos dentro la semi estructura
-- 
UPDATE perfil
SET informacion_extra_jsonb =
jsonb_set(
    informacion_extra_jsonb,
    '{experiencia}',
    '"3 años"'
)
WHERE id_perfil = 1;



--
-- 4.- Eliminación de uno de los datos dentro la semi estructura
-- 
UPDATE perfil
SET informacion_extra_jsonb =
informacion_extra_jsonb - 'disponible'
WHERE id_perfil = 1;





