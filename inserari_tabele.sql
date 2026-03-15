----FARMACII----

INSERT INTO farmacii(denumire, oras, adresa, telefon) VALUES 
('Dr. Max', 'Iasi', 'Soseaua Nicolina 15', '0729105907');

INSERT INTO farmacii(denumire, oras, adresa, telefon) VALUES 
('Ropharma', 'Vaslui', 'Strada Eternitate nr. 5', '0232218323');

INSERT INTO farmacii(denumire, oras, adresa, telefon) VALUES 
('Catena', 'Bucuresti', 'Calea Rahovei 322', '0741106659');

INSERT INTO farmacii(denumire, oras, adresa, telefon) VALUES 
('Dona', 'Bucuresti', 'Strada Simion Barnutiu 79', '0372407140');

INSERT INTO farmacii(denumire, oras, adresa) VALUES 
('Fortis', 'Barlad', 'Strada Gheorghe Asachi');

----CLIENTI----

INSERT INTO clienti (nume, prenume, cnp, email, telefon) VALUES
('Popescu', 'Andrei', '1980101123456', 'andrei.popescu80@gmail.com', '0712345678');

INSERT INTO clienti (nume, prenume, cnp) VALUES
('Ionescu', 'Mihaela', '1992051523457');

INSERT INTO clienti (nume, prenume, cnp, email, telefon) VALUES
('Galusca', 'Ioana-Maria', '1985123023458', 'ioanamaria@gmail.com', '0734567890');

INSERT INTO clienti (nume, prenume, cnp, telefon) VALUES
('Luca', 'Alexandru', '2000010123459','0745678901');

INSERT INTO clienti (nume, prenume, cnp, email, telefon) VALUES
('Stan', 'Daria-Elena', '1998111123460', 'daria-elena@yahoo.com', '0756789012');

INSERT INTO clienti (nume, prenume, cnp, email) VALUES
('Rusu', 'Ovidiu', '2004300722563', 'rusuoviudiu30@yahoo.com');


----MEDICI----

INSERT INTO medici (nume, prenume, cod_parafa, specializare) VALUES
('Matei', 'Cristina-Maria', 'M245A1', 'Cardiologie');

INSERT INTO medici (nume, prenume, cod_parafa, specializare) VALUES
('Radu', 'Victor', '653R10', 'Dermatologie');

INSERT INTO medici (nume, prenume, cod_parafa, specializare) VALUES
('Marin', 'Teodora', 'B35626', 'Pediatrie');

INSERT INTO medici (nume, prenume, cod_parafa, specializare) VALUES
('Stoica', 'Larisa-Elena', '735S96', 'Endocrinologie');

INSERT INTO medici (nume, prenume, cod_parafa, specializare) VALUES
('Sandu', 'Andrei', 'S78331', 'Gastroenterologie');

INSERT INTO medici (nume, prenume, cod_parafa, specializare) VALUES
('Enache', 'Gabriela', '984931', 'Medicină de familie');

---- PRODUSE SI PROSPECTE  ----
INSERT INTO produse (denumire, pret, necesita_reteta, data_expirare) VALUES
('Nurofen', 22.20, 'NU', TO_DATE('31-12-2027', 'DD-MM-YYYY'));

INSERT INTO prospecte (id_p, descriere, producator) VALUES
((SELECT id_p FROM produse WHERE denumire = 'Nurofen'), 'Analgezic și antiinflamator 400mg', 'Reckitt Benckiser');


INSERT INTO produse (denumire, pret, necesita_reteta, data_expirare) VALUES
('Augmentin', 35.00, 'DA', TO_DATE('30-06-2026', 'DD-MM-YYYY'));

INSERT INTO prospecte (id_p, descriere, producator) VALUES
((SELECT id_p FROM produse WHERE denumire = 'Augmentin'), 'Antibiotic cu spectru larg', 'GlaxoSmithKline (GSK)');


INSERT INTO produse (denumire, pret, necesita_reteta, data_expirare) VALUES
('Paracetamol', 10.00, 'NU', TO_DATE('31-12-2026', 'DD-MM-YYYY'));

INSERT INTO prospecte (id_p, descriere, producator) VALUES
((SELECT id_p FROM produse WHERE denumire = 'Paracetamol'), 'Antipiretic și analgezic', 'Terapia Cluj');


