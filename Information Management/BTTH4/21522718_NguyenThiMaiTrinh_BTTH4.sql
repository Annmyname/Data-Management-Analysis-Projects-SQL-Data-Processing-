------- Câu 2 -------------
---B----
-- Tạo các user từ u1 đến u5
CREATE LOGIN u1 WITH PASSWORD = '999999';
CREATE LOGIN u2 WITH PASSWORD = '999999';
CREATE LOGIN u3 WITH PASSWORD = '999999';
CREATE LOGIN u4 WITH PASSWORD = '999999';
CREATE LOGIN u5 WITH PASSWORD = '999999';

-- Tạo user với họ tên
CREATE LOGIN NguyenThiMaiTrinh WITH PASSWORD = '999999';
-- Tạo user trong cơ sở dữ liệu cụ thể
USE QLYDETAI;
CREATE USER u1 FOR LOGIN u1;
CREATE USER u2 FOR LOGIN u2;
CREATE USER u3 FOR LOGIN u3;
CREATE USER u4 FOR LOGIN u4;
CREATE USER u5 FOR LOGIN u5;
CREATE USER NguyenThiMaiTrinh FOR LOGIN NguyenThiMaiTrinh;


USE QLYDETAI;
-- Tạo các role r1, r2, r3 trong cơ sở dữ liệu
CREATE ROLE r1;
CREATE ROLE r2;
CREATE ROLE r3;

USE QLYDETAI;

-- Gán user u1 vào role r1
EXEC sp_addrolemember 'r1', 'u1';

-- Gán user u2 và u3 vào role r2
EXEC sp_addrolemember 'r2', 'u2';
EXEC sp_addrolemember 'r2', 'u3';

-- Gán user u4, u5 và NguyenVanA vào role r3
EXEC sp_addrolemember 'r3', 'u4';
EXEC sp_addrolemember 'r3', 'u5';
EXEC sp_addrolemember 'r3', 'NguyenThiMaiTrinh';

-- Gán quyền SysHIEUTRUONG cho role r1
EXEC sp_addsrvrolemember 'u1', 'sysHIEUTRUONG';

-- Gán quyền db_owner và db_accessHIEUTRUONG cho role r2
USE QLYDETAI;
EXEC sp_addrolemember 'db_owner', 'r2';
EXEC sp_addrolemember 'db_accessHIEUTRUONG', 'r2';

-- Gán quyền SysHIEUTRUONG, db_owner và db_accessHIEUTRUONG cho role r3
EXEC sp_addsrvrolemember 'u3', 'sysHIEUTRUONG';
EXEC sp_addrolemember 'db_owner', 'r3';
EXEC sp_addrolemember 'db_accessHIEUTRUONG', 'r3';

----C-------
-- Tạo login cho các user
CREATE LOGIN test1 WITH PASSWORD = '999999';
CREATE LOGIN test2 WITH PASSWORD = '999999';
CREATE LOGIN u_NguyenThiMaiTrinh WITH PASSWORD = '999999'; 

-- Tạo user trong cơ sở dữ liệu Quản lý đề tài
USE QLYDETAI; 
CREATE USER test1 FOR LOGIN test1;
CREATE USER test2 FOR LOGIN test2;
CREATE USER u_NguyenThiMaiTrinh FOR LOGIN u_NguyenThiMaiTrinh; 
-- Phân quyền cho U1
GRANT SELECT, DELETE ON T1 TO test1;
GRANT SELECT, DELETE ON T3 TO test1;
DENY INSERT ON T1 TO test1;
DENY INSERT ON T2 TO test1;

-- Phân quyền cho U2
GRANT UPDATE, DELETE ON T2 TO test2;
DENY DELETE ON T3 TO test2;

-- Phân quyền cho U_HoTencuaBan
GRANT INSERT ON T1 TO u_NguyenThiMaiTrinh;
GRANT INSERT ON T2 TO u_NguyenThiMaiTrinh;
GRANT INSERT ON T3 TO u_NguyenThiMaiTrinh;

---BÀI 3
--------3.1-------
-- Tạo login và user cho GIANGVIEN
CREATE LOGIN GIANGVIEN WITH PASSWORD = '999999';
USE QLYDETAI;
CREATE USER GIANGVIEN FOR LOGIN GIANGVIEN;

-- Tạo login và user cho GIAOVU
CREATE LOGIN GIAOVU WITH PASSWORD = '999999';
USE QLYDETAI;
CREATE USER GIAOVU FOR LOGIN GIAOVU;

