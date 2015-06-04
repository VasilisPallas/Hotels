CREATE TRIGGER trigger2 ON [Dianomi] 
FOR INSERT
AS

declare @Diathesimos_Arithmos_Dwmatiwn numeric;
declare @id numeric;

select @Diathesimos_Arithmos_Dwmatiwn = Diathesimos_Arithmos_Dwmatiwn from Diathesimotita;
select @id = Id_Eggrafhs from Diathesimotita;

update Diathesimotita
	set Sunolikos_Arithmos_Dwmatiwn = 30, Diathesimos_Arithmos_Dwmatiwn = (@Diathesimos_Arithmos_Dwmatiwn + 1), Plhrothta = (((@Diathesimos_Arithmos_Dwmatiwn +1)/30)*100)
	where Id_Eggrafhs = @id;

	PRINT 'H plhrotita enhmerwthike.'

GO