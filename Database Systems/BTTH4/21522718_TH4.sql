-- 20. Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
SELECT COUNT(*)
FROM HOADON H
WHERE MAKH NOT IN(SELECT MAKH
FROM KHACHHANG K 
WHERE K.MAKH = H.MAKH)

--21. Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
SELECT COUNT (DISTINCT MASP)
FROM CTHD C INNER JOIN HOADON HD
ON C.SOHD = HD.SOHD
WHERE YEAR(NGHD) = '2006'

--22. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
SELECT MAX(TRIGIA) AS MAX, MIN(TRIGIA) AS MIN
FROM HOADON 

--23. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
SELECT AVG(TRIGIA)
FROM HOADON
WHERE YEAR(NGHD) = '2006'

--24. Tính doanh thu bán hàng trong năm 2006.
SELECT SUM(TRIGIA)
FROM HOADON
WHERE YEAR(NGHD) = '2006'

--25.Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
SELECT SOHD
FROM HOADON
WHERE TRIGIA = (SELECT MAX(TRIGIA)
                FROM HOADON
				WHERE YEAR(NGHD) = '2006')

--26. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
SELECT HOTEN
FROM KHACHHANG K INNER JOIN HOADON H
ON K.MAKH = H.MAKH
WHERE H.TRIGIA = (SELECT MAX(TRIGIA)
                  FROM HOADON
				  WHERE YEAR(NGHD) = '2006')

--27. In ra danh sách 3 khách hàng đầu tiên (MAKH, HOTEN) sắp xếp theo doanh số giảm dần.
SELECT TOP 3 MAKH, HOTEN
FROM KHACHHANG KH
ORDER BY DOANHSO DESC

--28. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
SELECT MASP, TENSP
FROM SANPHAM SP
WHERE SP.GIA IN (SELECT TOP 3 GIA
                FROM SANPHAM 
				ORDER BY GIA DESC)

--29. In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
SELECT MASP, TENSP
FROM SANPHAM SP
WHERE SP.NUOCSX = 'THAI LAN' 
      AND SP.GIA IN (SELECT TOP 3 GIA
                   FROM SANPHAM S
				   ORDER BY GIA DESC)

--30. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
SELECT MASP, TENSP
FROM SANPHAM SP
WHERE SP.NUOCSX = 'TRUNG QUOC' 
      AND SP.GIA IN (SELECT TOP 3 GIA
                   FROM SANPHAM S
				   WHERE S.NUOCSX = 'TRUNG QUOC'
				   ORDER BY GIA DESC)