INSERT INTO produse (denumire, pret, necesita_reteta, data_expirare) VALUES
('Zinnat', 42.00, 'DA', TO_DATE('30-09-2026', 'DD-MM-YYYY'));

INSERT INTO prospecte (id_p, descriere, producator) VALUES
((SELECT id_p FROM produse WHERE denumire = 'Zinnat'), 'Antibiotic 500mg', 'GlaxoSmithKline (GSK)');


INSERT INTO produse (denumire, pret, necesita_reteta, data_expirare) VALUES
('Aspenter', 15.50, 'DA', TO_DATE('31-08-2027', 'DD-MM-YYYY'));

INSERT INTO prospecte (id_p, descriere, producator) VALUES
((SELECT id_p FROM produse WHERE denumire = 'Aspenter'), 'Comprimate gastrorezistente 75mg', 'Terapia Cluj');


INSERT INTO produse (denumire, pret, necesita_reteta, data_expirare) VALUES
('Vitamina C', 18.00, 'NU', TO_DATE('10-12-2026', 'DD-MM-YYYY'));

INSERT INTO prospecte (id_p, descriere, producator) VALUES
((SELECT id_p FROM produse WHERE denumire = 'Vitamina C'), 'Supliment alimentar', 'Secom');

----STOCURI-----

INSERT INTO stocuri (id_f, id_p, cantitate) VALUES
(1, (SELECT id_p FROM produse WHERE denumire = 'Nurofen'), 50);
INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(1, (SELECT id_p FROM produse WHERE denumire = 'Augmentin'), 50);
INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(1, (SELECT id_p FROM produse WHERE denumire = 'Paracetamol'), 20);
INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(1, (SELECT id_p FROM produse WHERE denumire = 'Zinnat'), 70);
INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(1, (SELECT id_p FROM produse WHERE denumire = 'Aspenter'), 10);
INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(1, (SELECT id_p FROM produse WHERE denumire = 'Vitamina C'), 15);

INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(2,  (SELECT id_p FROM produse WHERE denumire = 'Nurofen'), 17);
INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(2, (SELECT id_p FROM produse WHERE denumire = 'Augmentin'), 12);
INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(2, (SELECT id_p FROM produse WHERE denumire = 'Paracetamol'), 20);
INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(2, (SELECT id_p FROM produse WHERE denumire = 'Zinnat'), 35);
INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(2, (SELECT id_p FROM produse WHERE denumire = 'Aspenter'), 27);
INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(2, (SELECT id_p FROM produse WHERE denumire = 'Vitamina C'), 29);


INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(3,  (SELECT id_p FROM produse WHERE denumire = 'Nurofen'), 28);
INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(3, (SELECT id_p FROM produse WHERE denumire = 'Augmentin'), 34);
INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(3, (SELECT id_p FROM produse WHERE denumire = 'Paracetamol'), 13);
INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(3, (SELECT id_p FROM produse WHERE denumire = 'Zinnat'), 56);
INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(3, (SELECT id_p FROM produse WHERE denumire = 'Aspenter'), 12);
INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(3, (SELECT id_p FROM produse WHERE denumire = 'Vitamina C'), 65);

INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(4,  (SELECT id_p FROM produse WHERE denumire = 'Nurofen'), 50);
INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(4, (SELECT id_p FROM produse WHERE denumire = 'Augmentin'), 68);
INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(4, (SELECT id_p FROM produse WHERE denumire = 'Paracetamol'), 39);
INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(4, (SELECT id_p FROM produse WHERE denumire = 'Zinnat'), 46);
INSERT INTO stocuri (id_f, id_p, cantitate) VALUES
(4, (SELECT id_p FROM produse WHERE denumire = 'Aspenter'), 26);
INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(4, (SELECT id_p FROM produse WHERE denumire = 'Vitamina C'), 56);


INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(5,  (SELECT id_p FROM produse WHERE denumire = 'Nurofen'), 50);
INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(5, (SELECT id_p FROM produse WHERE denumire = 'Augmentin'), 50);
INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(5, (SELECT id_p FROM produse WHERE denumire = 'Paracetamol'), 40);
INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(5, (SELECT id_p FROM produse WHERE denumire = 'Zinnat'), 39);
INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(5, (SELECT id_p FROM produse WHERE denumire = 'Aspenter'), 45);
INSERT INTO stocuri (id_f, id_p, cantitate) VALUES 
(5, (SELECT id_p FROM produse WHERE denumire = 'Vitamina C'), 34);


