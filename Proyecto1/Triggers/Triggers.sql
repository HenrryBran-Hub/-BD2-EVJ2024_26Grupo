use BD2;
go

-- Course
CREATE TRIGGER tgr_Course
ON [proyecto1].[Course]
AFTER insert, update, delete

as 
begin
	DECLARE  @Operacion varchar(20);
	DECLARE  @Descripcion varchar(100);
	Declare  @tabla varchar(20);
	set @tabla ='[proyecto1].[Course]';

	-- Tipo de operación
	IF EXISTS (Select * from inserted)
		set @Operacion ='INSERT';
	else IF EXISTS (Select * from deleted)
		set @Operacion ='DELETE';
	else
		set @Operacion ='UPDATE';

	Set @Descripcion = 'Tabla:'+ @tabla +' Operacion: '+ @Operacion + ' Exitosa';
	INSERT INTO proyecto1.HistoryLog(Date,Description) 
	values (GETDATE(),@Descripcion);
end;
Go

-- CourseAssignment
CREATE TRIGGER tgr_CourseAssignment
ON [proyecto1].[CourseAssignment]
AFTER insert, update, delete

as 
begin
	DECLARE  @Operacion varchar(20);
	DECLARE  @Descripcion varchar(100);
	Declare  @tabla varchar(20);
	set @tabla ='[proyecto1].[CourseAssignment]';

	-- Tipo de operación
	IF EXISTS (Select * from inserted)
		set @Operacion ='INSERT';
	else IF EXISTS (Select * from deleted)
		set @Operacion ='DELETE';
	else
		set @Operacion ='UPDATE';

	Set @Descripcion = 'Tabla:'+ @tabla +' Operacion: '+ @Operacion + ' Exitosa';
	INSERT INTO proyecto1.HistoryLog(Date,Description) 
	values (GETDATE(),@Descripcion);
end;
go

-- CourseTutor
CREATE TRIGGER tgr_CourseTutor
ON [proyecto1].[CourseTutor]
AFTER insert, update, delete

as 
begin
	DECLARE  @Operacion varchar(20);
	DECLARE  @Descripcion varchar(100);
	Declare  @tabla varchar(20);
	set @tabla ='[proyecto1].[CourseTutor]';

	-- Tipo de operación
	IF EXISTS (Select * from inserted)
		set @Operacion ='INSERT';
	else IF EXISTS (Select * from deleted)
		set @Operacion ='DELETE';
	else
		set @Operacion ='UPDATE';

	Set @Descripcion = 'Tabla:'+ @tabla +' Operacion: '+ @Operacion + ' Exitosa';
	INSERT INTO proyecto1.HistoryLog(Date,Description) 
	values (GETDATE(),@Descripcion);
end;
Go


-- HistoryLog  ESTA NO APLICA
--CREATE TRIGGER tgr_HistoryLog
--ON [proyecto1].[HistoryLog]
--AFTER insert, update, delete

--as 
--begin
--	DECLARE  @Operacion varchar(20);
--	DECLARE  @Descripcion varchar(100);
--	Declare  @tabla varchar(20);
--	set @tabla ='[proyecto1].[HistoryLog]';

--	-- Tipo de operación
--	IF EXISTS (Select * from inserted)
--		set @Operacion ='INSERT';
--	else IF EXISTS (Select * from deleted)
--		set @Operacion ='DELETE';
--	else
--		set @Operacion ='UPDATE';

--	Set @Descripcion = 'Tabla:'+ @tabla +' Operacion: '+ @Operacion + ' Exitosa';
--	INSERT INTO proyecto1.HistoryLog(Date,Description) 
--	values (GETDATE(),@Descripcion);
--end;
--Go


-- Notification
CREATE TRIGGER tgr_Notification
ON [proyecto1].[Notification]
AFTER insert, update, delete

as 
begin
	DECLARE  @Operacion varchar(20);
	DECLARE  @Descripcion varchar(100);
	Declare  @tabla varchar(20);
	set @tabla ='[proyecto1].[Notification]';

	-- Tipo de operación
	IF EXISTS (Select * from inserted)
		set @Operacion ='INSERT';
	else IF EXISTS (Select * from deleted)
		set @Operacion ='DELETE';
	else
		set @Operacion ='UPDATE';

	Set @Descripcion = 'Tabla:'+ @tabla +' Operacion: '+ @Operacion + ' Exitosa';
	INSERT INTO proyecto1.HistoryLog(Date,Description) 
	values (GETDATE(),@Descripcion);
end;
Go


-- ProfileStudent
CREATE TRIGGER tgr_ProfileStudent
ON [proyecto1].[ProfileStudent]
AFTER insert, update, delete

