-------------------------------------------------------------------------
-- Laboratorio Sistemas de Bases 2
-- Escuela de Vacaciones Primer Semestre 2024
-- Grupo 26
-- Function Func_logger
-------------------------------------------------------------------------
USE BD2;
GO

CREATE FUNCTION proyecto1.F4()
RETURNS TABLE
AS
RETURN
(
    SELECT h.Id, h.Date, h.Description
    FROM proyecto1.HistoryLog h
);
GO

-- Llamar funcion
USE BD2;
GO

SELECT * FROM proyecto1.F4();
GO