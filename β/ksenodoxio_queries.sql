-- 1
select Onoma_Proiontos, month(Hmeromhnia_Xrewshs) as mhnas, sum(Aksia_Monadas_Proiontos*Posotita_Proiontos) as sunoliki_aksia
from Proion, Xrewseis_Pelatwn
where Proion.Id_Proiontos = Xrewseis_Pelatwn.Id_Proiontos
group by Onoma_Proiontos, month(Hmeromhnia_Xrewshs);

-- 2
select Onoma_Pelath, Epwnumo_Pelath,DATEDIFF(dd,Hmeromhnia_Enarksis,Hmeromhnia_Lhkshs) as Meres
from Pelatis, Dianomi, Pelatis_Dianomh
where Pelatis.Id_Pelath = Pelatis_Dianomh.Id_Pelath and Dianomi.Id_Dianomis = Pelatis_Dianomh.Id_Dianomis
and DATEDIFF(dd,Hmeromhnia_Enarksis,Hmeromhnia_Lhkshs) = (select max(DATEDIFF(dd,Hmeromhnia_Enarksis,Hmeromhnia_Lhkshs)) from Dianomi)
group by Onoma_Pelath, Epwnumo_Pelath,DATEDIFF(dd,Hmeromhnia_Enarksis,Hmeromhnia_Lhkshs);

-- 3.a
select top 2 Onoma_Proiontos, max(Posotita_Proiontos) as 'max'
from Proion, Xrewseis_Pelatwn
where Proion.Id_Proiontos = Xrewseis_Pelatwn.Id_Proiontos
group by Onoma_Proiontos
order by  max(Posotita_Proiontos)desc;

-- 3.b
select top 2 Onoma_Proiontos, min(Posotita_Proiontos) as 'min'
from Proion, Xrewseis_Pelatwn
where Proion.Id_Proiontos = Xrewseis_Pelatwn.Id_Proiontos
group by Onoma_Proiontos
order by  max(Posotita_Proiontos);

-- 4
select Onoma_Ypallillou, Epwnumo_Ypallillou
from Ypallillos, Xrewseis_Pelatwn, Proion
where Ypallillos.Id_Ypallillou = Xrewseis_Pelatwn.Id_Ypallillou 
and Xrewseis_Pelatwn.Id_Proiontos = Proion.Id_Proiontos 
and Aksia_Monadas_Proiontos*Posotita_Proiontos = 
(select max(Aksia_Monadas_Proiontos*Posotita_Proiontos) 
from Proion, Xrewseis_Pelatwn 
where Xrewseis_Pelatwn.Id_Proiontos = Proion.Id_Proiontos)
group by Onoma_Ypallillou, Epwnumo_Ypallillou;

-- 5
select diam.Arithmos_Dwmatiou, month(diam.Hmeromhnia_Enarksis) as mhnas, round(avg(Xwritikotita_Dwmatiou/t1.menoun),0) as mesos_oros
from Dwmatio as dwm,Dianomi as diam,Pelatis_Dianomh as pel
left join
(
		select Dwmatio.Arithmos_Dwmatiou,count(Dwmatio.Arithmos_Dwmatiou) as menoun from Dianomi, Dwmatio, Pelatis_Dianomh
		where Dianomi.Arithmos_Dwmatiou = Dwmatio.Arithmos_Dwmatiou and Pelatis_Dianomh.Id_Dianomis = Dianomi.Id_Dianomis 
		group by Dwmatio.Arithmos_Dwmatiou
) t1 on t1.Arithmos_Dwmatiou = Arithmos_Dwmatiou
where pel.Id_Dianomis = diam.Id_Dianomis and diam.Arithmos_Dwmatiou = dwm.Arithmos_Dwmatiou
group by diam.Arithmos_Dwmatiou,month(diam.Hmeromhnia_Enarksis);

