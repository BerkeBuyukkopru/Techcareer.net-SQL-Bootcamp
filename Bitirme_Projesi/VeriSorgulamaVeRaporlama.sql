use BitirmeDb;
go

select top 5 dbo.Musteri.id, dbo.Musteri.ad, dbo.Musteri.soyad, 
count(*) as SiparisSayisi from dbo.Siparis 
join dbo.Musteri on dbo.Musteri.id = dbo.Siparis.musteri_id 
group by dbo.Musteri.id, dbo.Musteri.ad, dbo.Musteri.soyad
order by SiparisSayisi desc;


select dbo.Urun.id, dbo.Urun.ad, sum(dbo.Siparis_Detay.adet) as ToplamSatilan
from dbo.Siparis_Detay 
join dbo.Urun on dbo.Urun.id = dbo.Siparis_Detay.urun_id
group by dbo.Urun.id, dbo.Urun.ad
order by ToplamSatilan desc;


select dbo.Satici.id, dbo.Satici.ad, sum(dbo.Siparis_Detay.fiyat * dbo.Siparis_Detay.adet) as ToplamCiro
from dbo.Siparis_Detay
join dbo.Urun on dbo.Urun.id = dbo.Siparis_Detay.urun_id
join dbo.Satici on dbo.Satici.id = dbo.Urun.satici_id
group by dbo.Satici.id, dbo.Satici.ad
order by ToplamCiro desc;


select dbo.Musteri.sehir, count(dbo.Musteri.id) as MusteriSayisi
from dbo.Musteri
group by dbo.Musteri.sehir
order by MusteriSayisi desc;


select dbo.Kategori.ad, sum(dbo.Siparis_Detay.fiyat * dbo.Siparis_Detay.adet) as ToplamSatis
from dbo.Siparis_Detay
join dbo.Urun on dbo.Urun.id = dbo.Siparis_Detay.urun_id
join dbo.Kategori on dbo.Kategori.id = dbo.Urun.kategori_id
group by dbo.Kategori.ad
order by ToplamSatis desc;


select month(dbo.Siparis.tarih) as Ay, count(dbo.Siparis.id) as SiparisSayisi
from dbo.Siparis
group by month(dbo.Siparis.tarih)
order by Ay;


select dbo.Siparis.id as SiparisID, dbo.Musteri.ad as MusteriAd, dbo.Musteri.soyad as MusteriSoyad,
dbo.Urun.ad as UrunAd, dbo.Urun.fiyat as UrunFiyat, dbo.Satici.ad as SaticiAd
from dbo.Siparis join dbo.Musteri ON dbo.Musteri.id = dbo.Siparis.musteri_id 
join dbo.Siparis_Detay on dbo.Siparis.id = dbo.Siparis_Detay.siparis_id
join dbo.Urun on dbo.Urun.id = dbo.Siparis_Detay.urun_id
join dbo.Satici on dbo.Satici.id = dbo.Urun.satici_id
order by dbo.Siparis.id;


select dbo.Urun.id, dbo.Urun.ad, dbo.Urun.fiyat, dbo.Urun.stok from dbo.Urun
left join dbo.Siparis_Detay on dbo.Urun.id = dbo.Siparis_Detay.urun_id
where dbo.Siparis_Detay.urun_id is null;


select dbo.Musteri.id, dbo.Musteri.ad, dbo.Musteri.soyad, dbo.Musteri.email, dbo.Musteri.sehir from dbo.Musteri
left join dbo.Siparis on dbo.Musteri.id = dbo.Siparis.musteri_id
where dbo.Siparis.id is null;
