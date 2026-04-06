CREATE DATABASE QLDETAI;

-- 1. Viết các câu lệnh SQL tạo các quan hệ trên với các kiểu dữ liệu mô tả trong bảng sau (tạo các ràng buộc khóa chính, khóa ngoại tương ứng):
-- Tạo bảng SINHVIEN
CREATE TABLE SINHVIEN (
    MSSV CHAR(8) PRIMARY KEY,
    TENSV NVARCHAR(30) NOT NULL,
    SODT VARCHAR(10) NOT NULL,
    LOP CHAR(10) NOT NULL,
    DIACHI NCHAR(50) NOT NULL
);

-- tạo bảng DETAI
CREATE TABLE DETAI (
     MSDT CHAR(6) PRIMARY KEY,
	 TENDT NVARCHAR(30) NOT NULL
);

-- Tạo bảng SV_DETAI
CREATE TABLE SV_DETAI (
    MSSV CHAR(8),
    MSDT CHAR(6),
    PRIMARY KEY (MSSV, MSDT),
    FOREIGN KEY (MSSV) REFERENCES SINHVIEN(MSSV),
    FOREIGN KEY (MSDT) REFERENCES DETAI(MSDT)
);

-- Tạo bảng HOCHAM
CREATE TABLE HOCHAM (
    MSHH INT PRIMARY KEY,
    TENHH NVARCHAR(20) NOT NULL
);


-- Tạo bảng GIAOVIEN
CREATE TABLE GIAOVIEN (
    MSGV INT PRIMARY KEY,
    TENGV NVARCHAR(30) NOT NULL,
    DIACHI NVARCHAR(50) NOT NULL,
    SODT VARCHAR(10) NOT NULL,
    MSHH INT NOT NULL,
    NAMHH SMALLDATETIME NOT NULL,
    FOREIGN KEY (MSHH) REFERENCES HOCHAM(MSHH)
);

-- Tạo bảng HOCVI
CREATE TABLE HOCVI (
    MSHV INT PRIMARY KEY,
    TENHV NVARCHAR(20) NOT NULL
);

-- Tạo bảng CHUYENNGANH
CREATE TABLE CHUYENNGANH (
    MSCN INT PRIMARY KEY,
    TENCN NVARCHAR(30) NOT NULL
);

-- Tạo bảng GV_HV_CN
CREATE TABLE GV_HV_CN (
    MSGV INT,
    MSHV INT,
    MSCN INT,
    NAM SMALLDATETIME,
    PRIMARY KEY (MSGV, MSHV, MSCN),
    FOREIGN KEY (MSGV) REFERENCES GIAOVIEN(MSGV),
    FOREIGN KEY (MSHV) REFERENCES HOCVI(MSHV),
    FOREIGN KEY (MSCN) REFERENCES CHUYENNGANH(MSCN)
);

-- Tạo bảng GV_HDDT
CREATE TABLE GV_HDDT (
    MSGV INT,
    MSDT CHAR(6),
    DIEM FLOAT,
    PRIMARY KEY (MSGV, MSDT),
    FOREIGN KEY (MSGV) REFERENCES GIAOVIEN(MSGV),
    FOREIGN KEY (MSDT) REFERENCES DETAI(MSDT)
);

-- Tạo bảng GV_PBDT
CREATE TABLE GV_PBDT (
    MSGV INT,
    MSDT CHAR(6),
    DIEM FLOAT,
    PRIMARY KEY (MSGV, MSDT),
    FOREIGN KEY (MSGV) REFERENCES GIAOVIEN(MSGV),
    FOREIGN KEY (MSDT) REFERENCES DETAI(MSDT)
);

-- Tạo bảng GV_UVDT
CREATE TABLE GV_UVDT (
    MSGV INT,
    MSDT CHAR(6),
    DIEM FLOAT,
    PRIMARY KEY (MSGV, MSDT),
    FOREIGN KEY (MSGV) REFERENCES GIAOVIEN(MSGV),
    FOREIGN KEY (MSDT) REFERENCES DETAI(MSDT)
);

-- Tạo bảng HOIDONG
CREATE TABLE HOIDONG (
    MSHD INT PRIMARY KEY,
    PHONG INT,
    TGBD SMALLDATETIME,
    NGAYHD SMALLDATETIME,
    TINHTRANG NVARCHAR(30),
    MSGV INT,
    FOREIGN KEY (MSGV) REFERENCES GIAOVIEN(MSGV)
);

-- Tạo bảng HOIDONG_GV
CREATE TABLE HOIDONG_GV (
    MSHD INT,
    MSGV INT,
    PRIMARY KEY (MSHD, MSGV),
    FOREIGN KEY (MSHD) REFERENCES HOIDONG(MSHD),
    FOREIGN KEY (MSGV) REFERENCES GIAOVIEN(MSGV)
);

-- Tạo bảng HOIDONG_DT
CREATE TABLE HOIDONG_DT (
    MSHD INT,
    MSDT CHAR(6),
    QUYETDINH NCHAR(10),
    PRIMARY KEY (MSHD, MSDT),
    FOREIGN KEY (MSHD) REFERENCES HOIDONG(MSHD),
    FOREIGN KEY (MSDT) REFERENCES DETAI(MSDT)
);

-- 2. Insert dữ liệu vào CSDL:

