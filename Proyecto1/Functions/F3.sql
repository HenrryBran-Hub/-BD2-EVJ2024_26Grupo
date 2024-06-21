-------------------------------------------------------------------------
-- Laboratorio Sistemas de Bases 2
-- Escuela de Vacaciones Primer Semestre 2024
-- Grupo 26
-- Function Func_notification_usuarios
-------------------------------------------------------------------------
USE BD2;
GO

CREATE OR ALTER FUNCTION proyecto1.F3(@UserId UNIQUEIDENTIFIER)
RETURNS TABLE
AS
RETURN
(
    SELECT n.Id, n.UserId, n.Message, n.Date
    FROM proyecto1.Notification n
    WHERE n.UserId = @UserId
);
GO

-- Llamar funcion
USE BD2;
GO

SELECT * FROM proyecto1.F3('5466F60A-11A6-4C09-8932-D48B58150764');
GO