create database BitirmeDb;
go
use BitirmeDb;
Go

create table dbo.Musteri(
	id int identity(1,1) primary key,
	ad nvarchar(50) not null,
	soyad nvarchar(50) not null,
	email nvarchar(150) not null unique,
	sehir nvarchar(100) null,
	kayit_tarihi date not null default (convert(date,getdate()))
	);

create table dbo.Kategori(
	id int identity(1,1) primary key,
	ad nvarchar(50) not null unique
);

create table dbo.Satici(
	id int identity(1,1) primary key,
	ad nvarchar(150) not null,
	adres nvarchar(200) null
);

create table dbo.Urun(
	id int identity(1,1) primary key,
	ad nvarchar(150) not null,
	fiyat decimal(12,2) not null check(fiyat>=0),
	stok int not null check(stok>=0),
	kategori_id int not null,
	satici_id int not null,

	constraint FK_Urun_Kategori foreign key(kategori_id) references dbo.Kategori(id),
	constraint FK_Urun_Satici foreign key(satici_id) references dbo.Satici(id)
);


create table dbo.Siparis(
	id int identity(1,1) primary key,
	musteri_id int not null,
	tarih datetime2 not null default sysutcdatetime(),
	toplam_tutar decimal(12,2) not null check(toplam_tutar>=0),
	odeme_turu nvarchar(20) not null check(odeme_turu in (N'KrediKarti',N'Kapida',N'Cuzdan')),

	constraint FK_Siparis_Musteri foreign key(musteri_id) references dbo.Musteri(id)
);

create table dbo.Siparis_Detay(
	id int identity(1,1) primary key,
	siparis_id int not null,
	urun_id int not null,
	adet int not null check(adet>=0),
	fiyat decimal(10,2) not null check(fiyat>=0),
	
	constraint FK_Sdetay_Siparis foreign key(siparis_id) references dbo.Siparis(id),
	constraint FK_Sdetay_Urun foreign key(urun_id) references dbo.Urun(id)
);