as 
begin
	DECLARE  @Operacion varchar(20);
	DECLARE  @Descripcion varchar(100);
	Declare  @tabla varchar(20);
	set @tabla ='[proyecto1].[ProfileStudent]';

	-- Tipo de operación
	IF EXISTS (Select * from inserted)
		set @Operacion ='INSERT';
	else IF EXISTS (Select * from deleted)
		set @Operacion ='DELETE';
	else
		set @Operacion ='UPDATE';

	Set @Descripcion = 'Tabla:'+ @tabla +' Operacion: '+ @Operacion + ' Exitosa';
	INSERT INTO proyecto1.HistoryLog(Date,Description) 
	values (GETDATE(),@Descripcion);
end;
Go


-- Roles
CREATE TRIGGER tgr_Roles
ON [proyecto1].[Roles]
AFTER insert, update, delete

as 
begin
	DECLARE  @Operacion varchar(20);
	DECLARE  @Descripcion varchar(100);
	Declare  @tabla varchar(20);
	set @tabla ='[proyecto1].[Roles]';

	-- Tipo de operación
	IF EXISTS (Select * from inserted)
		set @Operacion ='INSERT';
	else IF EXISTS (Select * from deleted)
		set @Operacion ='DELETE';
	else
		set @Operacion ='UPDATE';

	Set @Descripcion = 'Tabla:'+ @tabla +' Operacion: '+ @Operacion + ' Exitosa';
	INSERT INTO proyecto1.HistoryLog(Date,Description) 
	values (GETDATE(),@Descripcion);
end;
Go


-- TFA
CREATE TRIGGER tgr_TFA
ON [proyecto1].[TFA]
AFTER insert, update, delete

as 
begin
	DECLARE  @Operacion varchar(20);
	DECLARE  @Descripcion varchar(100);
	Declare  @tabla varchar(20);
	set @tabla ='[proyecto1].[TFA]';

	-- Tipo de operación
	IF EXISTS (Select * from inserted)
		set @Operacion ='INSERT';
	else IF EXISTS (Select * from deleted)
		set @Operacion ='DELETE';
	else
		set @Operacion ='UPDATE';

	Set @Descripcion = 'Tabla:'+ @tabla +' Operacion: '+ @Operacion + ' Exitosa';
	INSERT INTO proyecto1.HistoryLog(Date,Description) 
	values (GETDATE(),@Descripcion);
end;
Go



-- TutorProfile
CREATE TRIGGER tgr_TutorProfile
ON [proyecto1].[TutorProfile]
AFTER insert, update, delete

as 
begin
	DECLARE  @Operacion varchar(20);
	DECLARE  @Descripcion varchar(100);
	Declare  @tabla varchar(20);
	set @tabla ='[proyecto1].[TutorProfile]';

	-- Tipo de operación
	IF EXISTS (Select * from inserted)
		set @Operacion ='INSERT';
	else IF EXISTS (Select * from deleted)
		set @Operacion ='DELETE';
	else
		set @Operacion ='UPDATE';

	Set @Descripcion = 'Tabla:'+ @tabla +' Operacion: '+ @Operacion + ' Exitosa';
	INSERT INTO proyecto1.HistoryLog(Date,Description) 
	values (GETDATE(),@Descripcion);
end;
Go



-- UsuarioRole
CREATE TRIGGER tgr_UsuarioRole
ON [proyecto1].[UsuarioRole]
AFTER insert, update, delete

as 
begin
	DECLARE  @Operacion varchar(20);
	DECLARE  @Descripcion varchar(100);
	Declare  @tabla varchar(20);
	set @tabla ='[proyecto1].[UsuarioRole]';

	-- Tipo de operación
	IF EXISTS (Select * from inserted)
		set @Operacion ='INSERT';
	else IF EXISTS (Select * from deleted)
		set @Operacion ='DELETE';
	else
		set @Operacion ='UPDATE';

	Set @Descripcion = 'Tabla:'+ @tabla +' Operacion: '+ @Operacion + ' Exitosa';
	INSERT INTO proyecto1.HistoryLog(Date,Description) 
	values (GETDATE(),@Descripcion);
end;
Go

-- Usuarios
CREATE TRIGGER tgr_Usuarios
ON [proyecto1].[Usuarios]
AFTER insert, update, delete

as 
begin
	DECLARE  @Operacion varchar(20);
	DECLARE  @Descripcion varchar(100);
	Declare  @tabla varchar(20);
	set @tabla ='[proyecto1].[Usuarios]';

	-- Tipo de operación
	IF EXISTS (Select * from inserted)
		set @Operacion ='INSERT';
	else IF EXISTS (Select * from deleted)
		set @Operacion ='DELETE';
	else
		set @Operacion ='UPDATE';

	Set @Descripcion = 'Tabla:'+ @tabla +' Operacion: '+ @Operacion + ' Exitosa';
	INSERT INTO proyecto1.HistoryLog(Date,Description) 
	values (GETDATE(),@Descripcion);
end;
Go