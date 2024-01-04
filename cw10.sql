USE AdventureWorks2022;


--Zad1 
BEGIN TRANSACTION;

UPDATE Production.Product
SET ListPrice = ListPrice * 1.10
WHERE ProductID = 680;

COMMIT TRANSACTION;

--zad2
BEGIN TRANSACTION;

DELETE FROM Production.Product
WHERE ProductID = 707;

ROLLBACK TRANSACTION;

--zad3
BEGIN TRANSACTION;
	INSERT INTO Production.Product
	VALUES (	Adjustable Race	AR-5381	0	0	NULL	1000	750	0,00	0,00	NULL	NULL	NULL	NULL	0	NULL	NULL	NULL	NULL	NULL	2008-04-30 00:00:00.000	NULL	NULL	694215B7-08F7-4C0D-ACB1-D734BA44C0C8	2014-02-08 10:01:36.827
)


COMMIT TRANSACTION;

SELECT * 
FROM Production.Product;



--zad4
BEGIN TRANSACTION;
	UPDATE Production.Product
	SET StandardCost = StandardCost *1.1 ;

	DECLARE @koszt DECIMAL(18,2);
	SELECT @koszt = SUM(StandardCost) FROM Production.Product;
	IF @koszt > 5000
	BEGIN 
		ROLLBACK TRANSACTION;
		PRINT 'Suma kosztów przekracza 5000';
	END
	ELSE
	BEGIN
		COMMIT TRANSACTION;
		PRINT 'TRANSAKCJA ZATWIERDZONA';
	END


--zad5
BEGIN TRANSACTION;
	INSERT INTO (	Adjustable Race	AR-5381	0	0	NULL	1000	750	0,00	0,00	NULL	NULL	NULL	NULL	0	NULL	NULL	NULL	NULL	NULL	2008-04-30 00:00:00.000	NULL	NULL	694215B7-08F7-4C0D-ACB1-D734BA44C0C8	2014-02-08 10:01:36.827);


--zad6
BEGIN TRANSACTION;
	UPDATE  Sales.SalesOrderDetail
	SET OrderQty=OrderQty+1;
	IF EXISTS (SELECT 1 FROM Sales.SalesOrderDetail WHERE OrderQty = 0)
	BEGIN
	 ROLLBACK TRANSACTION;
    PRINT 'Liczba usuniêtych produktów przekracza 10.';
	END
	ELSE
	BEGIN
    COMMIT TRANSACTION;
    PRINT 'Transakcja zosta³a zatwierdzona.';
	END
	
--zad7
BEGIN TRANSACTION;
	DECLARE @sredni DECIMAL(18,2);
	SELECT @sredni = AVG(StandardCost)FROM Production.Product;
	DELETE FROM Production.Product
	WHERE @sredni < StandardCost;

	DECLARE @count INT;
	SELECT @count = @@ROWCOUNT;
	IF @count > 10
	BEGIN
	 ROLLBACK TRANSACTION;
    PRINT 'Liczba usuniêtych produktów przekracza 10.';
	END
	ELSE
	BEGIN
    COMMIT TRANSACTION;
    PRINT 'Transakcja zosta³a zatwierdzona.';
	END
	