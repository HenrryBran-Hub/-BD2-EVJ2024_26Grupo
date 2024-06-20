
-------------------------------------------------------------------------
-- Laboratorio Sistemas de Bases 2
-- Escuela de Vacaciones Primer Semestre 2024
-- Grupo 26
-- Store Procedure para Validación de Datos
-------------------------------------------------------------------------

CREATE OR ALTER PROCEDURE proyecto1.PR6
(
	@EntityName NVARCHAR(50)
    ,@FirstName NVARCHAR(MAX) = NULL
    ,@LastName NVARCHAR(MAX) = NULL
    ,@Name NVARCHAR(MAX) = NULL
    ,@CreditsRequired INT = NULL
    ,@IsValid BIT OUTPUT
)
AS
BEGIN
	IF @EntityName = 'Users'
    BEGIN
        IF ISNULL(@FirstName, '') NOT LIKE '%[^a-zA-Z ]%' AND ISNULL(@LastName, '') NOT LIKE '%[^a-zA-Z ]%'
            SET @IsValid = 1;
        ELSE
            SET @IsValid = 0;
    END
    -- Validacion de Curso
    ELSE IF @EntityName = 'Course'
    BEGIN
		IF (
			PATINDEX('%[^a-zA-Z 0-9]%', @Name) = 0
			AND (
				PATINDEX('% [0-9]', @Name) > 0
				OR PATINDEX('%[0-9]%', @Name) = 0
			)
		) AND ISNUMERIC(@CreditsRequired) = 1
		BEGIN
            SET @IsValid = 1
		END
        ELSE
		BEGIN
            SET @IsValid = 0
		END
    END
    ELSE
    BEGIN
        -- No valida
        SET @IsValid = 0;
    END

END
GO