-- Chèn dữ liệu vào bảng SINHVIEN
INSERT INTO SINHVIEN (MSSV, TENSV, SODT, LOP, DIACHI) VALUES
('13520001', N'Nguyễn Văn An', '0906762255', 'SE103.U32', N'THỦ ĐỨC'),
('13520002', N'Phan Tấn Đạt', '0975672350', 'IE204.T21', N'QUẬN 1'),
('13520003', N'Nguyễn Anh Hải', '0947578688', 'IE205.R12', N'QUẬN 9'),
('13520004', N'Phạm Tài', '0956757869', 'IE202.A22', N'QUẬN 1'),
('13520005', N'Lê Thúy Hằng', '0976668688', 'SE304.E22', N'THỦ ĐỨC'),
('13520006', N'Ưng Hồng Ân', '0957475898', 'IE208.F33', N'QUẬN 2');

-- Chèn dữ liệu vào bảng DETAI
INSERT INTO DETAI (MSDT, TENDT) VALUES
('97001', N'Quản lý thư viện'),
('97002', N'Nhận dạng vân tay'),
('97003', N'Bán đấu giá trên mạng'),
('97004', N'Quản lý siêu thị'),
('97005', N'Xử lý ảnh'),
('97006', N'Hệ giải toán thông minh');

-- Chèn dữ liệu bảng SV_DETAI
INSERT INTO SV_DETAI (MSSV, MSDT) VALUES
('13520001', '97004'),
('13520002', '97005'),
('13520003', '97001'),
('13520004', '97002'),
('13520005', '97003'),
('13520006', '97005');

-- Chèn dữ liệu vào bảng HOCHAM
INSERT INTO HOCHAM (MSHH, TENHH) VALUES
(1, N'PHÓ GIÁO SƯ'),
(2, N'GIÁO SƯ');

-- Chèn dữ liệu vào bảng GIAOVIEN
INSERT INTO GIAOVIEN (MSGV, TENGV, DIACHI, SODT, MSHH, NAMHH) VALUES
('00201', N'Trần Trung', N'Bến Tre', '35353535', 1, '1996-01-01'),
('00202', N'Nguyễn Văn An', N'Tiềng Giang', '67868688', 1, '1996-01-01'),
('00203', N'Trần Thu Trang', N'Cần Thơ', '74758687', 1, '1996-01-01'),
('00204', N'Nguyễn Thị Loan', N'TP. HCM', '56575868', 2, '2005-01-01'),
('00205', N'Chu Tiến', N'Hà Nội', '46466646', 2, '2005-01-01');

-- Chèn dữ liệu vào bảng HOCVI
INSERT INTO HOCVI (MSHV, TENHV) VALUES
(1, N'Kỹ sư'),
(2, N'Cử nhân'),
(3, N'Thạc sĩ'),
(4, N'Tiến sĩ'),
(5, N'Tiến sĩ Khoa học');

-- Chèn dữ liệu vào bảng CHUYENNGANH
INSERT INTO CHUYENNGANH (MSCN, TENCN) VALUES
(1, N'Công nghệ Web'),
(2, N'Mạng xã hội'),
(3, N'Quản lý CNTT'),
(4, N'GIS');

-- Chèn dữ liệu vào bảng GV_HV_CN
INSERT INTO GV_HV_CN (MSGV, MSHV, MSCN, NAM) VALUES
('00201', 1, 1, 2013),
('00201', 1, 2, 2013),
('00201', 2, 1, 2014),
('00202', 3, 2, 2013),
('00203', 2, 4, 2014),
('00204', 3, 2, 2014);

-- Chèn dữ liệu vào bảng GV_HDDT
INSERT INTO GV_HDDT (MSGV, MSDT, DIEM) VALUES
('00201', '97001', 8),
('00202', '97002', 7),
('00205', '97001', 9),
('00204', '97004', 7),
('00203', '97005', 9);

-- Chèn dữ liệu vào bảng GV_PBDT
INSERT INTO GV_PBDT (MSGV, MSDT, DIEM) VALUES
('00201', '97005', 8),
('00202', '97001', 7),
('00205', '97004', 9),
('00204', '97003', 7),
('00203', '97002', 9);

-- Chèn dữ liệu vào bảng GV_UVDT
INSERT INTO GV_UVDT (MSGV, MSDT, DIEM) VALUES
('00205', '97005', 8),
('00202', '97005', 7),
('00204', '97005', 9),
('00203', '97001', 7),
('00204', '97001', 9),
('00205', '97001', 8),
('00203', '97003', 7),
('00201', '97003', 9),
('00202', '97003', 7),
('00201', '97004', 9),
('00202', '97004', 8),
('00203', '97004', 7),
('00201', '97002', 9),
('00204', '97002', 7),
('00205', '97002', 9),
('00201', '97006', 9),
('00202', '97006', 7),
('00204', '97006', 9);

-- Chèn dữ liệu vào bảng HOIDONG
INSERT INTO HOIDONG (MSHD, PHONG, TGBD, NGAYHD, TINHTRANG, MSGV) VALUES
(1, 2, '07:00', '2014-11-29', N'Thật', '00201'),
(2, 102, '07:00', '2014-12-05', N'Thật', '00202'),
(3, 3, '08:00', '2014-12-06', N'Thật', '00203');

-- Chèn dữ liệu vào bảng HOIDONG_GV
INSERT INTO HOIDONG_GV (MSHD, MSGV) VALUES
(1, '00201'),
(1, '00202'),
(1, '00203'),
(1, '00204'),
(2, '00203'),
(2, '00202'),
(2, '00205'),
(2, '00204'),
(3, '00201'),
(3, '00202'),
(3, '00203'),
(3, '00204');

-- Chèn dữ liệu vào bảng HOIDONG_DT
INSERT INTO HOIDONG_DT (MSHD, MSDT, QUYETDINH) VALUES
(1, '97001', N'Được'),
(1, '97002', N'Được'),
(2, '97001', N'Không'),
(2, '97004', N'Không'),
(1, '97005', N'Được'),
(3, '97001', N'Không'),
(3, '97002', N'Được');


