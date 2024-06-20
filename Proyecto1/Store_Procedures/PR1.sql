
-------------------------------------------------------------------------
-- Laboratorio Sistemas de Bases 2
-- Escuela de Vacaciones Primer Semestre 2024
-- Grupo 26
-- Store Procedure para Registrar Usuarios
-------------------------------------------------------------------------

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

	DECLARE @descriptionMessage VARCHAR(MAX)

	BEGIN TRY
		BEGIN TRAN RegistrarUsuarios
			DECLARE @roleStudentId UNIQUEIDENTIFIER
					,@idUserNew UNIQUEIDENTIFIER
					,@idUser INT

			DECLARE @IsValid BIT

			SELECT @roleStudentId = Id
			FROM proyecto1.Roles
			WHERE RoleName = 'Student'

			SET @idUserNew = NEWID()

			EXEC proyecto1.PR6 'Users', @Firstname, @Lastname, NULL, NULL, @IsValid OUTPUT;

			IF @IsValid = 0
			BEGIN
				ROLLBACK TRAN RegistrarUsuarios
				SET @descriptionMessage = 'ERROR - RegistrarUsuarios - Los campos Nombre y Apellido solamente deben contener letras'

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), @descriptionMessage)

				RETURN 0
			END

			IF EXISTS (SELECT 1 FROM proyecto1.Usuarios WHERE Email = @Email)
			BEGIN
				ROLLBACK TRAN RegistrarUsuarios
				SET @descriptionMessage = CONCAT('ERROR - RegistrarUsuarios - Ya existe un usuario con el email ', @Email)

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), @descriptionMessage)

				RETURN 0
			END

			IF @roleStudentId IS NULL
			BEGIN
				ROLLBACK TRAN RegistrarUsuarios
				SET @descriptionMessage = 'ERROR - RegistrarUsuarios - No existe un rol de Estudiante'

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), @descriptionMessage)

				RETURN 0
			END

			IF @FirstName IS NULL OR @FirstName = ''
			BEGIN
				ROLLBACK TRAN RegistrarUsuarios
				SET @descriptionMessage = 'ERROR - RegistrarUsuarios - El nombre no puede estar vacío'

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), @descriptionMessage)

				RETURN 0
			END

			IF @LastName IS NULL OR @LastName = ''
			BEGIN
				ROLLBACK TRAN RegistrarUsuarios
				SET @descriptionMessage = 'ERROR - RegistrarUsuarios - El apellido no puede estar vacío'

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), @descriptionMessage)

				RETURN 0
			END

			IF @Email IS NULL OR @Email = ''
			BEGIN
				ROLLBACK TRAN RegistrarUsuarios
				SET @descriptionMessage = 'ERROR - RegistrarUsuarios - El email no puede estar vacío'

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), @descriptionMessage)

				RETURN 0
			END

			IF @Password IS NULL OR @Password = ''
			BEGIN
				ROLLBACK TRAN RegistrarUsuarios
				SET @descriptionMessage = 'ERROR - RegistrarUsuarios - El password no puede estar vacío'

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), @descriptionMessage)

				RETURN 0
			END

			IF @DateOfBirth IS NULL
			BEGIN
				ROLLBACK TRAN RegistrarUsuarios
				SET @descriptionMessage = 'ERROR - RegistrarUsuarios - La fecha de nacimiento no puede estar vacía'

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), @descriptionMessage)

				RETURN 0
			END

			IF @Credits IS NULL OR @Credits < 0
			BEGIN
				ROLLBACK TRAN RegistrarUsuarios
				SET @descriptionMessage = 'ERROR - RegistrarUsuarios - La cantidad de créditos no puede estar vacía y no debe ser negativa'

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), @descriptionMessage)

				RETURN 0
			END

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
			
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN RegistrarUsuarios

		INSERT INTO proyecto1.HistoryLog(Date, Description)
		VALUES(GETDATE(),  CONCAT('ERROR - RegistrarUsuarios', ERROR_MESSAGE()))
	END CATCH
END
GO
