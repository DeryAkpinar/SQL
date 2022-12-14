-- AGGREGATE METHOD KULLANIMI --
/*
-Aggregate Methodlari(SUM,COUNT,MIN,MAX,AVG)
-Subquery icinde de kullanilir
-Ancak, sorgu tek bir deger donduruyor olmalidir.
SYNTAX: sum() seklinde olmali sum () arasinda bosluk olmamali
*/

CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);

INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

select * from calisanlar2
--Calisanlar2 tablosundaki en yuksek maas degerini lsiteleyiniz
Select max(maas) from calisanlar2

--Calisanlar tablosundaki maaslarin toplamini listeleyiniz
select sum(maas) from calisanlar2

--calisanlar tablosundaki maas ortalamasini listeleyiniz
select avg(maas) from calisanlar2
select round(avg(maas)) from calisanlar2
select round(avg(maas),2) from calisanlar2

--
--Calisanlar toplasundan en düşük maası listeleyiniz
SELECT min(maas) from calisanlar2
--Calisanlar tablosundaki kaç kişinin maaş aldığını listeleyiniz
SELECT count(maas) from calisanlar2


CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);
INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

select * from markalar

--  Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
SELECT marka_isim, calisan_sayisi, (select sum(maas) from calisanlar2
WHERE marka_isim=isyeri) AS toplam_maas from markalar
--ALIAS (AS) toplada gecici ismini...

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.
select marka_isim,calisan_sayisi,(select max(maas) from calisanlar2 where marka_isim=isyeri)AS max_maas,
(select min(maas) from calisanlar2 where marka_isim=isyeri) AS min_maas
from markalar;

--Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
SELECT marka_id, marka_isim, (SELECT COUNT(sehir) FROM calisanlar2 WHERE marka_isim = isyeri) AS sehir_sayisi FROM markalar;

--Interview Question: En yüksek ikinci maas değerini çağırın.
select max(maas) AS enyuksek_ikinci_maas from calisanlar2
where maas < (select max(maas) from calisanlar2)

----Interview Question: En düşük ikinci maas değerini çağırın.
select min(maas)As enDusukIkinciMaas from calisanlar2
where maas >(select min(maas) from calisanlar2);

--En yüksek üçüncü maas değerini bulun
select min(maas) as enDusukIkinciMaas from calisanlar2
where maas>(select min(maas) from calisanlar2 where maas>(select min(maas) from calisanlar2));

--En dusuk ucuncu maas degerini bulunuz(ODEV)




























