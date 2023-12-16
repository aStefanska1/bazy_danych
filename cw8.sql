USE AdventureWorks2022;
--zad1
GO
CREATE PROCEDURE GenerateFibonacciSequence1
    @n INT
AS
BEGIN
    DECLARE @counter INT = 1;

    WHILE @counter <= @n
    BEGIN
        PRINT dbo.Fibonacci1(@counter);
        SET @counter = @counter + 1;
    END
END;
GO

CREATE FUNCTION Fibonacci1
(
    @n INT
)
RETURNS INT
AS
BEGIN
    DECLARE @result INT;

    IF @n <= 1
        SET @result = @n;
    ELSE
        SET @result = dbo.Fibonacci1(@n - 1) + dbo.Fibonacci1(@n - 2);

    RETURN @result;
END;
GO
EXEC GenerateFibonacciSequence @n = 12;  --execute

--zad2
CREATE TRIGGER ModifyLastName
ON Person.Person
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE p
    SET LastName = UPPER(i.LastName)
    FROM Persons p
    INNER JOIN inserted i ON p.PersonID = i.PersonID;
END;

--zad3
CREATE TRIGGER  taxRateMonitoring
ON Person.Person
AFTER UPDATE
AS
BEGIN
	DECLARE @OldTaxRate DECIMAL(18, 2);
    DECLARE @NewTaxRate DECIMAL(18, 2);

    SELECT @OldTaxRate = TaxRate
    FROM deleted;--tabela tymczasowa

    SELECT @NewTaxRate = TaxRate
    FROM inserted;--tabela tymczasowa

    IF ABS(@NewTaxRate - @OldTaxRate) / NULLIF(@OldTaxRate, 0) > 0.3
    BEGIN
        RAISERROR ('Zmiana wartoœci w polu TaxRate o wiêcej ni¿ 30% jest niedozwolona.', 16, 1);
        
	END;
END;