-- Tạo login và user cho SINHVIEN
CREATE LOGIN SINHVIEN WITH PASSWORD = '999999';
USE QLYDETAI;
CREATE USER SINHVIEN FOR LOGIN SINHVIEN;
--------3.2------
-- GIAOVU có quyền xem và chỉnh sửa (cập nhật) trên tất cả các bảng
USE QLYDETAI;
CREATE TABLE BangThongTinSV (
    MaSV INT PRIMARY KEY,
    TenSV NVARCHAR(100),
);
-- Tạo bảng ThongTinGV
CREATE TABLE BangThongTinGV (
    MaGV INT PRIMARY KEY,
    TenGV NVARCHAR(100),
);

-- Tạo bảng DeTaiHuongDan
CREATE TABLE BangDeTaiHuongDan (
    MaDeTai INT PRIMARY KEY,
    TenDeTai NVARCHAR(100),
);

-- Tạo bảng PhanBien
CREATE TABLE BangPhanBien (
    MaPhanBien INT PRIMARY KEY,
    TenPhanBien NVARCHAR(100),
);

-- Tạo bảng BangUyVien
CREATE TABLE BangUyVien (
    MaUyVien INT PRIMARY KEY,
    TenUyVien NVARCHAR(100),
);

-- Tạo bảng HoiDong
CREATE TABLE BangHoiDong (
    MaHoiDong INT PRIMARY KEY,
    TenHoiDong NVARCHAR(100),
);

-- Tạo bảng DanhSachDeTai
CREATE TABLE BangDanhSachDeTai (
    MaDeTai INT PRIMARY KEY,
    TenDeTai NVARCHAR(100),
);
USE QLYDETAI
GRANT SELECT, UPDATE ON SCHEMA :: dbo TO GIAOVU;

-- GIANGVIEN có quyền xem các bảng liên quan đến thông tin GV, các đề tài mà GV hướng dẫn, phản biện hay làm uỷ viên, xem thông tin hội đồng và danh sách các đề tài hiện có
GRANT SELECT ON dbo.BangThongTinGV TO GIANGVIEN;       
GRANT SELECT ON dbo.BangDeTaiHuongDan TO GIANGVIEN;    
GRANT SELECT ON dbo.BangPhanBien TO GIANGVIEN;        
GRANT SELECT ON dbo.BangUyVien TO GIANGVIEN;          
GRANT SELECT ON dbo.BangHoiDong TO GIANGVIEN;          
GRANT SELECT ON dbo.BangDanhSachDeTai TO GIANGVIEN;    

-- GIANGVIEN có quyền cập nhật thông tin của mình
GRANT UPDATE ON dbo.BangThongTinGV TO GIANGVIEN;

-- SINHVIEN có quyền xem thông tin của sinh viên, thông tin của hội đồng và danh sách các đề tài hiện có
GRANT SELECT ON dbo.BangThongTinSV TO SINHVIEN;       
GRANT SELECT ON dbo.BangHoiDong TO SINHVIEN;
GRANT SELECT ON dbo.BangDanhSachDeTai TO SINHVIEN;

-- Tất cả người dùng trên đều không có quyền xoá thông tin
DENY DELETE ON SCHEMA :: dbo TO GIANGVIEN;
DENY DELETE ON SCHEMA :: dbo TO GIAOVU;
DENY DELETE ON SCHEMA :: dbo TO SINHVIEN;

-- Tạo login cho HIEUTRUONG
CREATE LOGIN HIEUTRUONG WITH PASSWORD = 'HIEUTRUONG';

-- Tạo user HIEUTRUONG trong cơ sở dữ liệu QLYDETAI
USE QLYDETAI;
CREATE USER HIEUTRUONG FOR LOGIN HIEUTRUONG;

-- Phân quyền cho HIEUTRUONG
GRANT SELECT ON SCHEMA::dbo TO HIEUTRUONG; -- Cho phép xem tất cả các bảng trong schema dbo
GRANT UPDATE ON dbo.HIEUTRUONG_thongtin TO HIEUTRUONG; -- Cho phép cập nhật thông tin trong bảng HIEUTRUONG_thongtin
GRANT UPDATE ON dbo.hoidong TO HIEUTRUONG; -- Cho phép cập nhật thông tin trong bảng hoidong
GRANT UPDATE ON dbo.danhsach_detai TO HIEUTRUONG; -- Cho phép cập nhật thông tin trong bảng danhsach_detai
GRANT DELETE ON dbo.HIEUTRUONG_thongtin TO HIEUTRUONG; -- Cho phép xóa thông tin trong bảng HIEUTRUONG_thongtin
GRANT DELETE ON dbo.hoidong TO HIEUTRUONG; -- Cho phép xóa thông tin trong bảng hoidong
GRANT DELETE ON dbo.danhsach_detai TO HIEUTRUONG; -- Cho phép xóa thông tin trong bảng danhsach_detai