-- 3. Hãy tạo các đối tượng sau. Có ví dụ minh họa và kết quả thực thi các câu 
-- với các trường hợp đúng/sai (Một số ví dụ trường hợp đúng/sai hãy thực thi 
-- bằng thông tin của bạn).

-- A. STORED PROCEDUREDS VỚI THAM SỐ VÀO
--  1. Tham số vào là MSGV, TENGV, SODT, DIACHI, MSHH, NAMHH. Trước khi insert 
-- dữ liệu cần kiểm tra MSHH đã tồn tại trong table HOCHAM chưa, nếu chưa thì 
-- trả về giá trị 0.  
-- Kiểm tra thông tin của bạn có trong bảng SINHVIEN hay không
GO
CREATE PROCEDURE insertGV @MSGV int, @tengv nvarchar(30), @sodt varchar(10), @DIACHI nvarchar(50), @MSHH int, @NAMHH smalldatetime
AS
    IF NOT EXISTS (SELECT MSHH FROM HOCHAM WHERE MSHH = @MSHH)
    BEGIN
        PRINT N'Mã học hàm không hợp lệ!';
		RETURN 0
    END
	ELSE
    BEGIN
        INSERT INTO GIAOVIEN (MSGV, TENGV, DIACHI, SODT, MSHH, NAMHH) VALUES (@MSGV, @tengv, @DIACHI, @sodt, @MSHH, @NAMHH);
        PRINT N'Thêm giáo viên thành công!';
    END;

EXEC insertGV  '00210', N'Nguyễn Trinh', N'Hải Phòng', '35353535', 1, '2000-01-01';

-- 2. Tham số vào là MSGV, TENGV, SODT, DIACHI, MSHH, NAMHH. Trước khi insert 
-- dữ liệu cần kiểm tra MSGV trong table GIAOVIEN có trùng không, nếu trùng thì 
-- trả về giá trị 0.
GO
CREATE PROCEDURE insertGV01 @MSGV int, @tengv nvarchar(30), @sodt varchar(10), @DIACHI nvarchar(50), @MSHH int, @NAMHH smalldatetime
AS
    IF EXISTS (SELECT MSGV FROM GIAOVIEN WHERE MSGV = @MSGV)
    BEGIN
        PRINT N'Mã số giáo viên đã tồn tại!';
		RETURN 0
    END
	ELSE
    BEGIN
        INSERT INTO GIAOVIEN (MSGV, TENGV, DIACHI, SODT, MSHH, NAMHH) VALUES (@MSGV, @tengv, @DIACHI, @sodt, @MSHH, @NAMHH);
        PRINT N'Thêm giáo viên thành công!';
    END;

EXEC insertGV01  '00201', N'Nguyễn Trinh', N'Hải Phòng', '35353535', 1, '2000-01-01';
-- 3. Giống (1) và (2) kiểm tra xem MSGV có trùng không? MSHH có tồn tại chưa? 
-- Nếu MSGV trùng thì trả về 0. Nếu MSHH chưa tồn tại trả về 1, ngược lại cho 
-- insert dữ liệu.
GO
CREATE PROCEDURE insertGV02 @MSGV int, @tengv nvarchar(30), @sodt varchar(10), @DIACHI nvarchar(50), @MSHH int, @NAMHH smalldatetime
AS
    IF EXISTS (SELECT MSGV FROM GIAOVIEN WHERE MSGV = @MSGV)
    BEGIN
        PRINT N'Mã số giáo viên đã tồn tại!';
		RETURN 0
	END
    ELSE IF NOT EXISTS (SELECT MSHH FROM HOCHAM WHERE MSHH = @MSHH)
    BEGIN
        PRINT N'Mã học hàm chưa tồn tại!';
		RETURN 1
    END
	ELSE
    BEGIN
        INSERT INTO GIAOVIEN (MSGV, TENGV, DIACHI, SODT, MSHH, NAMHH) VALUES (@MSGV, @tengv, @DIACHI, @sodt, @MSHH, @NAMHH);
        PRINT N'Thêm giáo viên thành công!';
    END;

EXEC insertGV02  '00211', N'Nguyễn Trinh', N'Hải Phòng', '35353535', 1, '2000-01-01';

-- 4. Đưa vào MSDT cũ, TENDT mới. Hãy cập nhật tên đề tài mới với mã đề tài cũ 
-- không đổi nếu không tìm thấy trả về 0, ngược lại cập nhật và trả về 1.
GO
CREATE PROCEDURE updateDT @msdt char(6), @TENDT nvarchar(30)
AS
    IF NOT EXISTS (SELECT MSDT FROM DETAI WHERE MSDT = @msdt)
    BEGIN
        PRINT N'Mã số đề tài chưa tồn tại!';
		RETURN 0
	END
    ELSE 
    BEGIN
	    UPDATE DETAI
        SET TENDT = @TENDT
        WHERE MSDT = @msdt;
        PRINT N'Đã cập nhật tên đề tài của đề tài có mã số ' + @msdt;
		RETURN 1
    END;

EXEC updateDT  '97010', N'Quản lý phòng giáo vụ';

