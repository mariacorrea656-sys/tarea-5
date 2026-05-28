-- Creación de vista de eventos

CREATE VIEW vista_eventos_detalle AS
SELECT
    et.nombre_evento AS tipo_evento,
    e.fecha_evento,
    e.id_evento,
    e.nombre_evento,
    e.descripcion,
    u.id_usuario AS creador_id,
    u.nombre AS creador_nombre,
    up.id_usuario AS participante_id,
    up.nombre AS participante_nombre
FROM evento e
INNER JOIN evento_tipo et ON e.id_evento_tipo = et.id_evento_tipo
INNER JOIN usuario u ON e.id_usuario = u.id_usuario
INNER JOIN evento_usuarios eu ON e.id_evento = eu.id_evento
INNER JOIN usuario up ON eu.id_usuario = up.id_usuario
ORDER BY et.nombre_evento ASC, e.fecha_evento DESC;

-- Uso de la vista
SELECT
    tipo_evento,
    fecha_evento,
    id_evento,
    nombre_evento,
    descripcion,
    creador_id,
    creador_nombre,
    participante_id,
    participante_nombre
FROM vista_eventos_detalle
WHERE fecha_evento >= CURRENT_DATE - INTERVAL '3 months';




