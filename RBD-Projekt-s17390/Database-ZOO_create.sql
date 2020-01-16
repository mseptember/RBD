-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2018-06-14 13:26:58.25

-- tables
-- Table: Choroby
CREATE TABLE Choroby (
    IdChoroby integer  NOT NULL,
    NazwaChoroby varchar2(50)  NOT NULL,
    CONSTRAINT Choroby_pk PRIMARY KEY (IdChoroby)
) ;

-- Table: ChorobyZwierzat
CREATE TABLE ChorobyZwierzat (
    IdZwierzecia integer  NOT NULL,
    IdChoroby integer  NOT NULL,
    DataOd date  NOT NULL,
    DataDo date  NOT NULL,
    CONSTRAINT ChorobyZwierzat_pk PRIMARY KEY (IdZwierzecia,IdChoroby)
) ;

-- Table: Gatunki
CREATE TABLE Gatunki (
    IdGatunku integer  NOT NULL,
    NazwaG varchar2(30)  NOT NULL,
    CONSTRAINT Gatunki_pk PRIMARY KEY (IdGatunku)
) ;

-- Table: Jedzenie
CREATE TABLE Jedzenie (
    IdJedzenia integer  NOT NULL,
    NazwaJedzenia varchar2(30)  NOT NULL,
    CONSTRAINT Jedzenie_pk PRIMARY KEY (IdJedzenia)
) ;

-- Table: Karmienie
CREATE TABLE Karmienie (
    IdJedzenia integer  NOT NULL,
    GodzinaKarmienia date  NOT NULL,
    IdZwierzecia integer  NOT NULL,
    Ilosc integer  NOT NULL,
    CONSTRAINT Karmienie_pk PRIMARY KEY (IdJedzenia,IdZwierzecia)
) ;

-- Table: Klatki
CREATE TABLE Klatki (
    IdKlatki integer  NOT NULL,
    IdSektora integer  NOT NULL,
    NrKlatki integer  NOT NULL,
    CONSTRAINT Klatki_pk PRIMARY KEY (IdKlatki)
) ;

-- Table: Pracownicy
CREATE TABLE Pracownicy (
    IdPracownika integer  NOT NULL,
    ImieP varchar2(30)  NOT NULL,
    NazwiskoP varchar2(30)  NOT NULL,
    Stanowisko varchar2(30)  NOT NULL,
    DataUrodzeniaP date  NOT NULL,
    PESEL char(11)  NOT NULL,
    CONSTRAINT Pracownicy_pk PRIMARY KEY (IdPracownika)
) ;

-- Table: Sektory
CREATE TABLE Sektory (
    IdSektora integer  NOT NULL,
    NazwaSektora varchar2(30)  NOT NULL,
    CONSTRAINT Sektory_pk PRIMARY KEY (IdSektora)
) ;

-- Table: Sprzatanie
CREATE TABLE Sprzatanie (
    GodzinaSprzatania date  NOT NULL,
    IdKlatki integer  NOT NULL,
    IdPracownika integer  NOT NULL,
    CONSTRAINT Sprzatanie_pk PRIMARY KEY (IdKlatki,IdPracownika)
) ;

-- Table: Zwierzeta
CREATE TABLE Zwierzeta (
    IdZwierzecia integer  NOT NULL,
    ImieZ varchar2(30)  NOT NULL,
    DataUrodzeniaZ date  NULL,
    Pochodzenie varchar2(30)  NULL,
    IdKlatki integer  NOT NULL,
    ImieOjca varchar2(20)  NULL,
    ImieMatki varchar2(20)  NULL,
    IdPracownika integer  NOT NULL,
    IdGatunku integer  NOT NULL,
    CONSTRAINT Zwierzeta_pk PRIMARY KEY (IdZwierzecia)
) ;

-- foreign keys
-- Reference: ChorobyZwierzat_Choroby (table: ChorobyZwierzat)
ALTER TABLE ChorobyZwierzat ADD CONSTRAINT ChorobyZwierzat_Choroby
    FOREIGN KEY (IdChoroby)
    REFERENCES Choroby (IdChoroby);

-- Reference: ChorobyZwierzat_Zwierzeta (table: ChorobyZwierzat)
ALTER TABLE ChorobyZwierzat ADD CONSTRAINT ChorobyZwierzat_Zwierzeta
    FOREIGN KEY (IdZwierzecia)
    REFERENCES Zwierzeta (IdZwierzecia);

-- Reference: Karmienie_Jedzenie (table: Karmienie)
ALTER TABLE Karmienie ADD CONSTRAINT Karmienie_Jedzenie
    FOREIGN KEY (IdJedzenia)
    REFERENCES Jedzenie (IdJedzenia);

-- Reference: Karmienie_Zwierzeta (table: Karmienie)
ALTER TABLE Karmienie ADD CONSTRAINT Karmienie_Zwierzeta
    FOREIGN KEY (IdZwierzecia)
    REFERENCES Zwierzeta (IdZwierzecia);

-- Reference: Klatki_Sektory (table: Klatki)
ALTER TABLE Klatki ADD CONSTRAINT Klatki_Sektory
    FOREIGN KEY (IdSektora)
    REFERENCES Sektory (IdSektora);

-- Reference: Sprzatanie_Klatki (table: Sprzatanie)
ALTER TABLE Sprzatanie ADD CONSTRAINT Sprzatanie_Klatki
    FOREIGN KEY (IdKlatki)
    REFERENCES Klatki (IdKlatki);

-- Reference: Sprzatanie_Pracownicy (table: Sprzatanie)
ALTER TABLE Sprzatanie ADD CONSTRAINT Sprzatanie_Pracownicy
    FOREIGN KEY (IdPracownika)
    REFERENCES Pracownicy (IdPracownika);

-- Reference: Zwierzeta_Gatunki (table: Zwierzeta)
ALTER TABLE Zwierzeta ADD CONSTRAINT Zwierzeta_Gatunki
    FOREIGN KEY (IdGatunku)
    REFERENCES Gatunki (IdGatunku);

-- Reference: Zwierzeta_Klatki (table: Zwierzeta)
ALTER TABLE Zwierzeta ADD CONSTRAINT Zwierzeta_Klatki
    FOREIGN KEY (IdKlatki)
    REFERENCES Klatki (IdKlatki);

-- Reference: Zwierzeta_Pracownicy (table: Zwierzeta)
ALTER TABLE Zwierzeta ADD CONSTRAINT Zwierzeta_Pracownicy
    FOREIGN KEY (IdPracownika)
    REFERENCES Pracownicy (IdPracownika);

-- End of file.

