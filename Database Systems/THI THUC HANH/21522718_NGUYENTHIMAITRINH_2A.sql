CREATE DATABASE THUCHANH
GO
-----------------------------------------------------
-----------------------------------------------------
USE THUCHANH
GO

set dateformat dmy
-----------------------------------------------------


--KHACHHANG
CREATE TABLE KHACHHANG(
       MAKH char(4) not null,
	   TENKH varchar(20),
	   QUOCTICH varchar(20),
	   TUOI int,
	   constraint pk_khhang primary key(MAKH)
)
--PHONG
CREATE TABLE PHONG(
       SOPHONG char(4) not null,
	   LOAIPHONG varchar(20) not null,
	   GIAPHONG money,
	   TINHTRANG varchar(20),
	   constraint pk_kh primary key(SOPHONG, LOAIPHONG)
)

--HOADON
CREATE TABLE HOADON(
       SOHD int not null,
	   NGHD smalldatetime,
	   MAKH char(4),
	   constraint pk_kh primary key(SOHD)
)

--CTTP
CREATE TABLE CTTP(
       SOHD int not null,
	   SOPHONG char(4) not null,
	   NGAYDEN smalldatetime,
	   NGAYDI smalldatetime,
	   constraint pk_kh primary key(SOHD, SOPHONG)
)


--Tao khoa ngoai
-- Khoa ngoai cho bang HOADON
ALTER TABLE HOADON ADD CONSTRAINT fk_HD FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH)
-- Khoa ngoai cho bang CTTP
ALTER TABLE CTTP ADD CONSTRAINT fk01_CTTP FOREIGN KEY(SOHD) REFERENCES HOADON(SOHD)
ALTER TABLE CTTP ADD CONSTRAINT fk02_CTTP FOREIGN KEY(SOPHONG) REFERENCES PHONG(SOPHONG)

--Cau 2: Nhap du lieu
insert into KHACHHANG values('KH01', 'Nguyen Phu Kiet', 'Viet Nam', 19)
insert into KHACHHANG values('KH02', 'Hao Hien', 'Trung Quoc', 30)
insert into KHACHHANG values('KH03', 'David John', 'My', 22)

insert into PHONG values('PH01', 'Vip', 550.000, 'Available')
insert into PHONG values('PH02', 'Thuong', 300.000, 'Booked')
insert into PHONG values('PH03', 'Tot', 400.000, 'Booked') 

insert into HOADON values(0001, '14/02/2022', 'KH01')
insert into HOADON values(0002, '19/02/2022', 'KH03')
insert into HOADON values(0003, '10/03/2022', 'KH02')

insert into CTTP values(0001, 'PH02', '28/01/2022', '14/02/2022')
insert into CTTP values(0001, 'PH03', '10/02/2022', '14/02/2022')
insert into CTTP values(0002, 'PH02', '15/02/2022', '19/02/2022')
insert into CTTP values(0003, 'PH03', '17/03/2022', '10/03/2022')

--Cau 3: Rang buoc toan ven: Tuoi cua khach hang lon hon hoac bang 18
ALTER TABLE KHACHHANG 
ADD CHECK (TUOI >=18)

--Cau 4: Viet trigger hien thuc rang buoc toan ven: Ngayden nho hon hoac bang ngayhd

--Cau 5: Tim ma khach hang (MAKH) va TENKH cuar khach hang cos hoa don lap vao ngay 14/02/2022
SELECT K.MAKH, TENKH AS TEN
FROM KHACHHANG K INNER JOIN HOADON H
ON K.MAKH = H.MAKH
WHERE H.NGHD = '14/02/2022'

--Cau 6: Tim hoa don SOHD, NGHD da thue tat ca phong co loai phong la Tot
SELECT SOHD, NGHD
FROM HOADON H
WHERE NOT EXISTS(SELECT *
                 FROM PHONG P
				 WHERE NOT EXISTS(SELECT *
				                  FROM CTTP C
								  WHERE C.SOPHONG = P.SOPHONG AND C.SOHD = H.SOHD
								        AND P.LOAIPHONG = 'Tot')
				)
				 
--Cau 7: Tim loai phong SOPHONG, LOAIPHONG duoc khach hang thue nhieu nhat nam 2022
SELECT TOP 1 WITH TIES P.SOPHONG, LOAIPHONG, COUNT(SOHD) AS LANTHUE 
FROM PHONG P, CTTP C
WHERE P.SOPHONG IN (SELECT*
                    FROM CTTP
					WHERE YEAR(NGAYDI) = 2022)
GROUP BY P.SOPHONG
ORDER BY COUNT(SOHD) DESC

--Cau 8: Tong so phong da thue (Tong_so_phong) cua tung khach hang trong nam 2022 va sap xep thep ket qua giam dan ve so luong
SELECT H.MAKH, COUNT(SOPHONG) AS Tong_so_phong
FROM HOADON H, CTTP C
WHERE H.SOHD = C.SOHD AND H.SOHD IN (SELECT*
                                    FROM CTTP C
					                WHERE YEAR(NGAYDI) = 2022)
GROUP BY H.MAKH
ORDER BY COUNT(SOPHONG) DESC

                  