----RETETE----

INSERT INTO retete (id_m, id_c, cod_unic, data_emitere, data_expirare) 
VALUES ((SELECT id_m FROM medici WHERE cod_parafa = '984931'), (SELECT id_c FROM clienti WHERE cnp = '1992051523457'), 
'8578313', TO_DATE('15-11-2025', 'DD-MM-YYYY'), TO_DATE('15-12-2026', 'DD-MM-YYYY'));

INSERT INTO retete (id_m, id_c, cod_unic, data_emitere, data_expirare) 
VALUES ((SELECT id_m FROM medici WHERE cod_parafa = '653R10'), (SELECT id_c FROM clienti WHERE cnp = '1980101123456'),
'63273462', SYSDATE, SYSDATE + 30);

INSERT INTO retete (id_m, id_c, cod_unic, data_emitere, data_expirare) 
VALUES ((SELECT id_m FROM medici WHERE cod_parafa = 'B35626'), (SELECT id_c FROM clienti WHERE cnp = '2000010123459'), 
'9507435', TO_DATE('20-10-2025', 'DD-MM-YYYY'), TO_DATE('20-12-2025', 'DD-MM-YYYY'));

INSERT INTO retete (id_m, id_c, cod_unic, data_emitere, data_expirare) 
VALUES ((SELECT id_m FROM medici WHERE cod_parafa = 'M245A1'), (SELECT id_c FROM clienti WHERE cnp = '1998111123460'), 
'860373955', SYSDATE, SYSDATE + 30);


---DETALII_RETETE----
INSERT INTO detalii_retete (id_r, id_p, doza, cantitate, mod_administrare) 
VALUES ((SELECT id_r FROM retete WHERE cod_unic = '8578313'), (SELECT id_p FROM produse WHERE denumire = 'Augmentin'),
 '1 comprimat pe zi', 1, 'Dupa masa');

INSERT INTO detalii_retete (id_r, id_p, doza, cantitate, mod_administrare) 
VALUES ((SELECT id_r FROM retete WHERE cod_unic = '63273462'), (SELECT id_p FROM produse WHERE denumire = 'Zinnat'),
 '1 comprimat la 12 ore', 1, 'De 2 ori pe zi, dupa masa');

INSERT INTO detalii_retete (id_r, id_p, doza, cantitate, mod_administrare) 
VALUES ((SELECT id_r FROM retete WHERE cod_unic = '9507435'), (SELECT id_p FROM produse WHERE denumire = 'Augmentin'),
'1 comprimat pe zi', 1, 'Dupa masa');

INSERT INTO detalii_retete (id_r, id_p, doza, cantitate, mod_administrare) 
VALUES ((SELECT id_r FROM retete WHERE cod_unic = '860373955'), (SELECT id_p FROM produse WHERE denumire = 'Aspenter'),
'1 comprimate pe zi', 3, 'Seara');


----VANZARI----
INSERT INTO vanzari (id_c, id_f, data_vanzare) VALUES 
((SELECT id_c FROM clienti WHERE cnp = '1980101123456'), (SELECT id_f FROM farmacii WHERE oras = 'Iasi' AND adresa = 'Soseaua Nicolina 15'), SYSDATE);

INSERT INTO vanzari (id_c, id_f, data_vanzare) VALUES 
((SELECT id_c FROM clienti WHERE cnp = '1992051523457'), (SELECT id_f FROM farmacii WHERE oras = 'Barlad' AND adresa = 'Strada Gheorghe Asachi'), TO_DATE('10-09-2025', 'DD-MM-YYYY'));

INSERT INTO vanzari (id_c, id_f, data_vanzare) VALUES 
((SELECT id_c FROM clienti WHERE cnp = '1985123023458'), (SELECT id_f FROM farmacii WHERE oras = 'Vaslui' AND adresa = 'Strada Eternitate nr. 5'), TO_DATE('24-08-2025', 'DD-MM-YYYY'));

