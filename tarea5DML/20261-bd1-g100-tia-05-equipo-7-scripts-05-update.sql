-- Actualización de datos

UPDATE usuario
SET direccion = 'Palmira'
WHERE id_usuario = 1;

UPDATE usuario
SET direccion = 'Jamundí'
WHERE id_usuario = 2;

UPDATE evento
SET nombre_evento = 'Taller Avanzado PostgreSQL'
WHERE id_evento = 1;

UPDATE producto
SET precio = 55000
WHERE id_producto = 1;

UPDATE producto
SET precio = 170000
WHERE id_producto = 2;

UPDATE producto
SET precio = 35000
WHERE id_producto = 3;

UPDATE evento
SET fecha_evento = '2026-06-12 15:00:00'
WHERE id_evento = 1;

UPDATE evento
SET fecha_evento = '2026-06-18 10:00:00'
WHERE id_evento = 2;