-- 5. Tham số đưa vào MSSV, TENSV mới, DIACHI mới dùng để cập nhật sinh viên trên, 
-- nếu không tìm thấy trả về 0, ngược lại cập nhật và trả về 1.
GO
CREATE PROCEDURE updateSV @MSSV int, @TENSV nvarchar(30), @DIACHI nvarchar(50)
AS
BEGIN
    IF NOT EXISTS (SELECT MSSV FROM SINHVIEN WHERE MSSV = @MSSV)
    BEGIN
        PRINT N'Mã số sinh viên chưa tồn tại!';
        RETURN 0;
    END
    ELSE 
    BEGIN
        UPDATE SINHVIEN
        SET TENSV = @TENSV, DIACHI = @DIACHI
        WHERE MSSV = @MSSV;
        
        PRINT N'Đã cập nhật tên và địa chỉ mới của sinh viên có mã số ' + CAST(@MSSV AS nvarchar(10));
        RETURN 1;
    END
END;


EXEC updateSV 13520001, N'Nguyễn Thị Mai Trinh', N'Quận 12';

--B. STORED PROCEDUREDS VỚI THAM SỐ VÀO VÀ RA
--1. Đưa vào TENHV trả ra: Số GV thỏa học vị, nếu không tìm thấy trả về 0.
GO
CREATE PROC PROC_B1 @tenhv NVARCHAR(20), @soluonggv INT OUTPUT
AS
BEGIN
	IF EXISTS (SELECT * FROM HOCVI WHERE TENHV = @tenhv)
		BEGIN
			SELECT @soluonggv = COUNT(*)
			FROM HOCVI, GV_HV_CN
			WHERE HOCVI.MSHV = GV_HV_CN.MSHV AND TENHV = @tenhv
		END
	ELSE
		BEGIN
			PRINT N'Tên học vị không tồn tại!'
			SET @soluonggv = 0
		END
END
GO

---- 1.1. THUC THI VA KIEM TRA
DECLARE @tenhv NVARCHAR(20), @soluonggv INT
SET @tenhv = N'Cử nhân'
EXEC PROC_B1 @tenhv, @soluonggv OUTPUT
PRINT N'Số giáo viên có học vị ' + @tenhv + N' là: ' + CAST(@soluonggv AS NVARCHAR)

GO
DECLARE @tenhv NVARCHAR(20), @soluonggv INT
SET @tenhv = N'Giáo sư'
EXEC PROC_B1 @tenhv, @soluonggv OUTPUT
PRINT N'Số giáo viên có học vị ' + @tenhv + N' là: ' + CAST(@soluonggv AS NVARCHAR)
---- 1.2. XÓA
DROP PROC PROC_B1
GO;

--2. Đưa vào MSDT cho biết: Điểm trung bình của đề tài, nếu không tìm thấy trả về 0.
CREATE PROC PROC_B2 @msdt CHAR(6), @diemtb FLOAT OUTPUT
AS
BEGIN
	IF EXISTS (SELECT * FROM DETAI WHERE MSDT = @msdt)
		BEGIN
			SELECT @diemtb = (G1.DIEM + G2.DIEM + G3.DIEM)/3
			FROM GV_HDDT G1, GV_PBDT G2, GV_UVDT G3
			WHERE G1.MSDT = G2.MSDT AND G2.MSDT = G3.MSDT 
		END
	ELSE
		BEGIN
			PRINT N'Mã số đề tài không tồn tại!'
			SET @diemtb = 0
		END
END
GO

---- 2.1. THUC THI VA KIEM TRA
DECLARE @msdt CHAR(6), @diemtb FLOAT 
SET @msdt = 97001
EXEC PROC_B2 @msdt, @diemtb OUTPUT
PRINT N'Điểm trung bình của đề tài ' + @msdt + N'là: ' + CAST(@diemtb AS NVARCHAR)

---- 2.2. XOA
DROP PROC PROC_B2
GO;

--3.  
--3.1.1 Đưa vào TENGV trả ra: SDT của giáo viên đó, nếu không tìm thấy trả về 0.
--Nếu trùng tên thì có báo lỗi không? Tại sao?
CREATE PROC PROC_B3 @tengv NVARCHAR(30), @sodt VARCHAR(10) OUTPUT
AS
	BEGIN
	IF EXISTS (SELECT * FROM GIAOVIEN WHERE TENGV= @tengv)
		BEGIN
		SELECT @sodt=SODT FROM GIAOVIEN
		WHERE TENGV= @tengv
		END
	ELSE
		BEGIN
		PRINT N'Tên giáo viên không tồn tại!'
		SET @sodt = 0
		END
	END

---- 3.1.2. THUC THI VA KIEM TRA
GO
DECLARE @tengv NVARCHAR(30), @sodt VARCHAR(10)
SET @tengv =N'Mai Trinh'
EXEC PROC_B3 @tengv, @sodt OUTPUT
PRINT N'Số điện thoại của giáo viên ' + @tengv + N' là: ' + CAST(@sodt AS NVARCHAR);

---- 3.1.3. Tên trùng thì có báo lỗi hay không ?
INSERT INTO GIAOVIEN (MSGV, TENGV, DIACHI, SODT, MSHH, NAMHH) VALUES ('00206', N'Trần Trung', N'Hải Phòng', '09353535', 1, '1998-01-01');
PRINT N'Thêm giáo viên thành công!';

select * from giaovien;

DECLARE @tengv NVARCHAR(30), @sodt VARCHAR(10)
SET @tengv =N'Trần Trung'
EXEC PROC_B3 @tengv, @sodt OUTPUT
PRINT N'Số điện thoại của giáo viên ' + @tengv + N' là: ' + CAST(@sodt AS NVARCHAR);
---- 3.1.3. XOA
DROP PROC PROC_B3

