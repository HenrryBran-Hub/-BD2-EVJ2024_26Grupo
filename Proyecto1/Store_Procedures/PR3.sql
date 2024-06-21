
-------------------------------------------------------------------------
-- Laboratorio Sistemas de Bases 2
-- Escuela de Vacaciones Primer Semestre 2024
-- Grupo 26
-- Store Procedure para Asignación de Cursos
-------------------------------------------------------------------------

CREATE OR ALTER PROCEDURE proyecto1.PR3
(
	@Email NVARCHAR(MAX)
	,@CodCourse INT
)
AS
BEGIN
	DECLARE @descriptionMessage VARCHAR(MAX)

	BEGIN TRY
		BEGIN TRAN AsignacionCursos
			
			DECLARE @idUser UNIQUEIDENTIFIER
					,@idTutor UNIQUEIDENTIFIER
					,@creditsRequired INT
					,@creditsUser INT

			IF NOT EXISTS (SELECT 1 FROM proyecto1.Usuarios WHERE Email = @Email)
			BEGIN
				ROLLBACK TRAN AsignacionCursos
				SET @descriptionMessage = CONCAT('ERROR - AsignacionCursos - No existe un usuario con el email ', @Email)

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), @descriptionMessage)

				RETURN 0
			END

			IF NOT EXISTS (SELECT 1 FROM proyecto1.Course WHERE CodCourse = @CodCourse)
			BEGIN
				ROLLBACK TRAN AsignacionCursos
				SET @descriptionMessage = CONCAT('ERROR - AsignacionCursos - No existe un curso con el código ', @CodCourse)

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), @descriptionMessage)

				RETURN 0
			END

			IF @CodCourse < 0 OR @CodCourse IS NULL
			BEGIN
				ROLLBACK TRAN AsignacionCursos
				SET @descriptionMessage = 'ERROR - AsignacionCursos - El código del curso no puede ser negativo ni estar vacío'

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), @descriptionMessage)

				RETURN 0
			END

			SELECT @idUser = Id
			FROM proyecto1.Usuarios
			WHERE Email = @Email

			SELECT @creditsUser = Credits
			FROM proyecto1.ProfileStudent
			WHERE UserId = @idUser

			SELECT @idTutor = TutorId
			FROM proyecto1.CourseTutor
			WHERE CourseCodCourse = @CodCourse

			SELECT @creditsRequired = CreditsRequired
			FROM proyecto1.Course
			WHERE CodCourse = @CodCourse

			IF @creditsUser < @creditsRequired
			BEGIN
				ROLLBACK TRAN AsignacionCursos
				SET @descriptionMessage = CONCAT('ERROR - AsignacionCursos - Créditos insuficientes para poder asignarse al curso con código ', @CodCourse)

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), @descriptionMessage)

				RETURN 0
			END

			IF EXISTS (SELECT 1 FROM proyecto1.CourseAssignment WHERE CourseCodCourse = @CodCourse AND StudentId = @idUser)
			BEGIN
				ROLLBACK TRAN AsignacionCursos
				SET @descriptionMessage = CONCAT('ERROR - AsignacionCursos - Ya existe una asignación al curso con el código ', @CodCourse)

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), @descriptionMessage)

				RETURN 0
			END

			IF @idTutor IS NULL
			BEGIN
				ROLLBACK TRAN AsignacionCursos
				SET @descriptionMessage = CONCAT('ERROR - AsignacionCursos - No existe tutor para impartir el curso con código ', @CodCourse)

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), @descriptionMessage)

				RETURN 0
			END

			INSERT INTO proyecto1.CourseAssignment(StudentId, CourseCodCourse)
			VALUES(@idUser, @CodCourse)

			INSERT INTO proyecto1.Notification(UserId, Message, Date)
			VALUES(@idUser, CONCAT('Se asignó al curso con código ', @CodCourse), GETDATE())

			INSERT INTO proyecto1.Notification(UserId, Message, Date)
			VALUES(@idTutor, CONCAT('Se asignó un estudiante al curso con código ', @CodCourse), GETDATE())

			INSERT INTO proyecto1.HistoryLog(Date, Description)
			VALUES(GETDATE(), 'OK - AsignacionCursos')

			COMMIT TRAN AsignacionCursos
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN AsignacionCursos

		INSERT INTO proyecto1.HistoryLog(Date, Description)
		VALUES(GETDATE(),  CONCAT('ERROR - AsignacionCursos ', ERROR_MESSAGE()))

	END CATCH
END
GO