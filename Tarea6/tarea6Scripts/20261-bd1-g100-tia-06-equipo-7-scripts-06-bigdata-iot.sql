--
-- Scripts de experimentación de escenarios Big Data e IoT
-- en la Base de Datos  - SGBD PostgreSQL
--
-- 

-- Script de simulación de operaciones masivas de datos (Big Data / IoT)
-- La Directiva de la Red Socio Productiva requiere que se verifique el rendimiento y velocidad de procesamiento 
-- de la base de datos de la Red Pascualina. 
-- El Gobierno Nacional le ha solicitado expandir la Red a todas las universivades del país.


--
-- 1.- CREAR UNA NUEVA TABLA: “usuario_test”. NO UTILIZAR la tabla actual de usuario de la base de datos.
--      Nota: coloque los datos básicos de un usuario. Puede tomar como referencia la tabla "usuarios" y 
--            colocar un mínimo de 5 campos de esa tabla si así lo desea.
--
CREATE TABLE IF NOT EXISTS usuario_test (
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(150),
    ciudad VARCHAR(100),
    telefono VARCHAR(20),
    fecha_registro TIMESTAMP DEFAULT NOW(),
    datos_salud JSON
);


--
-- 2.- Utilice o elabore una función de generación de registros aleatorios en la tabla "usuario_test" 
--  Nota: recuerde los ejercicios y talleres realizados en los encuentros sincrónicos.
--
CREATE OR REPLACE FUNCTION generar_usuarios(cantidad INTEGER)
RETURNS VOID AS $$
BEGIN
    INSERT INTO usuario_test
    (
        nombre,
        correo,
        ciudad,
        telefono,
        datos_salud
    )
    SELECT
        'Usuario_' || g,
        'usuario' || g || '@correo.com',
        'Ciudad_' || (g % 10),
        '300' || lpad((g % 10000000)::text,7,'0'),
        json_build_object(
            'presion_sanguinea', floor(random()*60 + 90),
            'temperatura_corporal', round((random()*3 + 36)::numeric,1),
            'grupo_sanguineo', 'O+',
            'nivel_azucar', floor(random()*80 + 70),
            'fecha_medicion', NOW()
        )
    FROM generate_series(1,cantidad) g;
END;
$$ LANGUAGE plpgsql;


--
-- 3.- Utilice la función para realizar las siguientes simulaciones de "inserción" en la tabla "usuario_test"
--
-- Simulación 1:      1.000 registros de usuarios
SELECT generar_usuarios(1000);
-- Simulación 2:     10.000     "       "
SELECT generar_usuarios(10000);
-- Simulación 3:    100.000     "       "
SELECT generar_usuarios(100000);
-- Simulación 4:  1.000.000     "       "
SELECT generar_usuarios(1000000);
-- Simulación 5: 10.000.000     "       "
SELECT generar_usuarios(10000000);

--
-- OJO -> Cada registro en la tabla "usuarios_test" debe tener asociado un JSON con los siguientes 5 datos de salud: 
-- 1.- presión sanguinea
-- 2.- temperatura corporal
-- 3.- tipo de grupo sanguíneo y 
-- 4.- nivel de azúcar en la sangre. 
-- 5.- Fecha - hora medición (dato fecha_hora debe estar separado en fecha y hora)
-- 
-- Nota: Puede inventar los datos al igual que los datos de usuario.
--

--
-- EN CADA SIMULACIÓN:
-- a.- Coloque el número de registros a generar en la función de generación
-- b.- Ejecutar la operación de escritura (inserción) con la instrucción EXPLAIN ANALYZE 
-- c.- Registrar los valores de preparación y ejecución de la operación en el cuadro del informe
-- d.- Ejecutar la instrucción TRUNCATE
-- e.- Volver a generar otro conjunto de registros
--






--
-- 4.- RECUERDE DE rellenar el cuadro consolidado de los resultados de las simulaciones en el informe 
--
