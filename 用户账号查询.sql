DECLARE @yhcode VARCHAR(100) 
SELECT @yhcode='000'
SELECT * FROM [BS3000+_SYSTEM].dbo.SM_User WHERE vusercode IN (@yhcode)