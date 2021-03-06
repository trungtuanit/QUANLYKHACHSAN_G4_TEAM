CREATE DATABASE DATA_QUAN_LY_KHACH_SAN
USE DATA_QUAN_LY_KHACH_SAN 

GO
--1.Table LOAI_KHACH_HANG
CREATE TABLE LOAI_KHACH_HANG (
	MaLoaiKhach VARCHAR(10) NOT NULL,
	TenLoaiKhach NVARCHAR(50) NOT NULL,
	GhiChu NTEXT DEFAULT '',
)

--2.Table KHACH_HANG
CREATE TABLE KHACH_HANG (
	MaKhachHang VARCHAR(10) NOT NULL,
	TenKhachHang NVARCHAR(50) NOT NULL,
	CMND NVARCHAR(15) NOT NULL,
	GIOITINH char(3) NOT NULL,
	SDT int NOT NULL,
	DiaChi NVARCHAR(50) NOT NULL,
	MaLoaiKhach VARCHAR(10) NOT NULL,
)

GO
--3.BANG LOAI_PHONG
CREATE TABLE LOAI_PHONG (
	MaLoaiPhong VARCHAR(10) NOT NULL,
	TenLoaiPhong NVARCHAR(50) NOT NULL,
	DonGia MONEY DEFAULT 0,
)

GO
--4.Table PHONG
CREATE TABLE PHONG (
	MaPhong VARCHAR(10) NOT NULL,
	TenPhong NVARCHAR(10) NOT NULL,
	TinhTrang NVARCHAR(10) NOT NULL,
	MaLoaiPhong VARCHAR(10) NOT NULL,
	GhiChu NTEXT DEFAULT '',
)

GO
--5.BANG PHIEU_THUE_PHONG
CREATE TABLE PHIEU_THUE_PHONG (
	MaPhieuThue VARCHAR(10) NOT NULL,
	NgayBatDauThue DATE NOT NULL,
	MaPhong VARCHAR(10) NOT NULL,
)

GO
--6.BANG CHI_TIET_PHIEU_THUE
CREATE TABLE CHI_TIET_PHIEU_THUE (
	MaChiTietPT VARCHAR(10) NOT NULL,
	MaKhachHang VARCHAR(10) NOT NULL,
	MaPhieuThue VARCHAR(10) NOT NULL,
)

GO
--7.BANG HOA_DON
CREATE TABLE HOA_DON (
	MaHoaDon VARCHAR(10) NOT NULL,
	TenKhachHang NVARCHAR(50) NOT NULL,
	TriGia MONEY DEFAULT 0,
)

GO
--8.BANG CHI_TIET_HOA_DON
CREATE TABLE CHI_TIET_HOA_DON (
	MaChiTietHD VARCHAR(10) NOT NULL,
	MaHoaDon VARCHAR(10) NOT NULL,
	SoNgayThue INT NOT NULL,
	DonGia MONEY DEFAULT 0,
	ThanhTien MONEY DEFAULT 0,
	NgayThanhToan DATE,
	MaPhong VARCHAR(10) NOT NULL,
)
GO
--9.BANG THAM_SO
CREATE TABLE THAM_SO (
	SoKhachToiDa INT NOT NULL,
	PhuThu FLOAT NOT NULL,
	HeSo FLOAT NOT NULL,
	SoNgayThue INT,
	PhuThuKhachThu INT,
	SLKhachNuocNgoai INT
)
GO
--10.BANG BAOCAO_DOANHTHUTHEOLOAIPHONG
CREATE TABLE BAOCAO_DOANHTHUTHEOLOAIPHONG (
	MaBCDoanhThu VARCHAR(10) NOT NULL,
	ThangBaoCao VARCHAR(10) NOT NULL,
)
GO
--11. BANG CHITIET_BAOCAODOANHTHU
CREATE TABLE CHITIET_BAOCAODOANHTHU (
	MaBCCTDoanhThu VARCHAR(10) NOT NULL,
	MaLoaiPhong VARCHAR(10) NOT NULL,
	MaBCDoanhThu VARCHAR(10) NOT NULL,
	DoanhThuThang MONEY,
	TiLe CHAR(10),
)

