-- Eliminación de registros

INSERT INTO producto (
    id_usuario,
    id_producto_tipo,
    nombre_producto,
    descripcion,
    precio,
    estado_producto
) VALUES
(1, 1, 'Libro Temporal', 'Producto creado por error', 20000, 'Nuevo');

DELETE FROM producto
WHERE nombre_producto = 'Libro Temporal';

INSERT INTO evento (
    id_usuario,
    id_evento_tipo,
    nombre_evento,
    descripcion,
    fecha_evento,
    lugar
) VALUES
(2, 1, 'Evento Cancelado', 'Evento creado por error', '2026-07-01 10:00:00', 'Sala B');

DELETE FROM evento
WHERE nombre_evento = 'Evento Cancelado';

INSERT INTO servicio (
    id_usuario,
    id_servicio_tipo,
    nombre_servicio,
    descripcion,
    precio
) VALUES
(3, 1, 'Servicio Temporal', 'Servicio creado por error', 30000);

DELETE FROM servicio
WHERE nombre_servicio = 'Servicio Temporal';
 

