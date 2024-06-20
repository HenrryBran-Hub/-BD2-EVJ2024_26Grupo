
-------------------------------------------------------------------------
-- Laboratorio Sistemas de Bases 2
-- Escuela de Vacaciones Primer Semestre 2024
-- Grupo 26
-- Store Procedure para Creación de Cursos
-------------------------------------------------------------------------

CREATE OR ALTER PROCEDURE proyecto1.PR5
(
	@CodCourse INT
	,@Name NVARCHAR(MAX)
	,@CreditsRequired INT
)
AS
BEGIN
	DECLARE @descriptionMessage VARCHAR(MAX)

	BEGIN TRY
		BEGIN TRAN CreacionCursos

			DECLARE @IsValid BIT

			EXEC proyecto1.PR6 'Course', NULL, NULL, @Name, @CreditsRequired, @IsValid OUTPUT;

			IF @IsValid = 0
			BEGIN
				ROLLBACK TRAN CreacionCursos
				SET @descriptionMessage = 'ERROR - CreacionCursos - Los campos Nombre o Créditos Requeridos tienen un valor incorrecto'

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), @descriptionMessage)

				RETURN 0
			END
			
			IF EXISTS (SELECT 1 FROM proyecto1.Course WHERE Name = @Name AND CodCourse = @CodCourse)
			BEGIN
				ROLLBACK TRAN CreacionCursos
				SET @descriptionMessage = CONCAT('ERROR - CreacionCursos - Ya existe un curso con el nombre ', @Name, ' y código ', @CodCourse)

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), @descriptionMessage)

				RETURN 0
			END

			IF EXISTS (SELECT 1 FROM proyecto1.Course WHERE CodCourse = @CodCourse)
			BEGIN
				ROLLBACK TRAN CreacionCursos
				SET @descriptionMessage = CONCAT('ERROR - CreacionCursos - Ya existe un curso con el código ', @CodCourse)

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), @descriptionMessage)

				RETURN 0
			END

			IF @CodCourse < 0 OR @CodCourse IS NULL
			BEGIN
				ROLLBACK TRAN CreacionCursos
				SET @descriptionMessage = 'ERROR - CreacionCursos - El código del curso no puede ser negativo ni estar vacío'

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), @descriptionMessage)

				RETURN 0
			END

			IF @CreditsRequired < 0
			BEGIN
				ROLLBACK TRAN CreacionCursos
				SET @descriptionMessage = 'ERROR - CreacionCursos - La cantidad de créditos del curso no puede ser negativo'

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), @descriptionMessage)

				RETURN 0
			END

			IF @Name IS NULL OR @Name = ''
			BEGIN
				ROLLBACK TRAN CreacionCursos
				SET @descriptionMessage = 'ERROR - CreacionCursos - El nombre del curso no puede estar vacío'

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), @descriptionMessage)

				RETURN 0
			END

			INSERT INTO proyecto1.Course(CodCourse, Name, CreditsRequired)
			VALUES(@CodCourse, @Name, @CreditsRequired)

			INSERT INTO proyecto1.HistoryLog(Date, Description)
			VALUES(GETDATE(), 'OK - CreacionCursos')

			COMMIT TRAN CreacionCursos
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN CreacionCursos

		INSERT INTO proyecto1.HistoryLog(Date, Description)
		VALUES(GETDATE(),  CONCAT('ERROR - CreacionCursos ', ERROR_MESSAGE()))
	END CATCH
END
GO