--3.2.1 Làm sao để hiện thông báo có bao nhiêu giáo viên trùng tên và trả về các SDT.
GO
CREATE PROCEDURE PROC_B3_2 @tengv NVARCHAR(30), @sodt CURSOR VARYING OUTPUT
AS
BEGIN
	IF (SELECT COUNT(MSGV) FROM GIAOVIEN WHERE TENGV = @tengv) > 1 
	BEGIN
		PRINT N'Trùng tên giáo viên!'
	END
	SET @sodt = CURSOR FOR SELECT SODT FROM GIAOVIEN WHERE TENGV = @tengv
	OPEN @sodt 
END
GO

---- 3.2.2. THUC THI VA KIEM TRA
DECLARE @MyCursor CURSOR											
EXEC PROC_B3_2 N'Trần Trung', @sodt = @MyCursor OUTPUT	
DECLARE @SDT VARCHAR(10)
FETCH @MyCursor INTO @SDT 
IF(@@FETCH_STATUS <> 0)
	PRINT 0 
ELSE
	BEGIN
		WHILE (@@FETCH_STATUS = 0) 
		BEGIN
			PRINT @SDT 
			FETCH NEXT FROM @MyCursor INTO @SDT 
		END 
		CLOSE @MyCursor 
		DEALLOCATE @MyCursor 
	END

----3.2.3. KHOI PHUC
DELETE FROM GIAOVIEN WHERE MSGV=00206

---- 3.2.4. XOA
DROP PROC PROC_B3_2

---4. Đưa vào MSHD cho biết: Điểm trung bình các đề tài của hội đồng đó.
GO
CREATE PROC PROC_B4 @mshd INT, @diemtb FLOAT OUTPUT
AS
BEGIN
	IF EXISTS (SELECT * FROM HOIDONG_DT WHERE MSHD = @mshd)
	BEGIN
		SELECT DT.MSDT AS 'MaDeTai', AVG(DT.DIEM) AS 'DiemTrungBinh'
		FROM
		(
			SELECT G1.MSDT, DIEM FROM GV_HDDT G1 INNER JOIN HOIDONG_DT H ON G1.MSDT=H.MSDT WHERE MSHD = @mshd
			UNION ALL
			SELECT G2.MSDT, DIEM FROM GV_PBDT G2 INNER JOIN HOIDONG_DT H ON G2.MSDT=H.MSDT WHERE MSHD = @mshd
			UNION ALL
			SELECT G3.MSDT, DIEM FROM GV_UVDT G3 INNER JOIN HOIDONG_DT H ON G3.MSDT=H.MSDT WHERE MSHD = @mshd
		) AS DT
		GROUP BY DT.MSDT
	END
	ELSE
	BEGIN
		PRINT N'Hội đồng không tồn tại!'
	END
END

---- 4.1. THUC THI VA KIEM TRA 
GO
DECLARE @mshd INT, @diemtb FLOAT 
SET @mshd = 1
EXEC PROC_B4 @mshd, @diemtb OUTPUT
PRINT @diemtb

DECLARE @mshd INT, @diemtb FLOAT 
SET @mshd = 10
EXEC PROC_B4 @mshd, @diemtb OUTPUT
PRINT @diemtb
----4.2 XOA
DROP PROC PROC_B4

--5*. Đưa vào TENGV cho biết: Số đề tài hướng dẫn, số đề tài phản biện do giáo
--viên đó phụ trách. 
GO
CREATE PROCEDURE PROC_5 @tengv NVARCHAR(30), @soluong_dt_hd INT OUTPUT, @soluong_dt_pb INT OUTPUT
AS
BEGIN
		SELECT @soluong_dt_hd = COUNT(MSDT) 
		FROM GIAOVIEN INNER JOIN GV_HDDT ON GV_HDDT.MSGV = GIAOVIEN.MSGV 
		WHERE TENGV = @tengv 

		SELECT @soluong_dt_pb = COUNT(MSDT) 
		FROM GIAOVIEN INNER JOIN GV_PBDT ON GV_PBDT.MSGV = GIAOVIEN.MSGV 
		WHERE TENGV = @tengv 
END 

select * from giaovien;
---5.1.1 THUC THI VA KIEM TRA 
DECLARE @DT_HD INT, @DT_PB INT, @tengv NVARCHAR(30)
SET @tengv= N'Chu Tiến'
EXEC PROC_5 @tengv, @DT_HD OUTPUT, @DT_PB OUTPUT
PRINT N'Số đề tài hướng dẫn ' + CAST(@DT_HD AS NVARCHAR(5))
PRINT N'Số đề tài phản biện ' + CAST(@DT_PB AS NVARCHAR(5))

INSERT INTO GIAOVIEN (MSGV, TENGV, DIACHI, SODT, MSHH, NAMHH) VALUES ('00206', N'Trần Trung', N'Hải Phòng', '09353535', 1, '1998-01-01');
PRINT N'Thêm giáo viên thành công!';
DECLARE @DT_HD INT, @DT_PB INT, @tengv NVARCHAR(30)
SET @tengv= N'Chu Tiến'
EXEC PROC_5 @tengv, @DT_HD OUTPUT, @DT_PB OUTPUT
PRINT N'Số đề tài hướng dẫn ' + CAST(@DT_HD AS NVARCHAR(5))
PRINT N'Số đề tài phản biện ' + CAST(@DT_PB AS NVARCHAR(5))
----5.1.2 XOA
DROP PROC PROC_5

