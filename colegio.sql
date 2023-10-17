-- Crea la base de datos 'colegio_san_benito' con el juego de caracteres utf8mb4
CREATE DATABASE colegio_san_benito CHARSET utf8mb4;

-- Usa la base de datos 'colegio_san_benito'
USE colegio_san_benito;
-- Creación de la tabla Estudiante
CREATE TABLE formulario_consultas (
 id_formulario INT AUTO_INCREMENT NOT NULL,
  id INT NOT NULL,
  nombre_a VARCHAR(20) NOT NULL,
  apellidos_a VARCHAR(20) NOT NULL,
  asunto TEXT NOT NULL,
  fecha DATETIME NOT NULL,
  grado NUMERIC(1,30) NOT NULL,
  seccion VARCHAR(10) NOT NULL,
  id_estudiante INT NOT NULL,
  nombre_estudiante CHAR(30) NOT NULL,
  apellido_estudiante CHAR(30) NOT NULL,

  CONSTRAINT pk_formulario PRIMARY KEY (id_formulario),
  CONSTRAINT pk_estudiante PRIMARY KEY (id_estudiante),
  CONSTRAINT ck_grado CHECK (grado > 0 AND grado <= 12),
  CONSTRAINT ck_seccion CHECK (seccion IN ('A', 'B', 'C', 'D', 'E')),
  CONSTRAINT ck_nombre_a CHECK (nombre_a LIKE '[A-Za-z0-9 _]+'),
  CONSTRAINT ck_apellidos_a CHECK (apellidos_a LIKE '[A-Za-z0-9 _]+'),
  CONSTRAINT ck_asunto CHECK (asunto LIKE '[A-Za-z0-9 _.,!?]+'),
  CONSTRAINT ck_nombre_estudiante CHECK (nombre_estudiante LIKE '[A-Za-z]+'),
  CONSTRAINT ck_apellido_estudiante CHECK (apellido_estudiante LIKE '[A-Za-z]+')
);
CREATE TABLE Estudiante (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombres VARCHAR(60) NOT NULL,
    FechaNacimiento DATE,
    Genero VARCHAR(10),
    Telefono VARCHAR(9)
);

-- Creación de la tabla Apoderados
CREATE TABLE Apoderados (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombres VARCHAR(60) NOT NULL,
    Apellidos VARCHAR(60) NOT NULL,
    Email VARCHAR(80) NOT NULL,
    Celular VARCHAR(9),
    EstudianteID INT,
    FOREIGN KEY (EstudianteID) REFERENCES Estudiante(ID)
);

-- Creación de la tabla Director
CREATE TABLE Director (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombres VARCHAR(60) NOT NULL,
    Apellidos VARCHAR(60) NOT NULL
);

-- Creación de la tabla PersonalAdministrativo
CREATE TABLE PersonalAdministrativo (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombres VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    FechaContrato DATETIME,
    Contacto TEXT(600),
    Celular VARCHAR(9)
);

-- Creación de la tabla Contacto
CREATE TABLE Contacto (
    Email VARCHAR(80) NOT NULL,
    Asunto VARCHAR(90) NOT NULL,
    FechaEnvio DATETIME,
    Mensaje TEXT(600),
    Celular VARCHAR(9)
);

-- Creación de la tabla Aula
CREATE TABLE Aula (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Capacidad INT,
    Ubicacion VARCHAR(100),
    Equipamiento TEXT(80)
);

-- Creación de la tabla Profesor
CREATE TABLE Profesor (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombres VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Especialidad VARCHAR(20) NOT NULL,
    CorreoElectronico VARCHAR(80) NOT NULL
);

-- Creación de la tabla Curso
CREATE TABLE Curso (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(80),
    Codigo VARCHAR(80),
    Descripcion TEXT(600),
    Horario DATETIME
);

-- Creación de la tabla intermedia ProfesorCurso para la relación entre Profesor y Curso
CREATE TABLE ProfesorCurso (
    ProfesorID INT,
    CursoID INT,
    FOREIGN KEY (ProfesorID) REFERENCES Profesor(ID),
    FOREIGN KEY (CursoID) REFERENCES Curso(ID)
);

-- Inserciones de registros
INSERT INTO Estudiante (Nombres, FechaNacimiento, Genero, Telefono)
VALUES ('Juan Pérez', '2005-08-15', 'Masculino', '123456789');

INSERT INTO Apoderados (Nombres, Apellidos, Email, Celular, EstudianteID)
VALUES ('María Gómez', 'Pérez', 'maria@example.com', '987654321', 1);

INSERT INTO Director (Nombres, Apellidos)
VALUES ('Ana', 'García');

INSERT INTO PersonalAdministrativo (Nombres, Apellidos, FechaContrato, Contacto, Celular)
VALUES ('Luis', 'Martínez', '2023-01-10 09:00:00', 'Trabajo en la administración', '555555555');

INSERT INTO Contacto (Email, Asunto, FechaEnvio, Mensaje, Celular)
VALUES ('contacto@ejemplo.com', 'Pregunta sobre el horario', '2023-02-20 14:30:00', '¿Cuándo son las clases?', '666666666');

-- Actualizaciones
UPDATE Estudiante
SET Telefono = '999999999'
WHERE ID = 1;

UPDATE Apoderados
SET Email = 'nuevoemail@example.com'
WHERE ID = 1;

-- Listados
SELECT * FROM Estudiante;

SELECT Nombre, Horario FROM Curso;

-- Eliminaciones
-- Asegúrate de eliminar primero el registro en la tabla 'Apoderados' para mantener la integridad referencial
DELETE FROM Apoderados WHERE EstudianteID = 1;
DELETE FROM Estudiante WHERE ID = 1;