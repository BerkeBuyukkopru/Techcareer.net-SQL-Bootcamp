INSERT INTO books(title, author, genre, price)
VALUES
('Anna Karenina 1', 'Dostoyevski', 'Roman', 25.85),
('Anna Karenina 2', 'Dostoyevski', 'Roman', 55.85),
('Anna Karenina 3', 'Dostoyevski', 'Roman', 85.65),
('Cin Ali 2', 'Cin Ali Yazar�', 'Hikaye', 155.45),
('Masal 1', 'Massal Yazar�', 'Masal', 250);

select * from books


-- Filtreleme ��lemleri: select kolonlar from tablo_adi where kolon_adi filtre
-- Kar��la�t�rma Operat�rleri: >, >=, <, <=, =, !=
select * from books where author = 'Fyodor Dostoyevski';
select title,author from books where price > 65;
select * from books where genre != 'roman';


-- Mant�ksal Operat�rler: and, or, not
select * from books where price>55 and price<155;
select * from books where genre = 'roman' and author = 'Dostoyevski';
select * from books where published_year>1972 or genre = 'sosyoloji';


-- Di�er Operat�rler: between, like, in
select * from books where price between 55 and 155;
select * from books where genre in('Sosyoloji','Hikaye','Masal'); -- "in" = �oklu or.
select * from books where author like 'Dos%'; -- dos ile ba�layanlar.
select * from books where author like '%ar�'; -- ar� ile bitenler
select * from books where author like '%dostoyevski%'; -- metin i�inde arama


-- Silme ��lemleri: Delete from tablo_adi where kolon_adi �art
delete from books where id = 1006;


-- G�ncelleme ��lemleri: Update from tablo_adi set kolon_adi = deger �art // kolon_adi = kolon_adi2 �art
update books set price = 350 where id=4
update books set author = 'Tolstoy' where title like 'Anna Karenina%';

update books set price = (price*20/100) + price;


-- Aggregate Fonksiyonlar: AVG, SUM, MIN, MAX, COUNT
select avg(price) as [Ortalama] from books -- Ortalama s�tununda ortalamay� g�ster.
select avg(price) as [Ortalama], 
	   sum(price) as [Toplam], 
	   min(price) as [Minimum Fiyat], 
	   max(price) as [Maksimum Fiyat], 
	   count(*) as [Eleman Say�s�] from books;


-- Gruplama ��lemleri: select kolon_adi, aggregate_fonksiyon from tablo_adi group by kolon_adi;
select genre, count(*) as [Kitap Sayisi] from books group by genre;
select genre, count(*) as [Kitap Sayisi] from books group by genre order by [Kitap Sayisi] desc;

select genre, avg(price) as [Ortalama], 
			  sum(price) as [Toplam], 
			  min(price) as [Minimum Fiyat], 
			  max(price) as [Maksimum Fiyat],
			  count(*) as [Eleman Say�s�] from books group by genre;

-- Gruplama i�lemlerinde "where" yerine "having" kullan�l�r.
select genre, avg(price) as [Ortalama] from books group by genre having avg(price)>60;