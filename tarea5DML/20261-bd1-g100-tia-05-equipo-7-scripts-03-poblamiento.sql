-- Poblamiento de la Base de Datos

INSERT INTO rol (nombre_rol, descripcion) VALUES
('Administrador', 'Control total del sistema'),
('Moderador', 'Gestiona contenido'),
('Estudiante', 'Usuario principal'),
('Invitado', 'Acceso limitado');

INSERT INTO tipo_usuario (nombre_tipo, descripcion) VALUES
('Estudiante regular', 'Usuario activo'),
('Monitor', 'Apoyo académico'),
('Tutor', 'Brinda mentorías'),
('Egresado', 'Ex alumno'),
('Docente', 'Profesor'),
('Investigador', 'Investigación'),
('Club deportivo', 'Actividades deportivas'),
('Club tecnológico', 'Actividades tecnológicas'),
('Visitante', 'Acceso básico');

INSERT INTO servicio_tipo (nombre_servicio, descripcion) VALUES
('Mentoría', 'Apoyo académico'),
('Curso', 'Formación'),
('Asesoría', 'Consultoría');

INSERT INTO producto_tipo (nombre_producto, descripcion) VALUES
('Libro', 'Material académico'),
('Electrónico', 'Equipos'),
('Accesorio', 'Elementos varios');

INSERT INTO evento_tipo (nombre_evento, descripcion) VALUES
('Taller', 'Capacitación'),
('Hackathon', 'Competencia'),
('Reunión', 'Encuentro académico');
INSERT INTO usuario (
    id_rol,
    id_tipo_usuario,
    nombre,
    apellido,
    correo,
    contrasena,
    fecha_nacimiento,
    direccion
) VALUES
(3, 1, 'Ana', 'Martinez', 'ana@pascualina.edu.co', 'clave123', '2002-05-10', 'Cali'),
(3, 2, 'Carlos', 'Lopez', 'carlos@pascualina.edu.co', 'clave123', '2001-08-15', 'Bogotá'),
(3, 3, 'Laura', 'Gomez', 'laura@pascualina.edu.co', 'clave123', '2000-03-22', 'Medellín'),
(2, 5, 'Andres', 'Ramirez', 'andres@pascualina.edu.co', 'clave123', '1990-11-12', 'Cali'),
(1, 4, 'Sofia', 'Torres', 'sofia@pascualina.edu.co', 'clave123', '1998-06-30', 'Barranquilla');

INSERT INTO perfil (id_usuario, datos_perfil) VALUES
(1, '{"intereses":["programación","IA"],"habilidades":["Python","SQL"]}'),
(2, '{"intereses":["videojuegos","redes"],"habilidades":["Java","Cisco"]}'),
(3, '{"intereses":["diseño","frontend"],"habilidades":["HTML","CSS"]}'),
(4, '{"intereses":["investigación"],"habilidades":["análisis"]}'),
(5, '{"intereses":["mentorías"],"habilidades":["docencia"]}');
INSERT INTO publicacion (id_usuario, contenido) VALUES
(1, 'Busco compañeros para estudiar bases de datos'),
(2, 'Comparto recurso de redes de computadoras'),
(3, 'Alguien interesado en frontend?'),
(4, 'Nueva convocatoria de investigación'),
(5, 'Mentoría disponible para SQL');

INSERT INTO comentario (id_publicacion, id_usuario, contenido) VALUES
(1, 2, 'Me interesa unirme'),
(1, 3, 'Yo también participo'),
(2, 1, 'Gracias por compartir'),
(3, 5, 'Cuenta conmigo'),
(5, 4, 'Excelente iniciativa');

INSERT INTO grupo (id_usuario, nombre_grupo, descripcion) VALUES
(1, 'Grupo SQL', 'Grupo de estudio de bases de datos'),
(2, 'Redes Avanzadas', 'Aprendizaje de redes'),
(3, 'Frontend Club', 'Diseño web y desarrollo');

INSERT INTO grupo_usuarios (id_grupo, id_usuario) VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 3),
(3, 5);
INSERT INTO servicio (
    id_usuario,
    id_servicio_tipo,
    nombre_servicio,
    descripcion,
    precio,
    duracion,
    ubicacion
) VALUES
(5, 1, 'Mentoría SQL', 'Apoyo en bases de datos', 50000, '2 horas', 'Virtual'),
(4, 3, 'Asesoría investigación', 'Orientación académica', 80000, '1 hora', 'Cali'),
(2, 2, 'Curso redes', 'Capacitación en redes', 120000, '4 semanas', 'Virtual');

INSERT INTO servicio_usuarios (id_servicio, id_usuario) VALUES
(1, 1),
(2, 3),
(3, 5);

INSERT INTO producto (
    id_usuario,
    id_producto_tipo,
    nombre_producto,
    descripcion,
    precio,
    estado_producto
) VALUES
(1, 1, 'Libro SQL', 'Libro académico de bases de datos', 45000, 'Nuevo'),
(2, 2, 'Router', 'Equipo de redes', 150000, 'Usado'),
(3, 3, 'Mouse', 'Accesorio para computador', 30000, 'Nuevo');

INSERT INTO producto_usuarios (
    id_producto,
    id_usuario,
    numero_transaccion
) VALUES
(1, 2, 'TXN001'),
(2, 3, 'TXN002'),
(3, 1, 'TXN003');
INSERT INTO evento (
    id_usuario,
    id_evento_tipo,
    nombre_evento,
    descripcion,
    fecha_evento,
    lugar
) VALUES
(1, 1, 'Taller PostgreSQL', 'Capacitación en bases de datos', '2026-06-10 14:00:00', 'Sala A'),
(2, 2, 'Hackathon Tecnología', 'Competencia de programación', '2026-06-15 09:00:00', 'Auditorio'),
(3, 3, 'Reunión Frontend', 'Encuentro de desarrolladores web', '2026-06-20 16:00:00', 'Virtual');

INSERT INTO evento_usuarios (
    id_evento,
    id_usuario,
    participo
) VALUES
(1, 2, TRUE),
(1, 3, FALSE),
(2, 1, TRUE),
(3, 5, FALSE);

INSERT INTO seguidores (
    usuario_seguidor,
    usuario_seguido
) VALUES
(1, 2),
(2, 3),
(3, 1),
(4, 5),
(5, 1);