GO
--15. BANG DANH_MUC
CREATE TABLE DANH_MUC (
	DMLoaiPhong NVARCHAR(50)
)

-------------------------------------------KHOA CHINH--------------------------------------------
--1 KHOA CHINH CHO BANG KHACH_HANG
ALTER TABLE KHACH_HANG ADD CONSTRAINT P_KHACH_HANG PRIMARY KEY (MaKhachHang)

--2 KHOA CHINH CHO BANG LOAI_KHACH_HANG
ALTER TABLE LOAI_KHACH_HANG ADD CONSTRAINT P_LOAI_KHACH_HANG PRIMARY KEY (MaLoaiKhach)

--3 KHOA CHINH CHO BANG PHONG
ALTER TABLE PHONG ADD CONSTRAINT P_PHONG PRIMARY KEY (MaPhong)

--4 KHOA CHINH CHO BANG LOAI_PHONG
ALTER TABLE LOAI_PHONG ADD CONSTRAINT P_LOAI_PHONG PRIMARY KEY (MaLoaiPhong)

--5 KHOA CHINH CHO BANG PHIEU_THUE_PHONG
ALTER TABLE PHIEU_THUE_PHONG ADD CONSTRAINT P_PHIEU_THUE_PHONG PRIMARY KEY (MaPhieuThue)

--6 KHOA CHINH CHO BANG CHI_TIET_PHIEU_THUE
ALTER TABLE CHI_TIET_PHIEU_THUE ADD CONSTRAINT P_CHI_TIET_PHIEU_THUE PRIMARY KEY (MaChiTietPT, MaKhachHang)

--7 KHOA CHINH CHO BANG HOA_DON
ALTER TABLE HOA_DON ADD CONSTRAINT P_HOA_DON PRIMARY KEY (MaHoaDon)

--8 KHOA CHINH CHO BANG CHI_TIET_HOA_DON
ALTER TABLE CHI_TIET_HOA_DON ADD CONSTRAINT P_CHI_TIET_HOA_DON PRIMARY KEY (MaChiTietHD)

--10 KHOA CHINH CHO BANG BAOCAO_DOANHTHUTHEOLOAIPHONG
ALTER TABLE BAOCAO_DOANHTHUTHEOLOAIPHONG ADD CONSTRAINT P_BAOCAO_DOANHTHUTHEOLOAIPHONG PRIMARY KEY (MaBCDoanhThu)

--11 KHOA CHINH CHO BANG CHITIET_BAOCAODOANHTHU
ALTER TABLE CHITIET_BAOCAODOANHTHU ADD CONSTRAINT P_CHITIET_BAOCAODOANHTHU PRIMARY KEY (MaBCCTDoanhThu, MaLoaiPhong)




--------------------------------------------KHOA NGOAI-----------------------------------------
--1 KHOA NGOAI CHO BANG KHACH_HANG
ALTER TABLE KHACH_HANG ADD CONSTRAINT F_KHACH_HANG FOREIGN KEY (MaLoaiKhach) REFERENCES LOAI_KHACH_HANG

--2 KHOA NGOAI CHO BANG PHONG
ALTER TABLE PHONG ADD CONSTRAINT F_PHONG FOREIGN KEY (MaLoaiPhong) REFERENCES LOAI_PHONG

--3 KHOA NGOAI CHO BANG PHIEU_THUE_PHONG
ALTER TABLE PHIEU_THUE_PHONG ADD CONSTRAINT F_PHIEU_THUE_PHONG FOREIGN KEY (MaPhong) REFERENCES PHONG

--4 KHOA NGOAI CHO BANG CHI_TIET_PHIEU_THUE
ALTER TABLE CHI_TIET_PHIEU_THUE ADD CONSTRAINT F_CHI_TIET_PHIEU_THUE_1 FOREIGN KEY (MaKhachHang) REFERENCES KHACH_HANG

