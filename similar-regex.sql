-- SELECT -SIMILAR TO -- REGEX(Regular Expressions) --
/*
SIMILAR TO : Daha karmasik pattern(kalip) ile sorgulama islemi icin SIMILAR TO kullanilabilir.
Sadece PostgreSQL de kullanilir. Buyuk kucuk harf onemlidir.

REGEX : Herhangi bir kod, medin icerisinde istenen yazi veya kod parcasinin aranip bulunmasini saglayin
kendine ait bir soz dizimi olan bir yapidir.MySQL de(REGEXP_LIKE) kullanilir
PostgreSQL'de "~" karakteri ile kullanilir.
*/

CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);

INSERT INTO kelimeler VALUES (1001, 'hot', 3);
   INSERT INTO kelimeler VALUES (1002, 'hat', 3);
   INSERT INTO kelimeler VALUES (1003, 'hit', 3);
   INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
   INSERT INTO kelimeler VALUES (1005, 'hct', 3);
   INSERT INTO kelimeler VALUES (1006, 'adem', 4);
   INSERT INTO kelimeler VALUES (1007, 'selim', 5);
   INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
   INSERT INTO kelimeler VALUES (1009, 'hip', 3);
   INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
   INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
   INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
   INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
   INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
   INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
   INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
   INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);
   
   select * from kelimeler
   
   --  İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz
   --Veya islemi icin | karakteri kullanilir.
   --similar to'da buyuk kucuk harf onemlidir.

--SIMILAR TO ile
select * from kelimeler WHERE kelime SIMILAR TO '%(at|ot)%'  
--LIKE ile
select * from kelimeler WHERE kelime ILIKE '%at%' or kelime ILIKE '%ot%'
select * from kelimeler WHERE kelime ~~* '%at%' or kelime ~~* '%ot%' 
--REGEX
select * from kelimeler WHERE kelime ~* 'ot' or kelime ~* 'at'

-- : 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz
--SIMILAR TO ile
select * from kelimeler where kelime similar to 'ho%|hi%'

--LIKE ILE
select * from kelimeler where kelime ~~* 'ho%' or kelime ~~* 'hi%'
--bu kodun anlami ho ile baslasin sonu ne olursa olsun hi ile baslasin sonu ne olursa olsun

--REGEX ile (regex kalibi bu)
select * from kelimeler where kelime ~* 'h[oi](.*)' --Regex'te ".(nokta)" bir karakteri temsil eder"
--basinda ilk harf h olsun ikinci harfi o'da olabilir i'de olabilir sonrasi ne olursa olsun
--Regex'de ikinci karakter icin koseli parantez kullanilir.* hepsi anlaminda kullanilir.

Sonu 't' veya 'm' ile bitenleri listeleyeniz
--SIMILAR TO ile
select * from kelimeler where kelime similar to '%t|%n';
--REGEX ile
select * from kelimeler where kelime ~* '(.*)[tm]$'
--$ isareti karakteri bitir demek 

-- h ile başlayıp t ile biten 3 harfli kelimeleri listeleyeniz
--SIMILAR TO ile
select * from kelimeler where kelime similar to 'h[a-z,A-Z,0_9]t';
--LIKE ile
select * from kelimeler where kelime ~~* 'h_t';
--REGEX ile
select * from kelimeler  where kelime ~* 'h[a-z,A-Z]t'

--İlk karakteri 'h', son karakteri 't' ve ikinci karakteri 'a'dan 'e'ye herhangi bir karakter olan “kelime" değerlerini çağırın.
--"kelime" degerlerini cagirin.
select kelime from kelimeler where kelime similar to 'h[a-e](.*)%t'
select kelime from kelimeler where kelime ~* 'h[a-e](.*)t'

--İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.
select * from kelimeler where kelime ~ '^[say](.*)' -- ^ baslangic'i temsil eder

--Son karakteri 'm', 'a' veya 'f' olan "kelime" değerlerini çağırın.
select * from kelimeler where kelime ~ '(.*)[maf]$' --(.*) kullanmasakta ayni sonucu getirir

--İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım.
--SIMILAR TO ile
select * from kelimeler where kelime similar to 'h[a|i]t'; --H yazsaydik tabloda cikmazdi
--REGEX ile
select * from kelimeler where kelime ~ '^h[a|i]t$' -- ^ sapka isareti baslangici ifade eder

--İlk harfi 'b' dan ‘s' ye bir karakter olan ve ikinci harfi herhangi bir karakter olup
--üçüncü harfi ‘l' olan “kelime" değerlerini çağırın.
select kelime from kelimeler WHERE kelime ~ '^[b-s].l(.*)'

--içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where kelime similar to '%[o][o]%'
--basinda ne olursa olsun icinde en az iki adet  oo barindiran kelimeleri listeler
select * from kelimeler where kelime similar to '%[o]{2}' --suslu parantez icinde belirttigimiz bir onceki koseli 
--parantez icindeki harfin kac tane oldugunu belirtir

--içerisinde en az 4 adet oooo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select kelime from kelimeler where kelime similar to '%[o]{4}%'

















 


























   
   
   
   
   
   
   
   
   