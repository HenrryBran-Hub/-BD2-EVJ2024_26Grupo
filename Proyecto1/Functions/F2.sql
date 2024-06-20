-------------------------------------------------------------------------
-- Laboratorio Sistemas de Bases 2
-- Escuela de Vacaciones Primer Semestre 2024
-- Grupo 26
-- Function Func_tutor_course
-------------------------------------------------------------------------
USE BD2;
GO

CREATE FUNCTION proyecto1.F2(@TutorId UNIQUEIDENTIFIER)
RETURNS TABLE
AS
RETURN
(
    SELECT c.CodCourse, c.Name, c.CreditsRequired
    FROM CourseTutor ct
    JOIN Course c ON ct.CourseCodCourse = c.CodCourse
    WHERE ct.TutorId = @TutorId
);
GO

-- Llamar funcion
USE BD2;
GO

SELECT * FROM proyecto1.F2('5466F60A-11A6-4C09-8932-D48B58150764');
GO