create table books(
	id int primary key identity, --"identity" otomatik artt�rmay� sa�lar.
	title varchar(100) not null,
	author varchar(100) not null,
	published_year int,
	genre varchar(100),
	price decimal(10,2),
);

-- insert into Tablo_adi(Kolon1,  Kolon2,...) values(de�er1,de�er2,...);
insert into books(title,author,published_year,genre,price) 
values('Kumarbaz','Fyodor Dostoyevski',1975,'Roman',85.50);

insert into books(title,author,published_year,genre,price) 
values
	('Su� ve Ceza','Fyodor Dostoyevski',1875,'Roman',125.85),
	('Sefiller','Victor Hugo',1860,'Sosyoloji',49.50),
	('Karamazov Karde�ler','Fyodor Dostoyevski',null,null,85.47);

insert into books(title,author,price) 
values('Cin Ali 1','Cin Ali Yazar�',7);

-- select kolonlar from tablo_adi
select title,author,price from books;

select * from books; -- T�m verileri getirir.