USE fechascivicas;

-- Creación de la tabla 'Formulario'
CREATE TABLE Formulario (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(60) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL
);

-- Creación de la tabla 'Estudiante'
CREATE TABLE Estudiante (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombres VARCHAR(60) NOT NULL,
    Apellidos VARCHAR(60) NOT NULL,
    FechaNacimiento DATE,
    Genero VARCHAR(10),
    Telefono VARCHAR(9)
);

-- Creación de la tabla 'FechasCivicas'
CREATE TABLE FechasCivicas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE NOT NULL,
    Descripcion VARCHAR(255) NOT NULL
);

-- Creación de la tabla 'FormularioEstudiante'
CREATE TABLE FormularioEstudiante (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    FormularioID INT NOT NULL,
    EstudianteID INT NOT NULL,
    Nombre VARCHAR(60) NOT NULL,
    Apellido VARCHAR(60) NOT NULL,
    Asunto TEXT NOT NULL,
    Fecha DATETIME NOT NULL,
    Grado INT NOT NULL,
    Seccion VARCHAR(10) NOT NULL,
    NombreEstudiante VARCHAR(60) NOT NULL,
    ApellidoEstudiante VARCHAR(60) NOT NULL,
    FOREIGN KEY (FormularioID) REFERENCES Formulario(ID),
    FOREIGN KEY (EstudianteID) REFERENCES Estudiante(ID)
);

-- Inserción de 10 registros de fechas cívicas relacionadas con el colegio
INSERT INTO FechasCivicas (Fecha, Descripcion)
VALUES
    ('2023-02-20', 'Aniversario del Colegio'),
    ('2023-04-15', 'Día del Fundador del Colegio'),
    ('2023-09-01', 'Inicio del Año Escolar'),
    ('2023-10-10', 'Día de la Educación'),
    ('2023-11-15', 'Día de la Ciencia en el Colegio'),
    ('2023-12-05', 'Día de la Creatividad Estudiantil'),
    ('2023-03-20', 'Día del Deporte en el Colegio'),
    ('2023-05-25', 'Día de las Artes en el Colegio'),
    ('2023-06-30', 'Día de la Tecnología en el Colegio'),
    ('2023-08-10', 'Día de la Excelencia Académica en el Colegio');

-- Restricciones en la tabla FormularioEstudiante
ALTER TABLE FormularioEstudiante
    ADD CONSTRAINT CK_Grado CHECK (Grado >= 1 AND Grado <= 12);

ALTER TABLE FormularioEstudiante
    ADD CONSTRAINT CK_Seccion CHECK (Seccion IN ('A', 'B', 'C', 'D', 'E'));

-- Restricciones en la tabla FechasCivicas
ALTER TABLE FechasCivicas
    ADD CONSTRAINT CK_FechaValida CHECK (Fecha >= '2023-01-01' AND Fecha <= '2023-12-31');

