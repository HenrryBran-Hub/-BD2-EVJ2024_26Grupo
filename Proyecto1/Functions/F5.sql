-------------------------------------------------------------------------
-- Laboratorio Sistemas de Bases 2
-- Escuela de Vacaciones Primer Semestre 2024
-- Grupo 26
-- Function Func_usuarios
-------------------------------------------------------------------------
USE BD2;
GO

CREATE OR ALTER FUNCTION proyecto1.F5(@UserId UNIQUEIDENTIFIER)
RETURNS TABLE
AS
RETURN
(
    SELECT u.Firstname, u.Lastname, u.Email, u.DateOfBirth, ps.Credits, r.RoleName
    FROM Usuarios u    
    JOIN ProfileStudent ps ON u.Id = ps.UserId
    JOIN UsuarioRole ur ON u.Id = ur.UserId
    JOIN Roles r ON ur.RoleId = r.Id
    WHERE u.Id = @UserId
);
GO


-- Llamar funcion
USE BD2;
GO

SELECT * FROM proyecto1.F5('5466F60A-11A6-4C09-8932-D48B58150764');
GO