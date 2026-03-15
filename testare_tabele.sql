-- Afisare stocuri de produse pentru fiecare farmacie, inclusiv producatorul  --
SELECT f.denumire || ' ' || f.oras || ' ' || f.adresa AS "Farmacie", p.denumire AS "Produs", pr.producator, s.cantitate 
FROM farmacii f
JOIN stocuri s ON f.id_f = s.id_f
JOIN produse p ON s.id_p = p.id_p
JOIN prospecte pr ON p.id_p = pr.id_p
ORDER BY f.oras, f.denumire; 

-- Afisarea vanzarilor detaliata, ce produse au fost vandute si cate --

SELECT v.data_vanzare, f.denumire || ' ' || f.oras AS "Farmacie", c.nume || ' ' || c.prenume AS "Client",
p.denumire AS "Produs", d.cantitate, p.pret AS "Pret unitar", NVL(r.cod_unic, 'Fara reteta') AS "Reteta"
FROM vanzari v
JOIN detalii_vanzari d ON v.id_v = d.id_v
JOIN produse p ON d.id_p = p.id_p
JOIN farmacii f ON v.id_f = f.id_f
JOIN clienti c ON v.id_c = c.id_c
LEFT JOIN retete r ON d.id_r = r.id_r 
ORDER BY v.data_vanzare DESC;

-- Afisare total plata la fiecare vanzare --

SELECT v.id_v, v.data_vanzare, f.denumire || ' ' || f.oras AS "Farmacie", c.nume || ' ' || c.prenume AS "Client", SUM(d.cantitate * p.pret) AS "Total de plata"
FROM vanzari v
JOIN detalii_vanzari d ON v.id_v = d.id_v
JOIN produse p ON d.id_p = p.id_p
JOIN farmacii f ON v.id_f = f.id_f
JOIN clienti c ON v.id_c = c.id_c
GROUP BY v.id_v, v.data_vanzare, f.denumire, f.oras, c.nume, c.prenume
ORDER BY v.id_v;

-- Afisarea medicilor care au emis retete si cu clientii corespunzatori--

SELECT  m.nume || ' ' || m.prenume AS "Medic", m.specializare AS "Specializare", r.cod_unic AS "Cod Reteta Emisa", 
TO_CHAR(r.data_emitere, 'DD.MM.YYYY') AS "Data Emitere", c.nume || ' ' || c.prenume AS "Client"
FROM retete r
JOIN medici m ON r.id_m = m.id_m
JOIN clienti c ON r.id_c = c.id_c
ORDER BY m.nume, r.data_emitere DESC;

--Afisare produselor care necesita reteta, codul retetei si medicul care a emis-o
SELECT p.denumire AS "Produs", m.nume || ' ' || m.prenume AS "Medic", r.cod_unic AS "Reteta"
FROM produse p
JOIN detalii_retete dr ON p.id_p = dr.id_p
JOIN retete r ON dr.id_r = r.id_r
JOIN medici m ON r.id_m = m.id_m
WHERE p.necesita_reteta = 'DA'
ORDER BY p.denumire;

--Afisarea detaliata a retetelor (medicul care a emis-o, carui client ii apartine si cantitatea pentru fiecare produs din reteta)

SELECT r.cod_unic AS "Cod unic reteta", TO_CHAR(r.data_emitere, 'DD.MM.YYYY'), TO_CHAR(r.data_expirare, 'DD.MM.YYYY'), 
m.nume || ' ' || m.prenume AS medic, m.specializare, c.nume || ' ' || c.prenume AS pacient, c.cnp,
p.denumire AS produs, dr.cantitate
FROM retete r
JOIN medici m ON r.id_m = m.id_m
JOIN clienti c ON r.id_c = c.id_c
JOIN detalii_retete dr ON r.id_r = dr.id_r
JOIN produse p ON dr.id_p = p.id_p
ORDER BY r.data_emitere DESC;

--Afisarea detaliata a produselor, impreuna cu prospectul sau

SELECT p.denumire AS "Produs", pr.descriere, pr.producator, p.pret, p.necesita_reteta AS "Necesita reteta", 
TO_CHAR(p.data_expirare, 'DD.MM.YYYY') AS "Data expirare"
FROM produse p
JOIN prospecte pr ON p.id_p = pr.id_p
ORDER BY p.denumire;

--VALIDARE LA ADAUGARE/MODIFICARE/STERGERE

--ADAUGARE

--Incerc sa inserez o farmacie cu un id care exista deja - Testare Primary Key - id_f
INSERT INTO farmacii(id_f, denumire, oras, adresa, telefon)
VALUES (1, 'Farmacia Test', 'Iasi', 'Strada Principala', '0732656352');
--Eroare: ORA-00001: unique constraint (RO_A285_SQL_S40.FARMACII_PK) violated ORA-06512: at "SYS.DBMS_SQL", line 1721

--Incerc sa inserez un medic cu un cod_parafa care exista deja - Testare Unique Key - cod_parafa medic
INSERT INTO medici (nume, prenume, cod_parafa, specializare) 
VALUES ('Popa', 'Ion', 'M245A1', 'Generalist');
--Eroare: ORA-00001: unique constraint (RO_A285_SQL_S40.MEDICI_COD_PARAFA_UK) violated ORA-06512: at "SYS.DBMS_SQL", line 1721

