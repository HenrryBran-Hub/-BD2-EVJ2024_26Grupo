
CREATE OR ALTER PROCEDURE proyecto1.PR4
(
	@RoleName NVARCHAR(MAX)
)
AS
BEGIN
	DECLARE @descriptionMessage VARCHAR(MAX)

	BEGIN TRY
		BEGIN TRAN CreacionRoles

			IF EXISTS (SELECT 1 FROM proyecto1.Roles WHERE RoleName = @RoleName)
			BEGIN
				ROLLBACK TRAN CreacionRoles
				SET @descriptionMessage = CONCAT('ERROR - CreacionRoles - Ya existe un rol con el nombre ', @RoleName)

				INSERT INTO proyecto1.HistoryLog(Date, Description)
				VALUES(GETDATE(), @descriptionMessage)

				RETURN 0
			END

			INSERT INTO proyecto1.Roles(Id, RoleName)
			VALUES(NEWID(), @RoleName)

			INSERT INTO proyecto1.HistoryLog(Date, Description)
			VALUES(GETDATE(), 'OK - CreacionRoles')
			
			COMMIT TRAN CreacionRoles
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN CreacionRoles

		INSERT INTO proyecto1.HistoryLog(Date, Description)
		VALUES(GETDATE(),  CONCAT('ERROR - CreacionRoles ', ERROR_MESSAGE()))
	END CATCH
END
GO