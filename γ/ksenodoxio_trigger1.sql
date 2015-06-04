CREATE TRIGGER trigger1 ON [Xrewseis_Pelatwn]
FOR INSERT
AS

declare @Id_Proiontos numeric;
declare @Id_Pelath numeric;
declare @Posotita numeric;
declare @hmeromhnia datetime;
declare @Id_Ypallillou numeric;
declare @Id_Dianomi numeric;
declare @timi numeric;
declare @aksia_Dianomis numeric;

select @Id_Proiontos = i.Id_Proiontos from inserted i;
select @Id_Pelath = i.Id_Pelath from inserted i;
select @Posotita = i.Posotita_Proiontos from inserted i;
select @hmeromhnia = i.Hmeromhnia_Xrewshs from inserted i;
select @Id_Ypallillou = i.Id_Ypallillou from inserted i;
select @Id_Dianomi = Id_Dianomis from Pelatis_Dianomh where Pelatis_Dianomh.Id_Pelath = @Id_Pelath;
select @aksia_Dianomis = Askia_Dianomis from Dianomi where Dianomi.Id_Dianomis = @Id_Dianomi;
select @timi = Aksia_Monadas_Proiontos from Proion where Proion.Id_Proiontos = @Id_Proiontos;

update Dianomi set Askia_Dianomis = (@aksia_Dianomis + (@timi * @Posotita))
where Id_Dianomis =  @Id_Dianomi;

PRINT 'h aksia dianomis tropopoihthike.'

GO