ALTER TABLE CHI_TIET_PHIEU_THUE ADD CONSTRAINT F_CHI_TIET_PHIEU_THUE_2 FOREIGN KEY (MaPhieuThue) REFERENCES PHIEU_THUE_PHONG

--5 KHOA NGOAI CHO BANG CHI_TIET_HOA_DON
ALTER TABLE CHI_TIET_HOA_DON ADD CONSTRAINT F_CHI_TIET_HOA_DON_1 FOREIGN KEY (MaHoaDon) REFERENCES HOA_DON

ALTER TABLE CHI_TIET_HOA_DON ADD CONSTRAINT F_CHI_TIET_HOA_DON_2 FOREIGN KEY (MaPhong) REFERENCES PHONG

--6 KHOA NGOAI CHO BANG CHITIET_BAOCAODOANHTHU
ALTER TABLE CHITIET_BAOCAODOANHTHU ADD CONSTRAINT F_CHITIET_BAOCAODOANHTHU FOREIGN KEY (MaBCDoanhThu) REFERENCES BAOCAO_DOANHTHUTHEOLOAIPHONG


GO
SET DATEFORMAT dmy;


GO
--THEM DU LIEU CHO BANG LOAI_KHACH_HANG
INSERT INTO LOAI_KHACH_HANG VALUES ('LK001', N'Nội địa', N'')
INSERT INTO LOAI_KHACH_HANG VALUES ('LK002', N'Nước ngoài', N'')

GO
--THEM DU LIEU CHO BANG KHACH_HANG
INSERT INTO KHACH_HANG VALUES (1, N'Phan Văn A', '275649386', N'Đồng Nai', 'LK001')
INSERT INTO KHACH_HANG VALUES (2, N'Lý Thị B', '234154687', N'Lâm Đồng', 'LK002')
INSERT INTO KHACH_HANG VALUES (3, N'Đào Văn C', '234987896', N'An Giang', 'LK001')

--INSERT INTO KHACH_HANG VALUES ('KH004', N'Trần Thị D', '214376778', N'Vũng Tàu', 'LK001')
--INSERT INTO KHACH_HANG VALUES ('KH005', N'Nguyễn Ngọc E', '212132435', N'Huế', 'LK002')
--INSERT INTO KHACH_HANG VALUES ('KH006', N'Phan Thị F', '277665876', N'Bình Dương', 'LK001')
--INSERT INTO KHACH_HANG VALUES ('KH007', N'Nguyễn Tiến G', '298445673', N'Long An', 'LK001')
--INSERT INTO KHACH_HANG VALUES ('KH008', N'Đoàn Huy H', '254365547', N'Bạc Liêu', 'LK002')

GO
--THEM DU LIEU CHO BANG LOAI_PHONG
INSERT INTO LOAI_PHONG VALUES ('LP001', N'A', 150000)
INSERT INTO LOAI_PHONG VALUES ('LP002', N'B', 170000)
INSERT INTO LOAI_PHONG VALUES ('LP003', N'C', 200000)

GO
--THEM DU LIEU CHO BANG PHONG
INSERT INTO PHONG VALUES (1, N'Trống', 'LP002', N'nhìn ra biển, giường đôi')
INSERT INTO PHONG VALUES (2, N'Đầy', 'LP003', N'giường đơn')
INSERT INTO PHONG VALUES (3, N'Trống', 'LP001', N'giường đôi')
INSERT INTO PHONG VALUES (4, N'Đầy', 'LP001', N'nhìn ra biển, giường đơn')
INSERT INTO PHONG VALUES (5, N'Đầy', 'LP003', N'nhìn ra biển, giường đơn')
INSERT INTO PHONG VALUES (6, N'Sửa chữa', 'LP002', N'giường đôi')