--Nếu trùng tên thì có báo lỗi không hay hệ thống sẽ đếm tất cả các đề tài của những giáo viên trùng tên đó?
GO
CREATE PROCEDURE PROC_B5_2 @tengv NVARCHAR(30), @dem_dt CURSOR VARYING OUTPUT
AS
BEGIN
    DECLARE @soluonggv INT;
    SET @soluonggv = (SELECT COUNT(*) FROM GIAOVIEN
                      WHERE TENGV = @tengv);
    IF (@soluonggv > 1)
	BEGIN
	    SELECT COUNT(MSGV) as soluonggv FROM GIAOVIEN WHERE TENGV = @tengv
		PRINT N'Có ' + CAST(@soluonggv AS NVARCHAR(5)) + N' trùng tên giáo viên ' + @tengv 
	END
	SET @dem_dt = CURSOR FOR SELECT G.MSGV, COUNT(G2.MSDT), COUNT(G1.MSDT) 
							 FROM GIAOVIEN G FULL OUTER JOIN GV_PBDT G1 ON G1.MSGV = G.MSGV 
										     FULL OUTER JOIN GV_HDDT G2 ON G2.MSGV = G.MSGV 
							 WHERE TENGV = @tengv 
							 GROUP BY G.MSGV 
	OPEN @dem_dt 
END 

---5.2.1 THUC THI VA KIEM TRA 

DECLARE @CURSOR_DEMDT CURSOR,@tengv NVARCHAR(30), @MSGV NVARCHAR(30), @SO_DTHD INT, @SO_DTPB INT
SET @tengv= N'Trần Trung'
EXEC PROC_B5_2 @tengv, @dem_dt = @CURSOR_DEMDT OUTPUT
FETCH @CURSOR_DEMDT INTO @MSGV, @SO_DTHD, @SO_DTPB 
IF(@@FETCH_STATUS = 0)
	BEGIN
		 WHILE(@@FETCH_STATUS = 0)
		BEGIN
			PRINT @MSGV + N' - Số đề tài hướng dẫn: ' + CAST(@SO_DTHD AS NVARCHAR(5)) 
			+ N', số đề tài phản biện: ' + CAST(@SO_DTPB AS NVARCHAR(5))
			FETCH NEXT FROM @CURSOR_DEMDT INTO @MSGV, @SO_DTHD, @SO_DTPB 
		END
		CLOSE @CURSOR_DEMDT 
		DEALLOCATE @CURSOR_DEMDT 
	END
ELSE
	PRINT '0'

----5.2.2 KHOI PHUC
DELETE FROM GIAOVIEN WHERE MSGV=00206

----5.2.3 XOA
DROP PROC PROC_B5_2

SELECT * FROM SINHVIEN;
SELECT * FROM DETAI;
SELECT * FROM SV_DETAI;
SELECT * FROM HOCHAM;
SELECT * FROM GIAOVIEN;
SELECT * FROM HOCVI;
SELECT * FROM CHUYENNGANH;
SELECT * FROM GV_HV_CN;
SELECT * FROM GV_HDDT;
SELECT * FROM GV_PBDT;
SELECT * FROM GV_UVDT;
SELECT * FROM HOIDONG;
SELECT * FROM HOIDONG_GV;
SELECT * FROM HOIDONG_DT;
--C. TRIGGER
--1. Tạo Trigger thỏa mãn điều kiện khi xóa một đề tài sẽ xóa các thông tin liên quan.
GO
CREATE TRIGGER TRG_DELETE_DETAI ON DETAI INSTEAD OF DELETE
AS
BEGIN
	DECLARE @msdt CHAR(6)
		SELECT @msdt = MSDT FROM DELETED
		DELETE FROM SV_DETAI WHERE MSDT = @msdt 
		DELETE FROM HOIDONG_DT WHERE MSDT = @msdt 
		DELETE FROM DETAI WHERE MSDT = @msdt 
		DELETE FROM GV_HDDT WHERE MSDT = @msdt 
		DELETE FROM GV_PBDT WHERE MSDT = @msdt 
		DELETE FROM GV_UVDT WHERE MSDT = @msdt 
END

-- 1.1 KIỂM TRA
DELETE FROM DETAI WHERE MSDT = '97001'

--1.2 XÓA
DROP TRIGGER TRG_DELETE_DETAI

--2. Tạo Trigger thỏa mãn ràng buộc là một hội đồng không quá 10 đề tài. Dùng 
--“Group by” có được không? Giải thích.
GO
CREATE TRIGGER TRIG_INSERT_HDDT_SLDT
ON HOIDONG_DT
FOR INSERT
AS
BEGIN
-- LOGIC
-- 1. DEM DUOC SLDT TRONG 1 HD NHUNG KO DUNG GROUP BY
IF (SELECT COUNT(*)
	FROM HOIDONG_DT, INSERTED
	WHERE HOIDONG_DT.MSHD = INSERTED.MSHD) > 10
	BEGIN
		ROLLBACK TRANSACTION
		RAISERROR (N'1 HĐ KHÔNG QUÁ 10 ĐỀ TÀI', 16, 1)
	RETURN
	END
-- 2. TRONG TRIGGER CO CAM SU DUNG GROUP BY HAY KO?
IF (SELECT COUNT(*)
	FROM HOIDONG_DT, INSERTED
	WHERE HOIDONG_DT.MSHD = INSERTED.MSHD
	GROUP BY INSERTED.MSHD) > 10
	BEGIN
		ROLLBACK TRANSACTION
		RAISERROR (N'1 HĐ KHÔNG QUÁ 10 ĐỀ TÀI', 16, 1)
	RETURN
	END
END
GO

---- 2.2. KIỂM TRA
---- 2.2.1. KIỂM TRA VỚI INSERT
INSERT INTO HOIDONG_DT VALUES(1,'97003',N'Được') -- BÁO LỖI -> TRIGGER đúng

