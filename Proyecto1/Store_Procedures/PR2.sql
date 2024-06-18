
CREATE OR ALTER PROCEDURE proyecto1.PR2
(
	@Email NVARCHAR(MAX)
	,@CodCourse INT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN CambioRoles
			DECLARE @idUser UNIQUEIDENTIFIER
					,@rolIdTutor UNIQUEIDENTIFIER

			IF NOT EXISTS (SELECT 1 FROM proyecto1.Usuarios WHERE Email = @Email)
			BEGIN
				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), 'ERROR - CambioRoles - No existe un usuario con el email enviado')

				RETURN 0
			END

			SELECT @idUser = Id
			FROM proyecto1.Usuarios
			WHERE Email = @Email

			SELECT @rolIdTutor = Id
			FROM proyecto1.Roles
			WHERE RoleName = 'Tutor'

			IF @rolIdTutor IS NULL
			BEGIN
				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), 'ERROR - CambioRoles - No existe un rol de usuario Tutor')

				RETURN 0
			END

			INSERT INTO proyecto1.UsuarioRole(RoleId, UserId, IsLatestVersion)
			VALUES(@rolIdTutor, @idUser, 1)

			INSERT INTO proyecto1.TutorProfile(UserId, TutorCode)
			VALUES(@idUser, 'PRUEBA')

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
