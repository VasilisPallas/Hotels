CREATE DATABASE ksenodoxio;

CREATE TABLE Pelatis(
Id_Pelath NUMERIC NOT NULL,
-- Το ΑΦΜ του πελάτη θα πρέπει να είναι μοναδικό
AFM_Pelath NUMERIC(9) UNIQUE  NOT NULL,
Onoma_Pelath CHAR(20) NOT NULL,
Epwnumo_Pelath CHAR(25) NOT NULL,
Fylo_Pelath CHAR(1),
Hm_Gennhshs_Pelath DATE NOT NULL,
Dieuthunsi_Pelath CHAR(40) NOT NULL,
-- Το τηλέφωνο του πελάτη θα πρέπει να είναι μοναδικό
Thlephwno_Pelath CHAR(10) UNIQUE,
CONSTRAINT Pelatis_Primary_Key PRIMARY KEY (Id_Pelath));

CREATE TABLE Ypallillos(
Id_Ypallillou NUMERIC NOT NULL,
Onoma_Ypallillou CHAR(20) NOT NULL,
Epwnumo_Ypallillou CHAR(25) NOT NULL,
Eidikotita_Ypallilou CHAR(20) NOT NULL,
Dieuthunsi_Ypallillou CHAR(40) NOT NULL,
-- Το τηλέφωνο του υπαλλήλου θα πρέπει να είναι μοναδικό
Thlephwno_Ypallillou CHAR(10) UNIQUE NOT NULL,
CONSTRAINT Ypallillos_Primary_Key PRIMARY KEY (Id_Ypallillou));

CREATE TABLE Dwmatio(
Arithmos_Dwmatiou NUMERIC NOT NULL,
Xwritikotita_Dwmatiou NUMERIC(1) NOT NULL,
Katigoria_Dwmatiou NUMERIC(1) NOT NULL,
CONSTRAINT Dwmatio_Primary_Key PRIMARY KEY (Arithmos_Dwmatiou));

CREATE TABLE Dianomi(
Id_Dianomis NUMERIC NOT NULL,
Arithmos_Dwmatiou NUMERIC NOT NULL,
Hmeromhnia_Enarksis DATE NOT NULL,
Hmeromhnia_Lhkshs DATE NOT NULL,
-- Αν δεν γίνει εισαγωγή της αξίας διαμονής θα παίρνει ως προεπιλεγμένη τιμή το 0
Askia_Dianomis NUMERIC DEFAULT 0,
CONSTRAINT Dianomi_Foreign_Key FOREIGN KEY (Arithmos_Dwmatiou) REFERENCES Dwmatio (Arithmos_Dwmatiou),
CONSTRAINT Dianomi_Primary_Key PRIMARY KEY (Id_Dianomis));

CREATE TABLE Pelatis_Dianomh(
Id_Dianomis NUMERIC NOT NULL,
Id_Pelath NUMERIC NOT NULL,
CONSTRAINT DianomiP_Foreign_Key FOREIGN KEY (Id_Dianomis) REFERENCES Dianomi (Id_Dianomis),
CONSTRAINT PelatisD_Foreign_Key FOREIGN KEY (Id_Pelath) REFERENCES Pelatis (Id_Pelath),
CONSTRAINT Pelatis_Dianomh_Primary_Key PRIMARY KEY (Id_Dianomis,Id_Pelath));

CREATE TABLE Proion(
Id_Proiontos NUMERIC NOT NULL,
Onoma_Proiontos CHAR(40) NOT NULL,
Aksia_Monadas_Proiontos NUMERIC NOT NULL,
CONSTRAINT Proion_Primary_Key PRIMARY KEY (Id_Proiontos));

CREATE TABLE Xrewseis_Pelatwn(
Id_Pelath NUMERIC NOT NULL,
Id_Proiontos NUMERIC NOT NULL,
Hmeromhnia_Xrewshs DATETIME NOT NULL,
Id_Ypallillou NUMERIC NOT NULL,
-- Αν δεν γίνει εισαγωγή της ποσότητα του προϊόντος θα παίρνει ως προεπιλεγμένη τιμή το 0
Posotita_Proiontos NUMERIC DEFAULT 1,
CONSTRAINT Xrewseis_Pelati_Foreign_Key FOREIGN KEY (Id_Pelath) REFERENCES Pelatis (Id_Pelath),
CONSTRAINT Xrewseis_Proiontos_Foreign_Key FOREIGN KEY (Id_Proiontos) REFERENCES Proion (Id_Proiontos),
CONSTRAINT Xrewseis_Ypallilos_Foreign_Key FOREIGN KEY (Id_Ypallillou) REFERENCES Ypallillos (Id_Ypallillou),
CONSTRAINT Xrewseis_Pelatwn_Primary_Key PRIMARY KEY (Id_Pelath,Id_Proiontos,Id_Ypallillou));

CREATE TABLE Diathesimotita(
-- Το Id θα είναι AUTO INCREMENT
Id_Eggrafhs NUMERIC NOT NULL IDENTITY(1,1),
Sunolikos_Arithmos_Dwmatiwn NUMERIC NOT NULL,
Diathesimos_Arithmos_Dwmatiwn NUMERIC NOT NULL,
Plhrothta FLOAT NOT NULL,
CONSTRAINT Diathesimotita_Primary_Key PRIMARY KEY (Id_Eggrafhs));