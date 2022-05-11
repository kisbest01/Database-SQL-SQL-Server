USE QLBanhang;
--CAU 1--
SELECT H.MAHD, H.NGAY, K.TENKH, K.DIACHI, K.DT
FROM HOADON H
JOIN KHACHHANG K
ON H.MAKH = K.MAKH;
--CAU 2--
SELECT H.MAHD, K.TENKH, K.DIACHI, K.DT
FROM HOADON H
JOIN KHACHHANG K
ON H.MAKH = K.MAKH
WHERE H.NGAY = '20000525';
--CAU 3--
SELECT H.MAHD, H.NGAY, K.TENKH, K.DIACHI, K.DT
FROM HOADON H
JOIN KHACHHANG K
ON H.MAKH = K.MAKH
WHERE H.NGAY BETWEEN '20000601' AND '20000630';
--CAU 4--
SELECT DISTINCT K.TENKH, K.DIACHI, K.DT
FROM KHACHHANG K
JOIN HOADON H
ON H.MAKH = K.MAKH
WHERE H.NGAY BETWEEN '20000601' AND '20000630';
--CAU 5--
SELECT DISTINCT V.MAVT, V.TENVT
FROM VATTU V
JOIN CHITIETHOADON C
ON V.MAVT = C.MAVT
JOIN HOADON H
ON C.MAHD = H.MAHD
WHERE H.NGAY BETWEEN '20000101' AND '20000701';
--CAU 6--
SELECT V.MAVT, V.TENVT, K.TENKH, H.NGAY, C.SL
FROM VATTU V
JOIN CHITIETHOADON C
ON V.MAVT = C.MAVT
JOIN HOADON H
ON C.MAHD = H.MAHD
JOIN KHACHHANG K
ON H.MAKH = K.MAKH
WHERE H.NGAY BETWEEN '20000101' AND '20000701';
--CAU 7--
SELECT V.MAVT, V.TENVT, K.TENKH, H.NGAY, C.SL
FROM VATTU V
JOIN CHITIETHOADON C
ON V.MAVT = C.MAVT
JOIN HOADON H
ON C.MAHD = H.MAHD
JOIN KHACHHANG K
ON H.MAKH = K.MAKH
WHERE K.DIACHI = 'TAN BINH' AND H.NGAY BETWEEN '20000101' AND '20001231';
--CAU 8--
SELECT DISTINCT V.MAVT, V.TENVT
FROM VATTU V
JOIN CHITIETHOADON C
ON V.MAVT = C.MAVT
JOIN HOADON H
ON C.MAHD = H.MAHD
JOIN KHACHHANG K
ON H.MAKH = K.MAKH
WHERE K.DIACHI = 'TAN BINH' AND H.NGAY BETWEEN '20000101' AND '20001231';
--CAU 9--
SELECT TENKH, DIACHI, DT
FROM KHACHHANG
EXCEPT
SELECT DISTINCT K.TENKH, K.DIACHI, K.DT
FROM KHACHHANG K
JOIN HOADON H
ON H.MAKH = K.MAKH
WHERE H.NGAY BETWEEN '20000601' AND '20000630';