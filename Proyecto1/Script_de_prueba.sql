-- probando procedimientos
USE BD2;
-- agregamos usuarios PR1
EXECUTE proyecto1.PR1 @FirstName = 'Henrry', @Lastname = 'Bran', @Email = 'henrry@gmail.com', @DateOfBirth = '2000-01-01', @Password = '123abc', @Credits = 50 ;
EXECUTE proyecto1.PR1 @FirstName = 'María', @Lastname = 'González', @Email = 'maria.gonzalez@gmail.com', @DateOfBirth = '1992-05-12', @Password = 'pass123', @Credits = 100;
EXECUTE proyecto1.PR1 @FirstName = 'Carlos', @Lastname = 'López', @Email = 'carlos.lopez@gmail.com', @DateOfBirth = '1985-08-23', @Password = 'lopez2021', @Credits = 75;
EXECUTE proyecto1.PR1 @FirstName = 'Ana', @Lastname = 'Martínez', @Email = 'ana.martinez@gmail.com', @DateOfBirth = '1990-11-30', @Password = 'martinez90', @Credits = 60;
EXECUTE proyecto1.PR1 @FirstName = 'Pedro', @Lastname = 'Hernández', @Email = 'pedro.hernandez@gmail.com', @DateOfBirth = '1995-03-15', @Password = 'peter123', @Credits = 80;
EXECUTE proyecto1.PR1 @FirstName = 'Lucía', @Lastname = 'Sánchez', @Email = 'lucia.sanchez@gmail.com', @DateOfBirth = '2001-07-25', @Password = 'lucia2001', @Credits = 55;
EXECUTE proyecto1.PR1 @FirstName = 'Jorge', @Lastname = 'Ramírez', @Email = 'jorge.ramirez@gmail.com', @DateOfBirth = '1988-12-10', @Password = 'ramirez88', @Credits = 90;
EXECUTE proyecto1.PR1 @FirstName = 'Laura', @Lastname = 'Díaz', @Email = 'laura.diaz@gmail.com', @DateOfBirth = '1993-04-05', @Password = 'laura93', @Credits = 70;
EXECUTE proyecto1.PR1 @FirstName = 'Sofía', @Lastname = 'Pérez', @Email = 'sofia.perez@gmail.com', @DateOfBirth = '1998-09-18', @Password = 'sofia98', @Credits = 85;
EXECUTE proyecto1.PR1 @FirstName = 'Miguel', @Lastname = 'Torres', @Email = 'miguel.torres@gmail.com', @DateOfBirth = '1991-02-28', @Password = 'torres91', @Credits = 65;
EXECUTE proyecto1.PR1 @FirstName = 'Elena', @Lastname = 'Mendoza', @Email = 'elena.mendoza@gmail.com', @DateOfBirth = '1987-06-07', @Password = 'mendoza87', @Credits = 95;

-- agregamos un nuevo rol PR4
-- EXECUTE proyecto1.PR4 @RoleName = 'Admin';

--agregamos cursos PR5
EXECUTE proyecto1.PR5 @CodCourse = 7885, @Name = 'Social Humanistica 1', @CreditsRequired = 4;
EXECUTE proyecto1.PR5 @CodCourse = 7886, @Name = 'Matemáticas Básicas', @CreditsRequired = 3;
EXECUTE proyecto1.PR5 @CodCourse = 7887, @Name = 'Física General', @CreditsRequired = 4;
EXECUTE proyecto1.PR5 @CodCourse = 7888, @Name = 'Química Orgánica', @CreditsRequired = 4;
EXECUTE proyecto1.PR5 @CodCourse = 7889, @Name = 'Historia Contemporánea', @CreditsRequired = 3;
EXECUTE proyecto1.PR5 @CodCourse = 7890, @Name = 'Biología Celular', @CreditsRequired = 4;
EXECUTE proyecto1.PR5 @CodCourse = 7891, @Name = 'Programación', @CreditsRequired = 200;
EXECUTE proyecto1.PR5 @CodCourse = 7892, @Name = 'Economía Aplicada', @CreditsRequired = 3;
EXECUTE proyecto1.PR5 @CodCourse = 7893, @Name = 'Psicología Social', @CreditsRequired = 66;
EXECUTE proyecto1.PR5 @CodCourse = 7894, @Name = 'Literatura Clásica', @CreditsRequired = 3;

-- asignacion de cursos PR3
EXECUTE proyecto1.PR2 @Email = 'henrry@gmail.com', @CodCourse = 283;
EXECUTE proyecto1.PR3 @Email = 'laura.diaz@gmail.com', @CodCourse = 283;
EXECUTE proyecto1.PR3 @Email = 'henrry@gmail.com', @CodCourse = 283;
EXECUTE proyecto1.PR3 @Email = 'elena.mendoza@gmail.com', @CodCourse = 283;

EXECUTE proyecto1.PR2 @Email = 'laura.diaz@gmail.com', @CodCourse = 7885;
EXECUTE proyecto1.PR3 @Email = 'henrry@gmail.com', @CodCourse = 7885;
EXECUTE proyecto1.PR3 @Email = 'ana.martinez@gmail.com', @CodCourse = 7885;
EXECUTE proyecto1.PR3 @Email = 'elena.mendoza@gmail.com', @CodCourse = 7885;

EXECUTE proyecto1.PR2 @Email = 'henrry@gmail.com', @CodCourse = 7894;
EXECUTE proyecto1.PR3 @Email = 'laura.diaz@gmail.com', @CodCourse = 7894;
EXECUTE proyecto1.PR3 @Email = 'ana.martinez@gmail.com', @CodCourse = 7894;
EXECUTE proyecto1.PR3 @Email = 'elena.mendoza@gmail.com', @CodCourse = 7894;

EXECUTE proyecto1.PR3 @Email = 'henrry@gmail.com', @CodCourse = 7891;
EXECUTE proyecto1.PR3 @Email = 'laura.diaz@gmail.com', @CodCourse = 7891;
EXECUTE proyecto1.PR3 @Email = 'ana.martinez@gmail.com', @CodCourse = 7891;
EXECUTE proyecto1.PR3 @Email = 'elena.mendoza@gmail.com', @CodCourse = 7891;

-- asignacion de tutor

SELECT *FROM proyecto1.Course;
SELECT *FROM proyecto1.CourseAssignment;
SELECT *FROM proyecto1.CourseTutor;
SELECT *FROM proyecto1.HistoryLog;
SELECT *FROM proyecto1.Notification;
SELECT *FROM proyecto1.ProfileStudent;
SELECT *FROM proyecto1.Roles;
SELECT *FROM proyecto1.TFA;
SELECT *FROM proyecto1.TutorProfile;
SELECT *FROM proyecto1.UsuarioRole;
SELECT *FROM proyecto1.Usuarios;

SELECT * FROM proyecto1.F1(283);
GO

SELECT * FROM proyecto1.F2('69FF76A3-06CC-45E7-836B-EAB7BA4DCFF9');
GO

SELECT * FROM proyecto1.F3('5466F60A-11A6-4C09-8932-D48B58150764');
GO

SELECT * FROM proyecto1.F4();
GO

SELECT * FROM proyecto1.F5('5466F60A-11A6-4C09-8932-D48B58150764');
GO
