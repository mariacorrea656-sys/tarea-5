-- Consulta 1: usuarios del sistema
SELECT
    id_usuario,
    nombre,
    apellido,
    correo,
    fecha_nacimiento,
    fecha_registro
FROM usuario;

-- Consulta 2: eventos con usuario creador
SELECT
    e.id_evento,
    e.nombre_evento,
    e.descripcion,
    e.fecha_evento,
    e.lugar,
    u.nombre,
    u.apellido
FROM evento e
INNER JOIN usuario u ON e.id_usuario = u.id_usuario
ORDER BY e.fecha_evento DESC;

-- Consulta 3: eventos con tipo y participantes
SELECT
    e.id_evento,
    e.nombre_evento,
    et.nombre_evento AS tipo_evento,
    u.id_usuario AS creador_id,
    u.nombre AS creador_nombre,
    up.id_usuario AS participante_id,
    up.nombre AS participante_nombre
FROM evento e
INNER JOIN evento_tipo et ON e.id_evento_tipo = et.id_evento_tipo
INNER JOIN usuario u ON e.id_usuario = u.id_usuario
INNER JOIN evento_usuarios eu ON e.id_evento = eu.id_evento
INNER JOIN usuario up ON eu.id_usuario = up.id_usuario;

-- Consulta 4: productos vendidos del último mes
SELECT
    pu.fecha_compra,
    pu.numero_transaccion,
    p.nombre_producto,
    p.precio,
    u.nombre AS vendedor
FROM producto_usuarios pu
INNER JOIN producto p ON pu.id_producto = p.id_producto
INNER JOIN usuario u ON p.id_usuario = u.id_usuario
WHERE pu.fecha_compra >= CURRENT_DATE - INTERVAL '30 days';

-- Consulta 5: servicios consumidos últimos 3 meses
SELECT
    su.fecha_consumo,
    s.id_servicio,
    s.nombre_servicio,
    s.precio,
    uv.id_usuario AS vendedor_id,
    uv.nombre AS vendedor,
    uc.id_usuario AS consumidor_id,
    uc.nombre AS consumidor
FROM servicio_usuarios su
INNER JOIN servicio s ON su.id_servicio = s.id_servicio
INNER JOIN usuario uv ON s.id_usuario = uv.id_usuario
INNER JOIN usuario uc ON su.id_usuario = uc.id_usuario
INNER JOIN servicio_tipo st ON s.id_servicio_tipo = st.id_servicio_tipo
WHERE su.fecha_consumo >= CURRENT_DATE - INTERVAL '3 months'
ORDER BY su.fecha_consumo DESC, uv.nombre ASC;

-- Consulta 6: insight publicaciones y grupos
SELECT
    u.nombre,
    g.nombre_grupo,
    pub.contenido,
    c.contenido AS comentario
FROM usuario u
INNER JOIN publicacion pub ON u.id_usuario = pub.id_usuario
INNER JOIN comentario c ON pub.id_publicacion = c.id_publicacion
INNER JOIN grupo_usuarios gu ON u.id_usuario = gu.id_usuario
INNER JOIN grupo g ON gu.id_grupo = g.id_grupo;