INSERT INTO PHONG VALUES (7, N'Trống', 'LP002', N'nhìn ra biển, giường đôi')
INSERT INTO PHONG VALUES (8, N'Trống', 'LP002', N'nhìn ra biển, giường đơn')
INSERT INTO PHONG VALUES (9, N'Trống', 'LP001', N'nhìn ra biển, giường đôi')
INSERT INTO PHONG VALUES (10, N'Trống', 'LP003', N'nhìn ra biển, giường đơn')
INSERT INTO PHONG VALUES (11, N'Trống', 'LP003', N'giường đơn')
INSERT INTO PHONG VALUES (12, N'Trống', 'LP002', N'giường đơn')
INSERT INTO PHONG VALUES (13, N'Sửa chữa', 'LP001', N'nhìn ra biển, giường đơn')
INSERT INTO PHONG VALUES (14, N'Trống', 'LP001', N'giường đôi')
INSERT INTO PHONG VALUES (15, N'Trống', 'LP002', N'nhìn ra biển, giường đôi')
INSERT INTO PHONG VALUES (16, N'Trống', 'LP003', N'nhìn ra biển, giường đơn')
INSERT INTO PHONG VALUES (17, N'Trống', 'LP002', N'giường đôi')
INSERT INTO PHONG VALUES (18, N'Trống', 'LP003', N'giường đơn')
INSERT INTO PHONG VALUES (19, N'Trống', 'LP001', N'giường đơn')
INSERT INTO PHONG VALUES (20, N'Trống', 'LP003', N'giường đơn')
INSERT INTO PHONG VALUES (21, N'Sửa chữa', 'LP003', N'giường đôi')
INSERT INTO PHONG VALUES (22, N'Trống', 'LP002', N'giường đôi')
INSERT INTO PHONG VALUES (23, N'Trống', 'LP001', N'nhìn ra biển, giường đôi')
INSERT INTO PHONG VALUES (24, N'Trống', 'LP001', N'nhìn ra biển, giường đơn')
INSERT INTO PHONG VALUES (25, N'Trống', 'LP001', N'giường đơn')
INSERT INTO PHONG VALUES (26, N'Trống', 'LP003', N'giường đơn')
INSERT INTO PHONG VALUES (27, N'Sửa chữa', 'LP003', N'giường đơn')
INSERT INTO PHONG VALUES (28, N'Trống', 'LP003', N'nhìn ra biển, giường đơn')
INSERT INTO PHONG VALUES (29, N'Trống', 'LP001', N'giường đôi')
INSERT INTO PHONG VALUES (30, N'Trống', 'LP002', N'nhìn ra biển, giường đôi')


GO
--THEM DU LIEU CHO BANG PHIEU_THUE_PHONG
INSERT INTO PHIEU_THUE_PHONG VALUES (1, '2013-12-23', 2)
INSERT INTO PHIEU_THUE_PHONG VALUES (2, '2013-12-14', 4)
INSERT INTO PHIEU_THUE_PHONG VALUES (3, '2013-12-9', 5)

GO
--THEM DU LIEU CHO BANG CHI_TIET_PHIEU_THUE
INSERT INTO CHI_TIET_PHIEU_THUE VALUES (1, 1, 1)
INSERT INTO CHI_TIET_PHIEU_THUE VALUES (2, 2, 2)
INSERT INTO CHI_TIET_PHIEU_THUE VALUES (3, 3, 3)

GO
----THEM DU LIEU CHO BANG HOA_DON
--INSERT INTO HOA_DON VALUES ('HD001', N'Phan Văn A', '')

--GO
----THEM DU LIEU CHO BANG CHI_TIET_HOA_DON
--INSERT INTO CHI_TIET_HOA_DON VALUES ('CTHD001', 'HD001', 10, '')

--THEM DU LIEU CHO BANG THAM_SO
INSERT INTO THAM_SO VALUES (3, 0.25, 1.5, 0, 3, 1)



--THEM DU LIEU CHO BANG DANH_MUC
INSERT INTO DANH_MUC VALUES ('LP001')
INSERT INTO DANH_MUC VALUES ('LP002')
INSERT INTO DANH_MUC VALUES ('LP003')