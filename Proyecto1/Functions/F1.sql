-------------------------------------------------------------------------
-- Laboratorio Sistemas de Bases 2
-- Escuela de Vacaciones Primer Semestre 2024
-- Grupo 26
-- Function Func_course_usuarios
-------------------------------------------------------------------------
USE BD2;
GO

CREATE OR ALTER FUNCTION proyecto1.F1(@CodCourse INT)
RETURNS TABLE
AS
RETURN
(
    SELECT u.Id, u.Firstname, u.Lastname, u.Email, u.DateOfBirth
    FROM CourseAssignment ca
    JOIN Usuarios u ON ca.StudentId = u.Id
    JOIN ProfileStudent ps ON u.Id = ps.UserId
    JOIN UsuarioRole ur ON u.Id = ur.UserId
    JOIN Roles r ON ur.RoleId = r.Id
	JOIN CourseTutor ct ON ca.CourseCodCourse = ct.CourseCodCourse
    WHERE ca.CourseCodCourse = @CodCourse
    AND LOWER(r.RoleName) = LOWER('Student')
	AND ct.TutorId != u.id
);
GO

-- Llamar funcion
USE BD2;
GO

SELECT * FROM proyecto1.F1(123);
GO