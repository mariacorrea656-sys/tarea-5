-- ATOMICIDAD
BEGIN;

UPDATE usuario
SET direccion = 'Medellín Centro'
WHERE id_usuario = 1;

UPDATE producto
SET precio = 99999
WHERE id_producto = 1;

ROLLBACK;

-- CONSISTENCIA (errores intencionales)

-- PK duplicada
INSERT INTO rol (id_rol, nombre_rol, descripcion)
VALUES (1, 'Duplicado', 'Error PK');

-- FK inválida
INSERT INTO usuario (
    id_rol,
    id_tipo_usuario,
    nombre,
    apellido,
    correo,
    contrasena,
    fecha_nacimiento
)
VALUES
(999, 1, 'Error', 'FK', 'errorfk@correo.com', '12345', '2000-01-01');

-- CHECK / dato inválido simulado
UPDATE producto
SET precio = -5000
WHERE id_producto = 1;

-- AISLAMIENTO (caso hipotético)
-- Usuario A actualiza un producto
-- Usuario B intenta leer antes del COMMIT
-- Usuario B no debe ver cambios no confirmados

-- DURABILIDAD
BEGIN;

UPDATE usuario
SET direccion = 'Palmira Confirmado'
WHERE id_usuario = 2;

COMMIT;

SELECT
    id_usuario,
    nombre,
    direccion
FROM usuario
WHERE id_usuario = 2;



