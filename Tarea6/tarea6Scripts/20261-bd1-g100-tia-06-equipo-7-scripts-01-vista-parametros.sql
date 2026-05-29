--
-- Script de Consulta con Parámtros a partir de una Vista (VIEW) de la Base de Datos  - SGBD PostgreSQL
--
-- 
--
-- 1.- Crea la vista (VIEW)
--      No debe tener ni WHERE ni GROUP BY ni ORDER BY (no tendría sentido para la reutilización)
--CREATE OR REPLACE VIEW vw_eventos_participacion AS
SELECT
    e.id_evento,
    e.nombre_evento,
    e.fecha_evento,
    u.nombre AS promotor,
    COUNT(eu.id_usuario) AS total_inscritos
FROM evento e
JOIN usuario u
    ON e.id_usuario = u.id_usuario
JOIN evento_usuarios eu
    ON e.id_evento = eu.id_evento
GROUP BY
    e.id_evento,
    e.nombre_evento,
    e.fecha_evento,
    u.nombre;



--
-- 2.- Preparar la consulta (utilizando la vista)
--      Aquí se colocan los parámetros
--      Se aplican los parámetros a un dato en el WHERE y un dato en el HAVING
--PREPARE consulta_eventos(DATE, INTEGER) AS
SELECT
    id_evento,
    nombre_evento,
    fecha_evento,
    promotor,
    total_inscritos
FROM vw_eventos_participacion
WHERE fecha_evento >= $1
  AND total_inscritos >= $2
ORDER BY total_inscritos DESC;

--
-- 3.- Ejecutar 3 consultas con diferentes parámetros (EXECUTE)
EXECUTE consulta_eventos('2025-01-01', 1);

EXECUTE consulta_eventos('2026-06-01', 1);

EXECUTE consulta_eventos('2026-06-01', 2);

--
-- 4.-  Explicar la importancia de esta experiencia 
--
-- La utilización de vistas permite reutilizar consultas complejas
-- simplificando el acceso a la información.
-- El uso de PREPARE y EXECUTE mejora la reutilización de consultas
-- parametrizadas y permite cambiar los valores de búsqueda sin
-- modificar la estructura principal de la consulta.
-- Esta técnica facilita el análisis de información de la Red Social
-- Pascualina y contribuye a mejorar el rendimiento y mantenimiento
-- de las consultas SQL.