SELECT * FROM HOIDONG_DT;
---- 2.2.2. KIỂM TRA DỮ LIỆU TRONG BẢNG
DELETE FROM HOIDONG_DT WHERE MSDT = '97003';

SELECT * FROM HOIDONG_DT

---- 2.3. XÓA
DROP TRIGGER TRIG_INSERT_HDDT_SLDT

--3. Tạo Trigger thỏa mãn ràng buộc là một đề tài không quá 3 sinh viên. Dùng 
--“Group by” có được không? Giải thích. 
go
CREATE TRIGGER TRIG_INSERT_SVDETAI_DETAI
ON SV_DETAI
FOR INSERT
AS
BEGIN
	IF (SELECT COUNT(*)
	FROM SV_DETAI, INSERTED
	WHERE SV_DETAI.MSDT = INSERTED.MSDT
	GROUP BY Inserted.MSDT) > 3
	BEGIN
		ROLLBACK TRANSACTION
		RAISERROR (N'Mỗi đề tài không quá 3 sinh viên', 16, 1)
		RETURN
	END
END

--3.1 KIEM TRA
-- INSERT 2 SINH VIEN
INSERT INTO SINHVIEN VALUES('13520007','Nguyễn Văn A','0906762256','SE103.U32','Quận 1')
INSERT INTO SINHVIEN VALUES('13520008','Nguyễn Văn B','0906762257','SE103.U32','Quận 1')
INSERT INTO SV_DETAI VALUES('13520007','97005') -- KHÔNG BÁO LỖI -> TRGGER ĐÚNG
INSERT INTO SV_DETAI VALUES('13520008','97005') -- BÁO LỖI -> TRIGGER SAI

--3.2 KIỂM TRA DỮ LIỆU TRONG BẢNG
SELECT * FROM SV_DETAI

--3.3 KHÔI PHỤC DỮ LIỆU
DELETE FROM SV_DETAI WHERE MSSV = '13520007'
DELETE FROM SINHVIEN WHERE MSSV = '13520007'
DELETE FROM SINHVIEN WHERE MSSV = '13520008'

--3.4 XÓA
DROP TRIGGER TRIG_INSERT_SVDETAI_DETAI

--4. Tạo Trigger thỏa mãn ràng buộc là một giáo viên muốn có học hàm PGS 
--phải là tiến sĩ.
--- Lệnh tạo Trigger sửa cho bảng GIAOVIEN
GO
CREATE TRIGGER TRG_GIAOVIEN_UPDATE 
ON GIAOVIEN 
FOR UPDATE 
AS 
BEGIN
		IF (SELECT MSHV 
			FROM GV_HV_CN G, Inserted I
			WHERE I.MSGV = G.MSGV AND I.MSHH = 1 ) <> 4 -- MSHH = 1: PGS, MSHV = 4: Tiến sĩ
		BEGIN
		ROLLBACK TRANSACTION
		RAISERROR (N'Một giáo viên muốn có học hàm PGS phải là tiến sĩ', 16, 1)
		RETURN
		END
END

--4.1.1 KIEM TRA
INSERT INTO GIAOVIEN VALUES(00206,N'Nguyễn Văn A',N'hải Phòng','12345678',2,'2003')
INSERT INTO GV_HV_CN VALUES(00206,3,2,'2018')
UPDATE GIAOVIEN SET MSHH=1 WHERE MSGV='00206'--KHÔNG UPDATE ĐƯỢC 
INSERT INTO GIAOVIEN VALUES(00207,N'Nguyễn Văn B',N'hải Phòng','12345678',2,'2003')
INSERT INTO GV_HV_CN VALUES(00207,4,1,'2018')
UPDATE GIAOVIEN SET MSHH=1 WHERE MSGV='00207'-- UPDATE ĐƯỢC

 
--4.1.2 KIỂM TRA DỮ LIỆU TRONG BẢNG
SELECT * FROM GIAOVIEN

--4.1.3 KHÔI PHỤC DỮ LIỆU
DELETE FROM GV_HV_CN WHERE MSGV = 00206
DELETE FROM GIAOVIEN WHERE MSGV = 00206
DELETE FROM GV_HV_CN WHERE MSGV = 00207
DELETE FROM GIAOVIEN WHERE MSGV = 00207

--4.1.4 XÓA
DROP TRIGGER TRG_GIAOVIEN_UPDATE

--D. FUNCTION
--1. Viết hàm tính điểm trung bình của một đề tài. Giá trị trả về là điểm trung
--bình ứng với mã số đề tài nhập vào
go
CREATE FUNCTION D1(@msdt CHAR(6)) RETURNS FLOAT
AS
BEGIN
-- DTB = 3 GV CHAM DIEM CONG LAI CHIA 3
-- 3 BANG: GV_HD_DT, GV_PB_DT, GV_UV_DT
DECLARE @dtb FLOAT
	IF EXISTS (SELECT * FROM DETAI WHERE MSDT = @msdt)
	BEGIN
		SELECT @dtb = AVG(DIEM)
		FROM
		(SELECT * FROM GV_HDDT UNION
		SELECT * FROM GV_PBDT UNION
		SELECT * FROM GV_UVDT) AS DIEMTONGHOP
		WHERE MSDT = @msdt
	END

	IF @DTB IS NULL
	SET @DTB = 0
	RETURN @DTB
END
go
-- KIEM TRA
SELECT DBO.D1('97002') AS DTB

