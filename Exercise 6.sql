--CAU 1--
USE QLBanhang;
BEGIN TRANSACTION
DELETE FROM CHITIETHOADON 
OUTPUT deleted.*
WHERE MAHD IN (
	SELECT H.MAHD
	FROM HOADON H
	WHERE H.MAKH = 'KH02');

DELETE FROM HOADON 
OUTPUT deleted.*
WHERE MAHD IN (
	SELECT H.MAHD
	FROM HOADON H
	WHERE H.MAKH = 'KH02');

DELETE FROM KHACHHANG
OUTPUT deleted.*
WHERE MAKH = 'KH02';
ROLLBACK TRANSACTION
--CAU 2--
USE QLBanhang;
BEGIN TRANSACTION
DELETE FROM CHITIETHOADON 
OUTPUT deleted.*
WHERE MAHD IN (
	SELECT H.MAHD
	FROM HOADON H
	RIGHT JOIN KHACHHANG K
	ON H.MAKH = K.MAKH
	WHERE K.DIACHI = 'TAN BINH');

DELETE FROM HOADON 
OUTPUT deleted.*
WHERE MAHD IN (
	SELECT H.MAHD
	FROM HOADON H
	RIGHT JOIN KHACHHANG K
	ON H.MAKH = K.MAKH
	WHERE K.DIACHI = 'TAN BINH');

DELETE FROM KHACHHANG
OUTPUT deleted.*
WHERE DIACHI = 'TAN BINH';
ROLLBACK TRANSACTION
--CAU 3--
USE QLBanhang;
BEGIN TRANSACTION
DELETE FROM CHITIETHOADON
OUTPUT deleted.*
WHERE MAVT IN (
	SELECT V.MAVT
	FROM VATTU V
	WHERE V.GIAMUA < 1000);

DELETE FROM VATTU
OUTPUT deleted.*
WHERE GIAMUA < 1000;
ROLLBACK TRANSACTION
--CAU 4--
BEGIN TRANSACTION
UPDATE CHITIETHOADON
SET GIABAN = (GIABAN + GIABAN * 0.1)
OUTPUT inserted.*, deleted.*
WHERE MAVT = 'VT05';
ROLLBACK TRANSACTION
--CAU 5--
BEGIN TRANSACTION
UPDATE CHITIETHOADON
SET GIABAN = (GIABAN + GIABAN * 0.1)
OUTPUT inserted.*, deleted.*
WHERE MAHD = 'HD001';
ROLLBACK TRANSACTION