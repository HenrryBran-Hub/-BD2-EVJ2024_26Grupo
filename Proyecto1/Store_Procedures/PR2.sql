
-------------------------------------------------------------------------
-- Laboratorio Sistemas de Bases 2
-- Escuela de Vacaciones Primer Semestre 2024
-- Grupo 26
-- Store Procedure para Cambio de Rol a Tutor
-------------------------------------------------------------------------

CREATE OR ALTER PROCEDURE proyecto1.PR2
(
	@Email NVARCHAR(MAX)
	,@CodCourse INT
)
AS
BEGIN
	DECLARE @descriptionMessage VARCHAR(MAX)

	BEGIN TRY
		BEGIN TRAN CambioRoles
			DECLARE @idUser UNIQUEIDENTIFIER
					,@rolIdTutor UNIQUEIDENTIFIER
					,@isConfirmed BIT

			IF NOT EXISTS (SELECT 1 FROM proyecto1.Usuarios WHERE Email = @Email)
			BEGIN
				ROLLBACK TRAN CambioRoles
				SET @descriptionMessage = CONCAT('ERROR - CambioRoles - No existe un usuario con el email ', @Email)

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), @descriptionMessage)

				RETURN 0
			END

			IF @CodCourse < 0 OR @CodCourse IS NULL
			BEGIN
				ROLLBACK TRAN CambioRoles
				SET @descriptionMessage = 'ERROR - CambioRoles - El código del curso no puede ser negativo ni estar vacío'

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), @descriptionMessage)

				RETURN 0
			END

			SELECT @idUser = Id
				  ,@isConfirmed = EmailConfirmed
			FROM proyecto1.Usuarios
			WHERE Email = @Email

			SELECT @rolIdTutor = Id
			FROM proyecto1.Roles
			WHERE RoleName = 'Tutor'

			IF @rolIdTutor IS NULL
			BEGIN
				ROLLBACK TRAN CambioRoles
				SET @descriptionMessage = 'ERROR - CambioRoles - No existe un rol de usuario Tutor'

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), @descriptionMessage)

				RETURN 0
			END

			IF EXISTS (SELECT 1 FROM proyecto1.CourseTutor WHERE TutorId = @idUser AND CourseCodCourse = @CodCourse)
			BEGIN
				ROLLBACK TRAN CambioRoles
				SET @descriptionMessage = CONCAT('ERROR - CambioRoles - Ya existe una asignación del usuario ', @Email, ' al curso ', @CodCourse)

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), @descriptionMessage)

				RETURN 0
			END

			IF @isConfirmed = 0
			BEGIN
				ROLLBACK TRAN CambioRoles
				SET @descriptionMessage = CONCAT('ERROR - CambioRoles - El usuario con email ', @Email, ' no cuenta con un usuario activo')

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), @descriptionMessage)

				RETURN 0
			END

			INSERT INTO proyecto1.UsuarioRole(RoleId, UserId, IsLatestVersion)
			VALUES(@rolIdTutor, @idUser, 1)

			INSERT INTO proyecto1.TutorProfile(UserId, TutorCode)
			VALUES(@idUser, NEWID())

			INSERT INTO proyecto1.CourseTutor(TutorId, CourseCodCourse)
			VALUES(@idUser, @CodCourse)

			INSERT INTO proyecto1.Notification(UserId, Message, Date)
			VALUES(@idUser, 'Usuario promovido al rol de Tutor', GETDATE())

			INSERT INTO proyecto1.HistoryLog(Date, Description)
			VALUES(GETDATE(), 'OK - CambioRoles')

			COMMIT TRAN CambioRoles

	END TRY
	BEGIN CATCH
		ROLLBACK TRAN CambioRoles

		INSERT INTO proyecto1.HistoryLog(Date, Description)
		VALUES(GETDATE(),  CONCAT('ERROR - CambioRoles', ERROR_MESSAGE()))
	END CATCH
END
GO