INSERT INTO vanzari (id_c, id_f, data_vanzare) VALUES 
((SELECT id_c FROM clienti WHERE cnp = '2000010123459'), (SELECT id_f FROM farmacii WHERE oras = 'Bucuresti' AND adresa = 'Calea Rahovei 322'), TO_DATE('17-10-2025', 'DD-MM-YYYY'));


INSERT INTO vanzari (id_c, id_f, data_vanzare) VALUES 
((SELECT id_c FROM clienti WHERE cnp = '1998111123460'), (SELECT id_f FROM farmacii WHERE oras = 'Bucuresti' AND adresa = 'Strada Simion Barnutiu 79'), SYSDATE);

INSERT INTO vanzari (id_c, id_f, data_vanzare) VALUES 
((SELECT id_c FROM clienti WHERE cnp = '1985123023458'), (SELECT id_f FROM farmacii WHERE oras = 'Iasi' AND adresa = 'Soseaua Nicolina 15'), SYSDATE);

---- DETALII_VANZARI ----

INSERT INTO detalii_vanzari (id_v, id_p, cantitate, id_r) VALUES 
((SELECT id_v FROM vanzari WHERE id_c = (SELECT id_c FROM clienti WHERE cnp = '1980101123456') AND id_f = 1), 
(SELECT id_p FROM produse WHERE denumire = 'Zinnat'),
(SELECT cantitate FROM detalii_retete 
     WHERE id_r = (SELECT id_r FROM retete WHERE cod_unic = '63273462')
       AND id_p = (SELECT id_p FROM produse WHERE denumire = 'Zinnat')),
(SELECT id_r FROM retete WHERE cod_unic = '63273462'));

INSERT INTO detalii_vanzari (id_v, id_p, cantitate, id_r) VALUES 
((SELECT id_v FROM vanzari WHERE id_c = (SELECT id_c FROM clienti WHERE cnp = '1980101123456') AND id_f = 1),
(SELECT id_p FROM produse WHERE denumire = 'Paracetamol'), 2, NULL);


INSERT INTO detalii_vanzari (id_v, id_p, cantitate, id_r) VALUES 
((SELECT id_v FROM vanzari WHERE id_c = (SELECT id_c FROM clienti WHERE cnp = '1992051523457') AND id_f = 5),
(SELECT id_p FROM produse WHERE denumire = 'Nurofen'), 1, NULL);

INSERT INTO detalii_vanzari (id_v, id_p, cantitate, id_r) VALUES 
((SELECT id_v FROM vanzari WHERE id_c = (SELECT id_c FROM clienti WHERE cnp = '1992051523457') AND id_f = 5),
(SELECT id_p FROM produse WHERE denumire = 'Vitamina C'), 2, NULL);

INSERT INTO detalii_vanzari (id_v, id_p, cantitate, id_r) VALUES 
((SELECT MAX(id_v) FROM vanzari WHERE id_c = (SELECT id_c FROM clienti WHERE cnp = '1985123023458') AND id_f = 2),
(SELECT id_p FROM produse WHERE denumire = 'Paracetamol'), 3, NULL);

INSERT INTO detalii_vanzari (id_v, id_p, cantitate, id_r) VALUES 
((SELECT id_v FROM vanzari WHERE id_c = (SELECT id_c FROM clienti WHERE cnp = '2000010123459') AND id_f = 3),
(SELECT id_p FROM produse WHERE denumire = 'Augmentin'),
(SELECT cantitate FROM detalii_retete 
    WHERE id_r = (SELECT id_r FROM retete WHERE cod_unic = '8578313')
      AND id_p = (SELECT id_p FROM produse WHERE denumire = 'Augmentin')),
(SELECT id_r FROM retete WHERE cod_unic = '8578313'));

INSERT INTO detalii_vanzari (id_v, id_p, cantitate, id_r) VALUES 
((SELECT id_v FROM vanzari WHERE id_c = (SELECT id_c FROM clienti WHERE cnp = '1998111123460') AND id_f = 4),
(SELECT id_p FROM produse WHERE denumire = 'Vitamina C'), 1, NULL);

INSERT INTO detalii_vanzari (id_v, id_p, cantitate, id_r) VALUES 
((SELECT id_v FROM vanzari WHERE id_c = (SELECT id_c FROM clienti WHERE cnp = '1985123023458') AND id_f = 1),
(SELECT id_p FROM produse WHERE denumire = 'Nurofen'), 2, NULL);



