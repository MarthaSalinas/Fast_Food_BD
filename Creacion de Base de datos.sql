--Creacion de Base de Datos FastFood
CREATE DATABASE FastFood;

--Activacion de Base de Datos FastFood para trabajar
USE FastFood;

--Creacion de Tablas

-- Tabla para almacenar informacion de Categorias
CREATE TABLE Categorias (
	CategoriaID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(255) NOT NULL);

-- Tabla para almacenar informacion de Productos
CREATE TABLE Productos (
	ProductoID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(255) NOT NULL,
	CategoriaID INT, 
	Precio DECIMAL(10,2) NOT NULL);


-- Tabla para almacenar informacion de las sucursales
CREATE TABLE Sucursales (
	SucursalID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(255) NOT NULL,
	Direccion VARCHAR(255) NOT NULL);

-- Tabla para almacenar informacion de los empleados
CREATE TABLE Empleados (
	EmpleadoID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(255) NOT NULL,
	Posicion VARCHAR(255) NOT NULL,
	Departamento VARCHAR(255) NOT NULL,
	SucursalID INT,
	Rol VARCHAR(255) NOT NULL);

-- Tabla para almacenar informacion de los clientes
CREATE TABLE Clientes(
	ClienteID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(255) NOT NULL,
	Direccion VARCHAR(255) NOT NULL);

-- Tabla para almacenar identificar el origen de la orde
CREATE TABLE OrigenesOrden(
	OrigenID INT PRIMARY KEY IDENTITY,
	Descripcion VARCHAR(255) NOT NULL);

-- Tabla para registrar los metodos de pago disponibles
CREATE TABLE TiposPago(
	TipoPagoID INT PRIMARY KEY IDENTITY,
	Descripcion VARCHAR(255) NOT NULL);

-- Tabla que contiene a los mensajeros, internos o externos
CREATE TABLE Mensajeros (
		MensajeroID INT PRIMARY KEY IDENTITY,
		Nombre VARCHAR(255) NOT NULL,
		EsExterno BIT NOT NULL);

-- Tabla para registrar las ordenes realizadas
CREATE TABLE Ordenes(
	OrdenID INT PRIMARY KEY IDENTITY,
	ClienteID INT,
	EmpleadoID INT,
	SucursalID INT,
	MensajeroID INT,
	TipoPagoID INT,
	OrigenID INT,
	HorarioVenta VARCHAR(10) NOT NULL,
	TotalCompra DECIMAL(10,2) NOT NULL,
	KilometrosRecorrer DECIMAL(10,2) NOT NULL,
	FechaDespacho DATETIME NOT NULL,
	FechaEntrega DATETIME NOT NULL,
	FechaOrdenTomada DATETIME NOT NULL,
	FechaOrdenLista DATETIME NOT NULL);

-- Tabla para detallar los productos comprados en cada orden
CREATE TABLE DetalleOrdenes(
	DetalleOrden INT PRIMARY KEY IDENTITY,
	OrdenID INT, 
	ProductoID INT, 
	Cantidad INT NOT NULL, 
	Precio DECIMAL (10,2) NOT NULL);

--Creacion de Relaciones

ALTER TABLE Productos --modifica la tabla para agregar la relación entre una tabla y otra segun lo esquematizado en el Diagrama de Relación 
ADD CONSTRAINT FR_Productos_Categoria  -- Se asigna un nombre a la relación
FOREIGN KEY (CategoriaID) REFERENCES Categorias (CategoriaID);

ALTER TABLE DetalleOrdenes
ADD CONSTRAINT FR_DetalleOrdenes_Productos  -- Se asigna un nombre a la relación
FOREIGN KEY (ProductoID) REFERENCES Productos (ProductoID);

ALTER TABLE DetalleOrdenes
ADD CONSTRAINT FR_DetalleOrdenes_Ordenes -- Se asigna un nombre a la relación
FOREIGN KEY (OrdenID) REFERENCES Ordenes (OrdenID);

ALTER TABLE Empleados
ADD CONSTRAINT FR_Empleados_Sucursales -- Se asigna un nombre a la relación
FOREIGN KEY (SucursalID) REFERENCES Sucursales (SucursalID);

ALTER TABLE Ordenes
ADD CONSTRAINT FR_Ordenes_Clientes -- Se asigna un nombre a la relación
FOREIGN KEY (ClienteID) REFERENCES Clientes (ClienteID);

ALTER TABLE Ordenes
ADD CONSTRAINT FR_Ordenes_Empleados -- Se asigna un nombre a la relación
FOREIGN KEY (EmpleadoID) REFERENCES Empleados (EmpleadoID);

ALTER TABLE Ordenes
ADD CONSTRAINT FR_Ordenes_Sucursales -- Se asigna un nombre a la relación
FOREIGN KEY (SucursalID) REFERENCES Sucursales (SucursalID);

ALTER TABLE Ordenes
ADD CONSTRAINT FR_Ordenes_Mensajeros -- Se asigna un nombre a la relación
FOREIGN KEY (MensajeroID) REFERENCES Mensajeros (MensajeroID);

ALTER TABLE Ordenes
ADD CONSTRAINT FR_Ordenes_TiposPago -- Se asigna un nombre a la relación
FOREIGN KEY (TipoPagoID) REFERENCES TiposPago (TipoPagoID);

ALTER TABLE Ordenes
ADD CONSTRAINT FR_Ordenes_OrigenesOrden -- Se asigna un nombre a la relación
FOREIGN KEY (OrigenID) REFERENCES OrigenesOrden (OrigenID);