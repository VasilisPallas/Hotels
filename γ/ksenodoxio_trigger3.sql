CREATE TRIGGER trigger3 ON [Pelatis_Dianomh] 
INSTEAD OF INSERT
AS

declare @Id_Dianomis numeric;
declare @Id_Pelath numeric;

select @Id_Dianomis = i.Id_Dianomis from inserted i;
select @Id_Pelath = i.Id_Pelath from inserted i;

declare @room numeric;
select @room = Dwmatio.Arithmos_Dwmatiou from Dwmatio, Dianomi where Dianomi.Id_Dianomis = @Id_Dianomis and Dwmatio.Arithmos_Dwmatiou = Dianomi.Arithmos_Dwmatiou;


declare @pelates numeric;
select @pelates = count(Dwmatio.Arithmos_Dwmatiou) from Dianomi, Dwmatio, Pelatis_Dianomh
where Dianomi.Arithmos_Dwmatiou = Dwmatio.Arithmos_Dwmatiou and Pelatis_Dianomh.Id_Dianomis = Dianomi.Id_Dianomis  and Dianomi.Arithmos_Dwmatiou = @room
group by Dwmatio.Arithmos_Dwmatiou;

declare @xwritikotita numeric;

select @xwritikotita = Dwmatio.Xwritikotita_Dwmatiou from Dwmatio where Dwmatio.Arithmos_Dwmatiou = @room;

Begin
if(@pelates >= @xwritikotita)
	begin
			RAISERROR('Den mporei na mpei allos pelatis se auto to dwmatio.',16,1);
			ROLLBACK;
	end
else
	begin
		INSERT INTO Pelatis_Dianomh VALUES(@Id_Dianomis,@Id_Pelath);
	end
end

GO