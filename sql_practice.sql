-- sql_practise 1
create table personel
(
id serial primary key  ,
isim varchar(20),
yas int,
maas int,
email varchar(30)
);
																							 
-- auto_increment kullandığımızda otomatik olarak id ler 1 den başlayacaktır.

insert into personel (isim, yas, maas, email) values ('Ali', 39, 12500, 'ali@gmail.com');
insert into personel (isim, yas, maas, email) values ('Derya', 28, 15000, 'derya@yahoo.com');
insert into personel (isim, yas, maas, email) values ('Sevim', 24, 25000, 'sevim@hotmail.com');
insert into personel (isim, yas, maas, email) values ('Yusuf', 32, 18000, 'yusuf@gmail.com');
insert into personel (isim, yas, maas, email) values ('Halil', 48, 22000, 'halil@gmail.com');
insert into personel (isim, yas, maas, email) values ('Ece', 54, 21000, 'ece@gmail.com');
insert into personel (isim, yas, maas, email) values ('Can', 38, 19000, 'can@gmail.com');
insert into personel (isim, yas, maas, email) values ('Elif', 27, 14000, 'elif@gmail.com');
insert into personel (isim, yas, maas, email) values ('Ezgi', 38, 21000, 'ezgi@gmail.com');
insert into personel (isim, yas, maas, email) values ('Sena', 25, 11000, NULL);

--1)Tablo bilgilerini listeleyiniz
select * from personel

--2) isim,yas ve maas bilgilerini listeleyiniz
select isim,yas,maas from personel;

--3)id'si 8 olan personel bilgilerini listeleyiniz
select * from personel where id=8;

--4)id'si 5 olan personelin isim,yas ve email bilgilerini listeleyiniz
select isim , id ,yas ,email from personel where id=5;
--select ve from arasina hangi bilgileri gormek istiyorsak onu yaziyoruz. sartimiz varsa where'den sonra yazdiriyoruz

--5) 30 yasindan buyuk personle bilgilerini listeleyiniz
select * from personel where yas>30;
--tum bilgileri goruntulemek icin * kullaniriz select ve from arasina

-- 6) maası 21000 olmayan personel bilgilerini listeleyiniz.
select * from personel where maas!=21000;
select * from personel where maas <>21000; --iki sekildede aynen yazilabilir.

-- maasi 21000 olmayan istedigi icin sarta unlem koyarak gosteririz veya
--veya <> isareti kullanilabilir.

-- 7) ismi a harfi ile başlayan personel bilgilerini listeleyiniz.
select * from personel where isim ilike 'A%';
--% isareti ne il
e devam ederse etsin yani ornekteki gibi mesela A ile baslasin gerisi hersey olabilir.

--8)ismi n harfi ile biten personel bilgilerini listeleyiniz.
select * from personel where isim ilike '%N';

-- 9) email adresi gmail olan personel bilgilerini listeleyiniz.
select * from personel where email like '%gmail.com';

-- 10) email adresi gmail olmayan personel bilgilerini listeleyiniz.
select * from personel where email not like '%@gmail.com';
--% ile arama yaptigimiz icin null gelmez

--11) id'si 3,5,7 ve 9 olan personel bilgilerini listeleyiniz.
select * from personel where id in(3,5,7,9);

--12) yasi 39,48 ve 54 olmayan personel bilgilerini listeleyiniz.
select * from personel where yas not in(39,48,54);

--13) yasi 30 ve 40 arasinda olan personel bilgilerini listeleyiniz.
select * from personel where yas between 30 and 40;

--14) yasi 30 ve 40 arasinda olmayan personel bilgilerini listeleyiniz.
select * from personel where yas not between 30 and 40;

-- 15) emaili null olan personel bilgilerini listeleyiniz.
select * from personel where email is NULL;

-- 16) personel bilgilerini yaşa göre sıralayınız.
select * from personel order by yas;

-- 17) personel bilgilerini maaşa göre sıralayınız.
select * from personel order by maas;

-- 18) personelin yaşlarını büyükten küçüğe doğru sıralayınız.
select * from personel order by yas desc;
--javada reverse gibi desc'de tersten siraliyoruz.

-- 19) personelin maaşlarını büyükten küçüğe doğru sıralayınız.
select * from personel order by maas desc;
--order by sirala demektir. desc=buyukten kucuge siralama

-- 20) En yüksek maaş olan ilk 3 personel bilgilerini sıralayınız
select * from personel order by maas desc limit 3;
--sinirlandirma da limit kullanilir ilk 3'u dedigi icin limit kullaniriz.





















