CREATE DATABASE QLDETAI;

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


-- Chèn dữ liệu vào bảng

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


-- TRUY VẤN ---
-- 1. Danh sách giáo viên gồm mã số GV, Tên GV, Địa chỉ, Số ĐT, tên học hàm của GV:
SELECT G.MSGV, G.TENGV, G.DIACHI, G.SODT, H.TENHH
FROM GIAOVIEN G
INNER JOIN HOCHAM H
ON G.MSHH = H.MSHH;

-- 2. Danh sách đề tài và tên GVHD tương ứng:
SELECT D.MSDT, D.TENDT, G.TENGV AS 'TenGVHD'
FROM DETAI D
INNER JOIN GV_HDDT ON D.MSDT = GV_HDDT.MSDT
INNER JOIN GIAOVIEN  G ON GV_HDDT.MSGV = G.MSGV;

-- 3. Số lượng đề tài đã hướng dẫn ứng với từng giáo viên
SELECT GV_HDDT.MSGV, G.TENGV, COUNT(*) AS 'SoLuongDeTai'
FROM GV_HDDT
INNER JOIN GIAOVIEN  G 
ON GV_HDDT.MSGV = G.MSGV
GROUP BY GV_HDDT.MSGV, G.TENGV;

-- 4. Danh sách giảng viên chưa hướng dẫn đề tài nào:
SELECT G.MSGV, G.TENGV
FROM GIAOVIEN G
WHERE NOT EXISTS (SELECT * 
                     FROM GIAOVIEN G  JOIN GV_HDDT
                     ON G.MSGV = GV_HDDT.MSGV)

-- 5. Giáo viên hướng dẫn nhiều đề tài nhất
SELECT TOP 1 WITH TIES GV_HDDT.MSGV, G.TENGV, COUNT(*) AS 'SoLuongDeTai'
FROM GV_HDDT INNER JOIN GIAOVIEN G 
ON GV_HDDT.MSGV = G.MSGV
GROUP BY GV_HDDT.MSGV, G.TENGV
ORDER BY COUNT(*) DESC;

-- 6. Tìm sinh viên với thông tin của bạn MSSV/Họ tên của bạn? Nếu không có hãy thực hiện thao tác thêm vào thông tin của bạn:
-- Kiểm tra thông tin của bạn có trong bảng SINHVIEN hay không
CREATE PROCEDURE SelectSV @MSSV int, @HOTEN nvarchar(30)
AS
    IF EXISTS (SELECT MSSV FROM SINHVIEN WHERE MSSV = @MSSV AND TENSV = @HOTEN)
    BEGIN
        SELECT MSSV, TENSV, SODT, LOP, DIACHI
		FROM SINHVIEN WHERE MSSV = @MSSV;
    END
    ELSE 
    BEGIN
        INSERT INTO SINHVIEN (MSSV, TENSV, SODT, LOP, DIACHI) VALUES (@MSSV, @HOTEN, '0906762255', 'SE103.U32', N'THỦ ĐỨC');
        PRINT N'Thêm sinh viên thành công!';
    END;

EXEC SelectSV  21522718, N'Nguyễn Thị Mai Trinh';
EXEC SelectSV  13520001, N'Nguyễn Văn An';


-- 7. Xóa sinh viên với thông tin của bạn:
-- Xóa sinh viên với thông tin của bạn (ví dụ: MSSV = 'Your_MSSV')
ALTER PROCEDURE DeleteSV 
    @MSSV INT
AS
BEGIN
    -- Kiểm tra xem sinh viên có trong bảng SINHVIEN hay không
    IF EXISTS (SELECT MSSV FROM SINHVIEN WHERE MSSV = @MSSV)
    BEGIN
        -- Nếu sinh viên có trong bảng SINHVIEN, thực hiện xóa
        DELETE FROM SINHVIEN WHERE MSSV = @MSSV;
        PRINT N'Đã xóa sinh viên có mã số ' + CAST(@MSSV AS NVARCHAR(10));
    END
    ELSE
    BEGIN
        -- Nếu sinh viên không có trong bảng SINHVIEN
        PRINT N'Sinh viên có mã số ' + CAST(@MSSV AS NVARCHAR(10)) + N' không tồn tại trong danh sách.';
    END
END

EXEC DeleteSV  21522718;

-- 8. Danh sách GV và học vị cao nhất của họ:
SELECT G.MSGV, G.TENGV, HOCVI.TENHV AS TEN_HOC_VI, C.TENCN
FROM GIAOVIEN G 
JOIN GV_HV_CN AS GV1 ON G.MSGV = GV1.MSGV
JOIN HOCVI ON HOCVI.MSHV = GV1.MSHV
JOIN CHUYENNGANH C ON C.MSCN = GV1.MSCN
WHERE GV1.NAM = (SELECT MAX(NAM)
                 FROM GV_HV_CN
                 WHERE MSGV = GV1.MSGV AND MSCN = GV1.MSCN)
GROUP BY GV1.MSCN, G.MSGV, G.TENGV, HOCVI.TENHV, C.TENCN;


-- 9. Liệt kê danh sách GV như sau: MSGV, <Tên học vị  Tên GV>. 
SELECT CONCAT(G.MSGV, ', ', 
              CASE 
                  WHEN H.MSHV = 1 THEN N'Kỹ sư' 
				  WHEN H.MSHV = 2 THEN N'Cử nhân' 
				  WHEN H.MSHV = 3 THEN N'Thạc sĩ' 
				  WHEN H.MSHV = 4 THEN N'Tiến sĩ' 
				  WHEN H.MSHV = 5 THEN N'Tiến sĩ khoa học' 
                  ELSE N'' 
              END, ' ', TENGV, ' - ', C.TENCN) AS 'MSGV_TENGV'
FROM GIAOVIEN G 
JOIN GV_HV_CN ON G.MSGV = GV_HV_CN.MSGV
JOIN HOCVI H ON H.MSHV = GV_HV_CN.MSHV
JOIN CHUYENNGANH C ON GV_HV_CN.MSCN = C.MSCN;