--Incerc sa inregistrez un client nou cu email-ul unui client existent - Testare Unique Key - email client
INSERT INTO clienti(nume, prenume, cnp, email)
VALUES ('Tudorache', 'Mihail', '1683647296010', 'andrei.popescu80@gmail.com');
--Eroare: ORA-00001: unique constraint (RO_A285_SQL_S40.CLIENTI_EMAIL_UK) violated ORA-06512: at "SYS.DBMS_SQL", line 1721

--Incerc sa inregistrez un client nou cu cnp-ul unui client existent - Testare Unique Key - cnp client
INSERT INTO clienti(nume, prenume, cnp)
VALUES ('Pavel', 'Stefania', '1992051523457');
--Eroare: ORA-00001: unique constraint (RO_A285_SQL_S40.CLIENTI_CNP_UK) violated ORA-06512: at "SYS.DBMS_SQL", line 1721

--Incerc sa inserez un produs fara denumire - Testare Not NUll - denumire produs
INSERT INTO produse (pret, necesita_reteta)
VALUES (37.5, 'NU');
--Eroare: ORA-01400: cannot insert NULL into ("RO_A285_SQL_S40"."PRODUSE"."DENUMIRE") ORA-06512: at "SYS.DBMS_SQL", line 1721

--Incerc sa inserez un client cu un email invalid - Testare Check - email client sa respecte forma standard
INSERT INTO clienti(nume, prenume, cnp, email)
VALUES ('Sava', 'Denisa', '6083564829110', 'email_invalid');
--Eroare: ORA-02290: check constraint (RO_A285_SQL_S40.CLIENTI_EMAIL_CK) violated ORA-06512: at "SYS.DBMS_SQL", line 1721

--Incerc sa inserez un medic cu cifre in nume - Testare Check - numele nu trebuie sa contina cifre
INSERT INTO medici (nume, prenume, cod_parafa, specializare) 
VALUES ('Apostolache2', 'Ion', 'A63862', 'Generalist');
--Eroare: ORA-02290: check constraint (RO_A285_SQL_S40.PRODUSE_PRET_CK) violated ORA-06512: at "SYS.DBMS_SQL", line 1721

--Incerc sa inserez un client cu cnp-ul mai mic de 13 cifre si contine si litere - Testare Check - cnp-ul trebuie sa contina 13 cifre
INSERT INTO clienti(nume, prenume, cnp, email)
VALUES ('Luca', 'Vlad', '60gdg373', 'luca.vlad@yahoo.com');
--Eroare: ORA-02290: check constraint (RO_A285_SQL_S40.CLIENTI_CNP_CK) violated ORA-06512: at "SYS.DBMS_SQL", line 1721

--Incerc sa inserez un medic cu un cod parafa ce contine simboluri - Testare Check - cod_parafa permite doar litere si cifre
INSERT INTO medici (nume, prenume, cod_parafa, specializare) 
VALUES ('Miron', 'Dan', '78M@32', 'Ortoped');
--Eroare: ORA-02290: check constraint (RO_A285_SQL_S40.MEDICI_COD_PARAFA_CK) violated ORA-06512: at "SYS.DBMS_SQL", line 1721

--Incerc sa inserez un produs cu un pret negativ - Testare Check - pretul produsul trebuie sa fie intre 0 si 10000
INSERT INTO produse (denumire, pret, necesita_reteta)
VALUES ('Plantusin', -29, 'NU');
--Eroare: ORA-02290: check constraint (RO_A285_SQL_S40.PRODUSE_PRET_CK) violated ORA-06512: at "SYS.DBMS_SQL", line 1721

--Incerc sa adaug un stoc pentru o farmacie care nu exista - Testare Foreign Key 
INSERT INTO stocuri (id_f, id_p, cantitate)
VALUES (999, (SELECT id_p FROM produse WHERE denumire='Nurofen'), 10);
--Eroare: ORA-02291: integrity constraint (RO_A285_SQL_S40.STOCURI_FARMACII_FK) violated - parent key not found ORA-06512: at "SYS.DBMS_SQL", line 1721

-- Incerc sa deschid o farmacie "Sensiblu" exact in locul lui "Dr. Max" din Iasi.
INSERT INTO farmacii(denumire, oras, adresa, telefon) VALUES ('Sensiblu', 'Iasi', 'Soseaua Nicolina 15', '0799999999');
--Eroare: ORA-00001: unique constraint (RO_A285_SQL_S40.FARMACII_ORAS_ADRESA_UK) violated ORA-06512: at "SYS.DBMS_SQL", line 1721

--MODIFICARE

-- Incerc sa modific telefonul unui client (Popescu Andrei) cu telefonul altui client existent (Luca Alexandru) - Testare Unique Key - telefon client 
UPDATE clienti 
SET telefon = '0745678901' 
WHERE cnp = '1980101123456'; 
-- Eroare: ORA-00001: unique constraint (RO_A285_SQL_S40.CLIENTI_TELEFON_UK) violated ORA-06512: at "SYS.DBMS_SQL", line 1721

