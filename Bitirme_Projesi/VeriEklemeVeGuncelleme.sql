use BitirmeDb;
go

insert into dbo.Kategori(ad) VALUES
(N'Elektronik'),
(N'Moda'),
(N'Ev & Yaþam'),
(N'Kitap'),
(N'Oyuncak');

insert into dbo.Satici(ad, adres) VALUES
(N'TechMarket', N'Ýstanbul, Kadýköy'),
(N'StyleStore', N'Ankara, Çankaya'),
(N'HomeComforts', N'Ýzmir, Konak'),
(N'BookWorld', N'Bursa, Nilüfer'),
(N'FunToys', N'Antalya, Muratpaþa');

insert into dbo.Musteri(ad, soyad, email, sehir) VALUES
(N'Ahmet', N'Yýlmaz', N'ahmet.yilmaz34@gmail.com', N'Ýstanbul'),
(N'Elif', N'Kara', N'elif.kara@gmail.com', N'Ankara'),
(N'Mehmet', N'Demir', N'mehmet.demir@gmail.com', N'Ýzmir'),
(N'Aylin', N'Çetin', N'aylin.cetin@gmail.com', N'Bursa'),
(N'Fatih', N'Öztürk', N'fatih.ozturk@gmail.com', N'Antalya'),
(N'Seda', N'Koç', N'seda.koc87@gmail.com', N'Ýstanbul'),
(N'Can', N'Polat', N'can.polat@gmail.com', N'Ankara'),
(N'Deniz', N'Aslan', N'deniz.aslan@gmail.com', N'Ýzmir'),
(N'Ali', N'Korkmaz', N'ali.korkmaz@hotmail.com',N'Ankara'),
(N'Zeynep', N'Çelik', N'zeynep.celik13@hotmail.com',N'Ýzmir'),
(N'Berke', N'Büyükköprü', N'berke.buyukkopru06@gmail.com', N'Ankara');

insert into dbo.Urun(ad, fiyat, stok, kategori_id, satici_id) VALUES
(N'Kablosuz Kulaklýk', 499.90, 50, 1, 1),
(N'Telefon Kýlýfý', 79.90, 200, 1, 1),
(N'Erkek Tiþört', 129.90, 120, 2, 2),
(N'Kadýn Elbise', 249.90, 60, 2, 2),
(N'Piknik Seti', 199.90, 40, 3, 3),
(N'Yastýk (ikili)', 159.90, 30, 3, 3),
(N'Kayýp Zaman', 59.90, 150, 4, 4),
(N'C# Programlama Kitabý', 189.90, 90, 4, 4),
(N'Ahþap Puzzle', 89.90, 80, 5, 5),
(N'Uzaktan Kumandalý Araba', 349.90, 25, 5, 5),
(N'Bluetooth Hoparlör', 299.90, 40, 1, 1),
(N'Laptop Çantasý', 219.90, 70, 1, 1),
(N'Çocuk T-shirt', 79.90, 100, 2, 2),
(N'Mutfak Seti', 399.90, 20, 3, 3),
(N'Baþucu Lambasý', 129.90, 55, 3, 3),
(N'Aklýndan Bir Sayý Tut', 69.90, 110, 4, 4),
(N'STEM Oyuncak Seti', 219.90, 40, 5, 5),
(N'Akýllý Saat', 999.90, 15, 1, 1),
(N'Formel Gömlek', 179.90, 45, 2, 2),
(N'Bambu Kesme Tahtasý', 89.90, 60, 3, 3);


update dbo.Musteri set sehir= N'Ankara' where ad=N'Ahmet' and soyad= N'Yýlmaz';

update dbo.Urun set fiyat = fiyat + (fiyat*0.2) where ad = N'Kablosuz Kulaklýk';

update dbo.Musteri set email= N'seda.koc@hotmail.com' where ad=N'Seda' and soyad= N'Koç';


delete from dbo.Musteri where ad = N'Can' AND soyad = N'Polat';

truncate table dbo.Urun;  /* FOREIGN KEY ile baðlý olduðu için çalýþmadý */

insert into dbo.Siparis(musteri_id, toplam_tutar, odeme_turu) values(4, 59.90 + 189.90, N'KrediKarti');
insert into dbo.Siparis(musteri_id, toplam_tutar, odeme_turu) values(1, 499.90 + 79.90, N'KrediKarti');
insert into dbo.Siparis(musteri_id, toplam_tutar, odeme_turu) values(2, 249.90 + 129.90, N'Kapida');
insert into dbo.Siparis(musteri_id, toplam_tutar, odeme_turu) values(8, 129.90 + 69.90, N'Kapida');
insert into dbo.Siparis(musteri_id, toplam_tutar, odeme_turu) values(2, 79.90 + 399.90, N'Cuzdan');
insert into dbo.Siparis(musteri_id, toplam_tutar, odeme_turu) values(3, 199.90 + 159.90, N'Cuzdan');
insert into dbo.Siparis(musteri_id, toplam_tutar, odeme_turu) values(5, 89.90 + 349.90, N'Kapida');
insert into dbo.Siparis(musteri_id, toplam_tutar, odeme_turu) values(8, 79.90 + 399.90, N'KrediKarti');
insert into dbo.Siparis(musteri_id, toplam_tutar, odeme_turu) values(6, 299.90 + 219.90, N'Cuzdan');
insert into dbo.Siparis(musteri_id, toplam_tutar, odeme_turu) values(5, 249.90 + 129.90, N'KrediKarti');


insert into dbo.Siparis_Detay(siparis_id, urun_id, adet, fiyat) values(1, 7, 1, 59.90),(1, 8, 1, 189.90);
insert into dbo.Siparis_Detay(siparis_id, urun_id, adet, fiyat) values(2, 1, 1, 499.90),(2, 2, 1, 79.90);
insert into dbo.Siparis_Detay(siparis_id, urun_id, adet, fiyat) values(3, 4, 1, 249.90),(3, 3, 1, 129.90);
insert into dbo.Siparis_Detay(siparis_id, urun_id, adet, fiyat) values(4, 15, 1, 129.90),(4, 16, 1, 69.90);
insert into dbo.Siparis_Detay(siparis_id, urun_id, adet, fiyat) values(5, 13, 1, 79.90),(5, 14, 1, 399.90);
insert into dbo.Siparis_Detay(siparis_id, urun_id, adet, fiyat) values(6, 5, 1, 199.90),(6, 6, 1, 159.90);
insert into dbo.Siparis_Detay(siparis_id, urun_id, adet, fiyat) values(7, 9, 1, 89.90),(7, 10, 1, 349.90);
insert into dbo.Siparis_Detay(siparis_id, urun_id, adet, fiyat) values(8, 13, 1, 79.90),(8, 14, 1, 399.90);
insert into dbo.Siparis_Detay(siparis_id, urun_id, adet, fiyat) values(9, 11, 1, 299.90),(9, 12, 1, 219.90);
insert into dbo.Siparis_Detay(siparis_id, urun_id, adet, fiyat) values(10, 4, 1, 249.90),(10, 3, 1, 129.90);


update dbo.Urun set dbo.Urun.stok = dbo.Urun.stok - dbo.Siparis_Detay.adet from dbo.Urun INNER JOIN dbo.Siparis_Detay ON dbo.Urun.id = dbo.Siparis_Detay.urun_id;
SELECT id, ad, stok FROM dbo.Urun;