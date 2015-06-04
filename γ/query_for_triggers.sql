ALTER TABLE Xrewseis_Pelatwn Enable TRIGGER trigger1;
ALTER TABLE Pelatis_Dianomh Enable TRIGGER trigger3;
ALTER TABLE Dianomi Enable TRIGGER trigger2;

-- trigger 1
INSERT INTO Xrewseis_Pelatwn VALUES(1,3,'2014/07/17',4,1);
select * from Dianomi;

-- trigger 2
INSERT INTO Dianomi VALUES(21,8,'2014/06/19','2014/07/01',0);
select * from Diathesimotita;

-- trigger 3
INSERT INTO Pelatis_Dianomh VALUES(12,2);




