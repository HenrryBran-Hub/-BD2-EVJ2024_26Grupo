
CREATE OR ALTER PROCEDURE proyecto1.PR1
(
	@FirstName NVARCHAR(MAX)
	,@LastName NVARCHAR(MAX)
	,@Email NVARCHAR(MAX)
	,@DateOfBirth DATETIME2(7)
	,@Password NVARCHAR(MAX)
	,@Credits INT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN RegistrarUsuarios
			DECLARE @roleStudentId UNIQUEIDENTIFIER
					,@idUserNew UNIQUEIDENTIFIER
					,@idUser INT

			SELECT @roleStudentId = Id
			FROM proyecto1.Roles
			WHERE RoleName = 'Student'

			SET @idUserNew = NEWID()

			IF NOT EXISTS (SELECT 1 FROM proyecto1.Usuarios WHERE Email = @Email)
			BEGIN
				INSERT INTO proyecto1.Usuarios(Id, Firstname, Lastname, Email, DateOfBirth, Password, LastChanges, EmailConfirmed)
				VALUES(@idUserNew, @FirstName, @LastName, @Email, @DateOfBirth, @Password, GETDATE(), 1)

				INSERT INTO proyecto1.UsuarioRole(RoleId, UserId, IsLatestVersion)
				VALUES(@roleStudentId, @idUserNew, 1)

				INSERT INTO proyecto1.ProfileStudent(UserId, Credits)
				VALUES(@idUserNew, @Credits)

				INSERT INTO proyecto1.TFA(UserId, Status, LastUpdate)
				VALUES(@idUserNew, 0, GETDATE())

				INSERT INTO proyecto1.Notification(UserId, Message, Date)
				VALUES(@idUserNew, 'Usuario registrado correctamente en el sistema', GETDATE())

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), 'OK - RegistrarUsuarios')

				COMMIT TRAN RegistrarUsuarios
			END
			ELSE
			BEGIN
				ROLLBACK TRAN RegistrarUsuarios

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), 'ERROR - RegistrarUsuarios - Ya existe un usuario con el email enviado')
			END
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN RegistrarUsuarios

		INSERT INTO proyecto1.HistoryLog(Date, Description)
		VALUES(GETDATE(),  CONCAT('ERROR - RegistrarUsuarios', ERROR_MESSAGE()))
	END CATCH
END
GO