--2. Trả về kết quả của đề tài theo MSDT nhập vào. Kết quả là DAT nếu như 
--điểm trung bình từ 5 trở lên, và KHONGDAT nếu như điểm trung bình dưới 5. 
GO
CREATE FUNCTION D2 (@msdt CHAR(6)) RETURNS CHAR(8)
AS
BEGIN
	DECLARE @KQ CHAR(8)
	IF (DBO.D1(@msdt)) >= 5 
		SET @KQ = N'ĐẠT'
	ELSE 
		SET @KQ = N'KHÔNG ĐẠT'
	RETURN @KQ 
END
GO

--KIỂM TRA 
SELECT *, dbo.D1(MSDT)
AS DIEMDT, dbo.D2(MSDT) AS KETQUA 
FROM dbo.DETAI 

--3. Đưa vào MSDT, trả về mã số và họ tên của các sinh viên thực hiện đề tài.
GO
CREATE FUNCTION SVDETAI (@msdt CHAR(6))
RETURNS TABLE
AS
 RETURN (SELECT SINHVIEN.MSSV, TENSV 
		FROM SV_DETAI,SINHVIEN  
		WHERE SINHVIEN.MSSV = SV_DETAI.MSSV AND MSDT = @msdt)
GO

-- KIEM TRA
SELECT * FROM SVDETAI ('97002')

GO
-- E. CURSOR
CREATE TABLE DETAI_DIEM (MSDT CHAR(6) PRIMARY KEY,DIEMTB FLOAT )

--1. Viết Cursor tính điểm trung bình cho từng đề tài. Sau đó lưu kết quả vào
--bảng DETAI_DIEM.
DECLARE @DUYET CURSOR, @msdt CHAR(6), @dtb FLOAT
SET @DUYET = CURSOR FOR SELECT MSDT FROM DETAI
OPEN @DUYET
FETCH NEXT FROM @DUYET INTO @msdt
WHILE @@FETCH_STATUS = 0
BEGIN
SELECT @dtb = DBO.D1(@msdt)
INSERT INTO DETAI_DIEM VALUES (@msdt, @dtb)
FETCH NEXT FROM @DUYET INTO @msdt
END
CLOSE @DUYET
DEALLOCATE @DUYET

GO

--KIEM TRA
SELECT * FROM DETAI_DIEM

--XOA
DROP TABLE dbo.DETAI_DIEM
--2. Gom các bước xử lý của Cursor ở câu 1 vào một Stored Procedure.
GO
CREATE PROC E2
AS
BEGIN
	DECLARE @DUYET CURSOR, @msdt CHAR(6), @DTB FLOAT
	SET @DUYET = CURSOR FOR SELECT MSDT FROM DETAI
	OPEN @DUYET
	FETCH NEXT FROM @DUYET INTO @msdt
	WHILE @@FETCH_STATUS = 0
	BEGIN
	SELECT @DTB = DBO.D1(@msdt)
	INSERT INTO DETAI_DIEM VALUES (@msdt, @DTB)
	FETCH NEXT FROM @DUYET INTO @msdt
	END
	CLOSE @DUYET
	DEALLOCATE @DUYET
END
--KIEMTRA
EXEC dbo.E2
SELECT * FROM DETAI_DIEM
--XOA
DROP PROC dbo.E2
--3*. Tạo thêm cột XEPLOAI có kiểu là NVARCCHAR(20) trong bảng DETAI_DIEM

ALTER TABLE dbo.DETAI_DIEM ADD XEPLOAI NVARCHAR(20)

DECLARE @DUYET CURSOR, @msdt CHAR(6),@diemtb FLOAT
	SET @DUYET = CURSOR FOR SELECT MSDT FROM dbo.DETAI_DIEM
	OPEN @DUYET
	FETCH NEXT FROM @DUYET INTO @msdt
	WHILE @@FETCH_STATUS = 0
	BEGIN
	IF @msdt IN (SELECT MSDT 
				FROM dbo.DETAI_DIEM 
				WHERE DIEMTB>=9 AND DIEMTB <=10) 
		BEGIN
		UPDATE dbo.DETAI_DIEM
		SET XEPLOAI = N'Xuất sắc'
		WHERE MSDT=@msdt
		END
	ELSE IF @msdt IN (SELECT MSDT 
					FROM dbo.DETAI_DIEM 
					WHERE DIEMTB>=8 AND DIEMTB <9) 
		BEGIN
		UPDATE dbo.DETAI_DIEM
		SET XEPLOAI=N'Giỏi'
		WHERE MSDT=@msdt
		END
	ELSE IF @msdt IN (SELECT MSDT 
					FROM dbo.DETAI_DIEM 
					WHERE DIEMTB>=7 AND DIEMTB <8) 
		BEGIN
		UPDATE dbo.DETAI_DIEM
		SET XEPLOAI=N'Khá'
		WHERE MSDT=@msdt
		END
	ELSE IF @msdt IN (SELECT MSDT 
					FROM dbo.DETAI_DIEM 
					WHERE DIEMTB>=5 AND DIEMTB <6) 
		BEGIN
		UPDATE dbo.DETAI_DIEM
		SET XEPLOAI=N'Trung Bình '
		WHERE MSDT=@msdt
		END
	ELSE IF @msdt IN(SELECT MSDT 
					FROM dbo.DETAI_DIEM 
					WHERE DIEMTB <5) 
		BEGIN
		UPDATE dbo.DETAI_DIEM
		SET XEPLOAI=N'Không đạt'
		WHERE MSDT=@msdt
		END
	FETCH NEXT FROM @DUYET INTO @msdt
	END
	CLOSE @DUYET
	DEALLOCATE @DUYET

--KIEM TRA
SELECT * FROM dbo.DETAI_DIEM

SELECT * FROM 

