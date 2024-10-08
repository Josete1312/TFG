-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS web_dietistas;

-- Seleccionar la base de datos
USE web_dietistas;

-- 1. Tabla de Usuarios
CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    tipo_usuario ENUM('dietista', 'cliente') NOT NULL,
    fecha_registro DATE NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(255),
    fecha_nacimiento DATE,
    sexo ENUM('M', 'F', 'Otro')
);

-- Insertar datos en la tabla Usuarios
INSERT INTO usuarios (nombre, apellido, email, contraseña, tipo_usuario, fecha_registro, telefono, direccion, fecha_nacimiento, sexo)
VALUES
('Ana', 'Martínez', 'ana.martinez@example.com', 'hashed_password1', 'dietista', '2024-01-01', '123456789', 'Calle Falsa 123', '1990-05-10', 'F'),
('Carlos', 'Pérez', 'carlos.perez@example.com', 'hashed_password2', 'cliente', '2024-01-02', '987654321', 'Avenida Siempre Viva 456', '1985-08-20', 'M');

-- 2. Tabla de Dietistas
CREATE TABLE dietistas (
    id_dietista INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    experiencia TEXT,
    especialidades TEXT,
    formacion TEXT,
    certificaciones TEXT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Insertar datos en la tabla Dietistas
INSERT INTO dietistas (id_usuario, experiencia, especialidades, formacion, certificaciones)
VALUES
(1, '5 años de experiencia en nutrición deportiva', 'Nutrición deportiva, Dietas veganas', 'Licenciatura en Nutrición, Curso avanzado en dietas veganas', 'Certificación en Nutrición Deportiva'),
(1, '7 años en el campo de la salud y bienestar', 'Pérdida de peso, Nutrición clínica', 'Máster en Salud Pública, Especialización en Dietética', 'Certificación en Nutrición Clínica');

-- 3. Tabla de Clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    altura DECIMAL(5,2),
    peso DECIMAL(5,2),
    historial_medico TEXT,
    alergias TEXT,
    preferencias_alimentarias TEXT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Insertar datos en la tabla Clientes
INSERT INTO clientes (id_usuario, altura, peso, historial_medico, alergias, preferencias_alimentarias)
VALUES
(2, 1.75, 70.5, 'Hipertensión', 'Ninguna', 'Vegetariano'),
(2, 1.68, 65.2, 'Diabetes tipo 2', 'Lácteos', 'Baja en carbohidratos');

-- 4. Tabla de Dietas Personalizadas
CREATE TABLE dietas_personalizadas (
    id_dieta INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_dietista INT NOT NULL,
    fecha_inicio DATE,
    fecha_fin DATE,
    descripcion TEXT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_dietista) REFERENCES dietistas(id_dietista)
);

-- Insertar datos en la tabla Dietas Personalizadas
INSERT INTO dietas_personalizadas (id_cliente, id_dietista, fecha_inicio, fecha_fin, descripcion)
VALUES
(1, 1, '2024-02-01', '2024-03-01', 'Dieta vegana alta en proteínas para mejorar rendimiento deportivo.'),
(2, 1, '2024-02-10', '2024-03-10', 'Dieta baja en carbohidratos para controlar los niveles de azúcar.');

-- 5. Tabla de Proyectos SANUM
CREATE TABLE proyectos (
    id_proyecto INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    estado ENUM('activo', 'finalizado') NOT NULL
);

-- Insertar datos en la tabla Proyectos SANUM
INSERT INTO proyectos (titulo, descripcion, fecha_inicio, fecha_fin, estado)
VALUES
('Proyecto SANUM 2024', 'Iniciativa para promover hábitos alimenticios saludables en jóvenes.', '2024-01-15', '2024-12-15', 'activo'),
('Estudio sobre Nutrición Infantil', 'Investigación sobre los efectos de la alimentación en el desarrollo infantil.', '2023-10-01', '2024-10-01', 'finalizado');

-- 6. Tabla de Actividades
CREATE TABLE actividades (
    id_actividad INT PRIMARY KEY AUTO_INCREMENT,
    id_proyecto INT NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_proyecto) REFERENCES proyectos(id_proyecto)
);

-- Insertar datos en la tabla Actividades
INSERT INTO actividades (id_proyecto, titulo, descripcion, fecha)
VALUES
(1, 'Taller de nutrición deportiva', 'Sesión para enseñar hábitos alimenticios adecuados para atletas jóvenes.', '2024-02-20'),
(2, 'Charla sobre alimentación infantil', 'Conferencia sobre la importancia de una dieta balanceada en niños.', '2024-01-25');

-- 7. Tabla de Redes Sociales
CREATE TABLE redes_sociales (
    id_red_social INT PRIMARY KEY AUTO_INCREMENT,
    id_dietista INT NOT NULL,
    plataforma VARCHAR(50) NOT NULL,
    url VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_dietista) REFERENCES dietistas(id_dietista)
);

-- Insertar datos en la tabla Redes Sociales
INSERT INTO redes_sociales (id_dietista, plataforma, url)
VALUES
(1, 'Instagram', 'https://www.instagram.com/dietista_ana'),
(1, 'LinkedIn', 'https://www.linkedin.com/in/dietista-ana');

-- 8. Tabla de Citas
CREATE TABLE citas (
    id_cita INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_dietista INT NOT NULL,
    fecha_hora DATETIME NOT NULL,
    motivo TEXT,
    estado ENUM('pendiente', 'confirmada', 'cancelada') NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_dietista) REFERENCES dietistas(id_dietista)
);

-- Insertar datos en la tabla Citas
INSERT INTO citas (id_cliente, id_dietista, fecha_hora, motivo, estado)
VALUES
(1, 1, '2024-02-15 10:00:00', 'Consulta sobre dieta vegana para atletas.', 'confirmada'),
(2, 1, '2024-02-20 15:00:00', 'Asesoría nutricional para control de peso.', 'pendiente');