-- Incercam sa modificam pretul unui produs (Augmentin) sa fie mai mare decat limita admisa (10000) sau negativ - Testare Check - pret produs
UPDATE produse 
SET pret = 15000 
WHERE denumire = 'Augmentin';
--Eroare: ORA-01438: value larger than specified precision allowed for this column ORA-06512: at "SYS.DBMS_SQL", line 1721

-- Incerc sa modific o vanzare astfel incat cantitatea vanduta sa fie 0 sau negativa - Testare Chech - cantitate detalii_vanzari
UPDATE detalii_vanzari 
SET cantitate = 0 
WHERE id_v = 100;
--Eroare: ORA-02290: check constraint (RO_A285_SQL_S40.DETALII_VANZARI_CANTITATE_CK) violated ORA-06512: at "SYS.DBMS_SQL", line 1721

-- Incerc sa schimb necesita_reteta cu un parametru care nu este inclus in lista (DA, NU, da, nu) - Testare Check - necesita_reteta produse
UPDATE produse 
SET necesita_reteta = 'X' 
WHERE denumire = 'Nurofen';
--Eroare: ORA-02290: check constraint (RO_A285_SQL_S40.PRODUSE_NECESITA_RETETA_CK) violated ORA-06512: at "SYS.DBMS_SQL", line 1721

-- Incerc sa sterg CNP-ul unui client existent (setandu-l NULL) - Testare Not Null - cnp client
UPDATE clienti 
SET cnp = NULL 
WHERE nume = 'Popescu';
--Eroare: ORA-01407: cannot update ("RO_A285_SQL_S40"."CLIENTI"."CNP") to NULL ORA-06512: at "SYS.DBMS_SQL", line 1721

-- Incerc sa mut o vanzare existenta pe numele unui client care nu exista (ID_C = 99999) - Testare Foreign Key
UPDATE vanzari 
SET id_c = 99999 
WHERE id_v = (SELECT MIN(id_v) FROM vanzari);
--Eroare: ORA-02291: integrity constraint (RO_A285_SQL_S40.CLIENTI_VANZARI_FK) violated - parent key not found ORA-06512: at "SYS.DBMS_SQL", line 1721

-- Incerc sa modifica data de expirare a unei retete sa fie in trecut - Testare trigger la data expirare din produse
UPDATE retete 
SET data_expirare = TO_DATE('01-01-2020', 'DD-MM-YYYY') 
WHERE cod_unic = '8578313';
--Eroare: ORA-20001: Data invalida: 01.01.2020 00:00:00trebuie sa fie mai mare decat data curenta. ORA-06512: at "RO_A285_SQL_S40.TRG_RETETE_DATA_EXPIRARE", line 4 ORA-04088: error during execution of trigger 'RO_A285_SQL_S40.TRG_RETETE_DATA_EXPIRARE' ORA-06512: at "SYS.DBMS_SQL", line 1721

-- Incerc sa mut stocul unei farmacii catre un ID de farmacie care nu exista - Testare Foreign Key 
UPDATE stocuri 
SET id_f = 500 
WHERE id_f = 1 AND cantitate > 0;
-- Eroare: ORA-02291: integrity constraint (RO_A285_SQL_S40.STOCURI_FARMACII_FK) violated - parent key not found ORA-06512: at "SYS.DBMS_SQL", line 1721


--DELETE
-- Incerc sa sterg un client (Popescu Andrei) care are deja o vanzare inregistrata - Testare Foreign Key - client vanzari
DELETE FROM clienti 
WHERE cnp = '1980101123456';
--Eroare: ORA-02292: integrity constraint (RO_A285_SQL_S40.CLIENTI_VANZARI_FK) violated - child record found ORA-06512: at "SYS.DBMS_SQL", line 1721

-- Incerc sa sterg un produs care exista fizic pe stocul unei farmacii - Testare Foreign Key - produse stocuri
DELETE FROM produse 
WHERE denumire = 'Nurofen';
-- Eroare: ORA-02292: integrity constraint (RO_A285_SQL_S40.STOCURI_PRODUSE_FK) violated - child record found ORA-06512: at "SYS.DBMS_SQL", line 1721

-- Incercam sa stergem un medic care a emis retete existente in sistem - Testare Foreign Key - medici retete
DELETE FROM medici 
WHERE cod_parafa = '984931';
-- Eroare: ORA-02292: integrity constraint (RO_A285_SQL_S40.MEDICI_RETETE_FK) violated - child record found ORA-06512: at "SYS.DBMS_SQL", line 1721

-- Încercăm să ștergem o farmacie care are stocuri definite - Testare Foreign Key - farmacii stocuri
DELETE FROM farmacii 
WHERE denumire = 'Dr. Max';
-- Eroare: ORA-02292: integrity constraint (RO_A285_SQL_S40.FARMACII_VANZARI_FK) violated - child record found ORA-06512: at "SYS.DBMS_SQL", line 1721