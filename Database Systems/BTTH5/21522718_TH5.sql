--36. Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
SELECT MASP, SUM(SL) AS TONGSO
FROM CTHD C INNER JOIN HOADON H
ON C.SOHD = H.SOHD
WHERE MONTH(H.NGHD) = '10' AND YEAR(H.NGHD) = '2006'
GROUP BY MASP

--37. Tính doanh thu bán hàng của từng tháng trong năm 2006.
SELECT MONTH(NGHD) AS THANG, SUM(TRIGIA) AS DOANHTHU
FROM HOADON
WHERE YEAR(NGHD) = '2006'
GROUP BY MONTH(NGHD)

--38. Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
SELECT SOHD
FROM CTHD
GROUP BY SOHD
HAVING COUNT(SOHD) >= 4

--39. Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
SELECT SOHD
FROM CTHD C INNER JOIN SANPHAM S
ON C.MASP = S.MASP
WHERE S.NUOCSX = 'VIET NAM' 
GROUP BY SOHD
HAVING COUNT(C.MASP) = 3 

--40. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
SELECT MAKH, HOTEN
FROM KHACHHANG
WHERE MAKH IN (SELECT TOP 1(MAKH)
               FROM HOADON
               GROUP BY MAKH
               ORDER BY COUNT(SOHD) DESC)

--41. Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
SELECT TOP 1(MONTH(NGHD)) AS THANGCN
FROM HOADON
WHERE YEAR(NGHD) = '2006'
GROUP BY MONTH(NGHD)
ORDER BY SUM(TRIGIA) DESC

--42. Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
SELECT MASP, TENSP
FROM SANPHAM S
WHERE S.MASP IN (SELECT TOP 1(MASP)
                 FROM CTHD C INNER JOIN HOADON H
                 ON C.SOHD = H.SOHD
                 WHERE YEAR(NGHD) = '2006'
                 GROUP BY MASP
                 ORDER BY SUM(SL) ASC)

--43. Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
SELECT A.NUOCSX, B.MASP, B.TENSP
FROM (SELECT NUOCSX, MAX(GIA) AS MAX
FROM SANPHAM 
GROUP BY NUOCSX) AS A LEFT JOIN SANPHAM B
ON A.MAX = B.GIA
WHERE A.NUOCSX = B.NUOCSX

--44. Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
SELECT NUOCSX 
FROM SANPHAM
GROUP BY NUOCSX 
HAVING COUNT(DISTINCT GIA) >= 3

--45. Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất
SELECT MAKH
FROM  KHACHHANG
WHERE MAKH IN (SELECT HD.MAKH
               FROM  HOADON HD INNER JOIN KHACHHANG K
               ON HD.MAKH=K.MAKH 
			   WHERE DOANHSO IN (SELECT TOP 10 DOANHSO
                                 FROM  KHACHHANG
                                 ORDER BY DOANHSO DESC) 
              GROUP BY HD.MAKH
              HAVING COUNT(SOHD)>=ALL(SELECT  COUNT(SOHD)
                                      FROM  HOADON HD INNER JOIN KHACHHANG K
                                      ON HD.MAKH=K.MAKH 
									  WHERE DOANHSO IN (SELECT TOP 10 DOANHSO
                                                        FROM  KHACHHANG
                                                        ORDER BY DOANHSO DESC)  
                                      GROUP BY HD.MAKH)
	          )