---- Script de creación de la Base de Datos - PostgreSQL

CREATE TABLE rol (
    id_rol SERIAL PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(255)
);

CREATE TABLE tipo_usuario (
    id_tipo_usuario SERIAL PRIMARY KEY,
    nombre_tipo VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(255)
);

CREATE TABLE servicio_tipo (
    id_servicio_tipo SERIAL PRIMARY KEY,
    nombre_servicio VARCHAR(100) NOT NULL UNIQUE,
    descripcion VARCHAR(255)
);

CREATE TABLE producto_tipo (
    id_producto_tipo SERIAL PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL UNIQUE,
    descripcion VARCHAR(255)
);

CREATE TABLE evento_tipo (
    id_evento_tipo SERIAL PRIMARY KEY,
    nombre_evento VARCHAR(100) NOT NULL UNIQUE,
    descripcion VARCHAR(255)
);

CREATE TABLE usuario (
    id_usuario SERIAL PRIMARY KEY,
    id_rol INTEGER NOT NULL,
    id_tipo_usuario INTEGER NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo VARCHAR(150) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    direccion VARCHAR(200),
    fecha_registro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_rol) REFERENCES rol(id_rol),
    FOREIGN KEY (id_tipo_usuario) REFERENCES tipo_usuario(id_tipo_usuario)
);

CREATE TABLE perfil (
    id_perfil SERIAL PRIMARY KEY,
    id_usuario INTEGER NOT NULL UNIQUE,
    datos_perfil JSONB NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE publicacion (
    id_publicacion SERIAL PRIMARY KEY,
    id_usuario INTEGER NOT NULL,
    contenido TEXT NOT NULL,
    fecha_publicacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE comentario (
    id_comentario SERIAL PRIMARY KEY,
    id_publicacion INTEGER NOT NULL,
    id_usuario INTEGER NOT NULL,
    contenido TEXT NOT NULL,
    fecha_comentario TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_publicacion) REFERENCES publicacion(id_publicacion),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE grupo (
    id_grupo SERIAL PRIMARY KEY,
    id_usuario INTEGER NOT NULL,
    nombre_grupo VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE grupo_usuarios (
    id_grupo_usuario SERIAL PRIMARY KEY,
    id_grupo INTEGER NOT NULL,
    id_usuario INTEGER NOT NULL,
    fecha_union TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_grupo) REFERENCES grupo(id_grupo),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE servicio (
    id_servicio SERIAL PRIMARY KEY,
    id_usuario INTEGER NOT NULL,
    id_servicio_tipo INTEGER NOT NULL,
    nombre_servicio VARCHAR(120) NOT NULL,
    descripcion TEXT,
    precio NUMERIC(10,2) NOT NULL,
    duracion VARCHAR(50),
    ubicacion VARCHAR(150),
    fecha_publicacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_servicio_tipo) REFERENCES servicio_tipo(id_servicio_tipo)
);

CREATE TABLE servicio_usuarios (
    id_servicio_usuario SERIAL PRIMARY KEY,
    id_servicio INTEGER NOT NULL,
    id_usuario INTEGER NOT NULL,
    fecha_consumo TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE producto (
    id_producto SERIAL PRIMARY KEY,
    id_usuario INTEGER NOT NULL,
    id_producto_tipo INTEGER NOT NULL,
    nombre_producto VARCHAR(120) NOT NULL,
    descripcion TEXT,
    precio NUMERIC(10,2) NOT NULL,
    estado_producto VARCHAR(50),
    fecha_publicacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_producto_tipo) REFERENCES producto_tipo(id_producto_tipo)
);

CREATE TABLE producto_usuarios (
    id_producto_usuario SERIAL PRIMARY KEY,
    id_producto INTEGER NOT NULL,
    id_usuario INTEGER NOT NULL,
    fecha_compra TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    numero_transaccion VARCHAR(50) NOT NULL UNIQUE,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE evento (
    id_evento SERIAL PRIMARY KEY,
    id_usuario INTEGER NOT NULL,
    id_evento_tipo INTEGER NOT NULL,
    nombre_evento VARCHAR(120) NOT NULL,
    descripcion TEXT,
    fecha_evento TIMESTAMP NOT NULL,
    lugar VARCHAR(150),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_evento_tipo) REFERENCES evento_tipo(id_evento_tipo)
);

CREATE TABLE evento_usuarios (
    id_evento_usuario SERIAL PRIMARY KEY,
    id_evento INTEGER NOT NULL,
    id_usuario INTEGER NOT NULL,
    fecha_inscripcion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    participo BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_evento) REFERENCES evento(id_evento),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE seguidores (
    id_seguidor SERIAL PRIMARY KEY,
    usuario_seguidor INTEGER NOT NULL,
    usuario_seguido INTEGER NOT NULL,
    fecha_seguimiento TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_seguidor) REFERENCES usuario(id_usuario),
    FOREIGN KEY (usuario_seguido) REFERENCES usuario(id_usuario)
);
-- 