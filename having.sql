/*
--GROUP BY --HAVING --
HAVING ifadesinin islevi WHERE ifadesininkine cok benziyor.Ancak kumeleme fonksiyonlari ile
Where ifadesi birlikte kullanilmadiginda HAVING ifadesine ihtiyac duyulmustur.
GROUP BY ile kullanilir gruplamadan sonraki sart icin group by'dan sonra HAVING kullanilir.
*/

--Maaş ortalaması 3000’den fazla olan ülkelerdeki erkek çalışanların maaş ortalaması.
select ulke, round(avg(maas)) as maas_ortalamasi from personel
where cinsiyet='E'
group by ulke
having avg(maas)>3000 --where kullanamadigim icin having kullandim