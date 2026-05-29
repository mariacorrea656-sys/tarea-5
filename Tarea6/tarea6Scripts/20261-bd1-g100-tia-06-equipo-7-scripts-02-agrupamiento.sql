--
-- Scripts de Consultas con agrupamientos y funciones de agregación de la Base de Datos  - SGBD PostgreSQL
-- 


--
-- Consulta #1: Grupos
-- 
SELECT
    g.id_grupo,
    g.nombre_grupo,
    g.fecha_creacion,
    u.nombre AS usuario_creador,
    COUNT(gu.id_usuario) AS cantidad_miembros
FROM grupo g
JOIN usuario u
    ON g.id_usuario = u.id_usuario
JOIN grupo_usuarios gu
    ON g.id_grupo = gu.id_grupo
GROUP BY
    g.id_grupo,
    g.nombre_grupo,
    g.fecha_creacion,
    u.nombre
HAVING COUNT(gu.id_usuario) >= 1
ORDER BY g.nombre_grupo ASC;

--
-- Consulta #2: Eventos
-- 
SELECT
    et.id_evento_tipo,
    et.nombre_evento AS tipo_evento,
    u.nombre AS usuario_promotor,
    e.descripcion,
    e.fecha_evento,
    COUNT(eu.id_usuario) AS cantidad_inscritos
FROM evento e
JOIN evento_tipo et
    ON e.id_evento_tipo = et.id_evento_tipo
JOIN usuario u
    ON e.id_usuario = u.id_usuario
JOIN evento_usuarios eu
    ON e.id_evento = eu.id_evento
GROUP BY
    et.id_evento_tipo,
    et.nombre_evento,
    u.nombre,
    e.descripcion,
    e.fecha_evento
HAVING COUNT(eu.id_usuario) >= 1
ORDER BY e.fecha_evento DESC;

--
-- Consulta #3: Tipos de Servicio
-- 
SELECT
    st.id_servicio_tipo,
    st.nombre_servicio AS tipo_servicio,
    COUNT(su.id_usuario) AS cantidad_usuarios
FROM servicio_tipo st
JOIN servicio s
    ON st.id_servicio_tipo = s.id_servicio_tipo
JOIN servicio_usuarios su
    ON s.id_servicio = su.id_servicio
WHERE su.fecha_consumo >= CURRENT_DATE - INTERVAL '3 months'
GROUP BY
    st.id_servicio_tipo,
    st.nombre_servicio
HAVING COUNT(su.id_usuario) >= 1
ORDER BY cantidad_usuarios DESC;

--
-- Consulta #4: Productos
-- 
SELECT
    pt.nombre_producto AS tipo_producto,
    p.nombre_producto,
    u.nombre AS vendedor,
    SUM(p.precio) AS monto_total_vendido
FROM producto p
JOIN producto_tipo pt
    ON p.id_producto_tipo = pt.id_producto_tipo
JOIN usuario u
    ON p.id_usuario = u.id_usuario
JOIN producto_usuarios pu
    ON p.id_producto = pu.id_producto
WHERE pu.fecha_compra >= CURRENT_DATE - INTERVAL '1 month'
GROUP BY
    pt.nombre_producto,
    p.nombre_producto,
    u.nombre
HAVING SUM(p.precio) > 0
ORDER BY monto_total_vendido DESC
LIMIT 20;

--
-- Consulta #5: Tipos de Producto
-- 
SELECT
    pt.nombre_producto AS tipo_producto,
    COUNT(DISTINCT p.id_usuario) AS total_vendedores,
    COUNT(DISTINCT pu.id_usuario) AS total_compradores,
    COUNT(pu.numero_transaccion) AS total_ventas,
    AVG(p.precio) AS promedio_venta,
    MAX(p.precio) AS venta_maxima,
    MIN(p.precio) AS venta_minima
FROM producto_tipo pt
JOIN producto p
    ON pt.id_producto_tipo = p.id_producto_tipo
JOIN producto_usuarios pu
    ON p.id_producto = pu.id_producto
GROUP BY
    pt.nombre_producto
HAVING COUNT(pu.numero_transaccion) >= 1
ORDER BY total_ventas DESC;

--
-- Consulta #6: LIBRE DE PLANTEAMIENTO
-- 
SELECT
    u.id_usuario,
    u.nombre,
    COUNT(c.id_comentario) AS total_comentarios
FROM usuario u
JOIN publicacion p
    ON u.id_usuario = p.id_usuario
JOIN comentario c
    ON p.id_publicacion = c.id_publicacion
JOIN seguidores s
    ON u.id_usuario = s.usuario_seguido
GROUP BY
    u.id_usuario,
    u.nombre
HAVING COUNT(c.id_comentario) >= 1
ORDER BY total_comentarios DESC;

