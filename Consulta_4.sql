USE FastFood


-- Insertar más categorías
INSERT INTO Categorias (Nombre) VALUES
('Comida Mexicana'), ('Comida China'), ('Comida Italiana'), ('Comida India'), ('Comida Japonesa'),
('Comida Mediterránea'), ('Comida Árabe'), ('Comida Americana'), ('Comida Francesa'), ('Comida Thai');

SELECT * FROM Categorias

-- Insertar más productos
INSERT INTO Productos (Nombre, CategoriaID, Precio) VALUES
('Tacos de Pastor', 1, 8.99), ('Sushi', 8, 15.99), ('Pasta Alfredo', 9, 12.99), ('Fried Rice', 6, 7.99),
('Falafel', 7, 6.99), ('Pizza Hawaiana', 10, 13.99), ('Ensalada Mediterránea', 4, 7.49), ('Tiramisu', 2, 4.99),
('Bubble Tea', 3, 3.49), ('Mochi', 7, 2.99);

SELECT * FROM Productos

-- Insertar más sucursales
INSERT INTO Sucursales (Nombre, Direccion) VALUES
('Sucursal A', '1234 Avenida 1'), ('Sucursal B', '5678 Avenida 2'), ('Sucursal C', '9101 Avenida 3'),
('Sucursal D', '1121 Avenida 4'), ('Sucursal E', '3141 Avenida 5'), ('Sucursal F', '1516 Avenida 6'),
('Sucursal G', '1718 Avenida 7'), ('Sucursal H', '1920 Avenida 8'), ('Sucursal I', '2122 Avenida 9'),
('Sucursal J', '2324 Avenida 10');


SELECT * FROM Sucursales

-- Insertar más empleados
INSERT INTO Empleados (Nombre, Posicion, Departamento, SucursalID, Rol) VALUES
('Carlos Pérez', 'Gerente', 'Administración', 2, 'Vendedor'), ('Ana Martínez', 'Subgerente', 'Ventas', 3, 'Vendedor'),
('Luis Gómez', 'Cajero', 'Ventas', 4, 'Vendedor'), ('Pablo López', 'Cocinero', 'Cocina', 5, 'Vendedor'),
('Marta García', 'Barista', 'Cafetería', 6, 'Vendedor'), ('Carlos Ramírez', 'Repartidor', 'Logística', 7, 'Mensajero'),
('Laura Díaz', 'Atención al Cliente', 'Servicio', 8, 'Vendedor'), ('Miguel Fernández', 'Encargado de Turno', 'Administración', 9, 'Vendedor'),
('Fernando Herrera', 'Mesero', 'Restaurante', 10, 'Vendedor'), ('Sofía Sánchez', 'Auxiliar de Limpieza', 'Mantenimiento', 1, 'Vendedor');

SELECT * FROM Empleados

-- Insertar más clientes
INSERT INTO Clientes (Nombre, Direccion) VALUES
('Cliente Once', '1010 K Street'), ('Cliente Doce', '1011 L Street'), ('Cliente Trece', '1012 M Street'),
('Cliente Catorce', '1013 N Street'), ('Cliente Quince', '1014 O Street'), ('Cliente Dieciséis', '1015 P Street'),
('Cliente Diecisiete', '1016 Q Street'), ('Cliente Dieciocho', '1017 R Street'), ('Cliente Diecinueve', '1018 S Street'),
('Cliente Veinte', '1019 T Street');

SELECT * FROM Clientes

-- Insertar más orígenes de orden
INSERT INTO OrigenesOrden (Descripcion) VALUES
('Aplicación Web'), ('Recomendación de amigos'), ('Descuento exclusivo'), ('Publicidad en redes'),
('Campaña de correo'), ('Publicidad exterior'), ('Evento especial'), ('Ofertas de temporada'), ('Recompensas'), ('Descuentos VIP');

SELECT * FROM OrigenesOrden

-- Insertar más tipos de pago
INSERT INTO TiposPago (Descripcion) VALUES
('Bitcoin'), ('Crédito Store'), ('Tarjeta Regalo'), ('Pagos a plazos'), ('Pagos en efectivo');
SELECT * FROM TiposPago

-- Insertar más mensajeros
INSERT INTO Mensajeros (Nombre, EsExterno) VALUES
('Mensajero Once', 0), ('Mensajero Doce', 1), ('Mensajero Trece', 0), ('Mensajero Catorce', 1), ('Mensajero Quince', 0),
('Mensajero Dieciséis', 1), ('Mensajero Diecisiete', 0), ('Mensajero Dieciocho', 1), ('Mensajero Diecinueve', 0), ('Mensajero Veinte', 1);
SELECT * FROM Mensajeros

-- Insertar más órdenes
INSERT INTO Ordenes (ClienteID, EmpleadoID, SucursalID, MensajeroID, TipoPagoID, OrigenID, HorarioVenta, TotalCompra, KilometrosRecorrer, FechaDespacho, FechaEntrega, FechaOrdenTomada, FechaOrdenLista) VALUES
(11, 11, 1, 11, 1, 1, 'Mañana', 1250.00, 5.0, '2023-12-10 08:00:00', '2023-12-10 09:00:00', '2023-12-10 07:30:00', '2023-12-10 08:00:00'),
(12, 12, 2, 12, 2, 2, 'Tarde', 1300.00, 6.5, '2023-12-11 14:00:00', '2023-12-11 15:00:00', '2023-12-11 13:30:00', '2023-12-11 14:15:00'),
(13, 13, 3, 13, 3, 3, 'Noche', 1400.00, 7.0, '2023-12-12 19:00:00', '2023-12-12 20:00:00', '2023-12-12 18:30:00', '2023-12-12 19:30:00');
SELECT * FROM Ordenes 

-- Insertar más detalles de órdenes
INSERT INTO DetalleOrdenes (OrdenID, ProductoID, Cantidad, Precio) VALUES
(11, 1, 4, 25.00), (11, 2, 3, 20.00), (11, 3, 2, 15.00),
(12, 4, 5, 30.00), (12, 5, 2, 10.00), (12, 6, 3, 12.00),
(13, 7, 2, 14.00), (13, 8, 5, 25.00), (13, 9, 3, 20.00);

SELECT * FROM DetalleOrdenes


-- Cuales son las ventas totales por mes
SELECT 
    FORMAT(FechaOrdenTomada, 'yyyy-MM') AS Mes, 
    SUM(TotalCompra) AS Ventas_Totales
FROM Ordenes
GROUP BY FORMAT(FechaOrdenTomada, 'yyyy-MM')
ORDER BY Mes;

--Que producto se vende más por categoria 
SELECT 
    C.Nombre AS Categoria,
    P.Nombre AS Producto,
    SUM(D.Cantidad) AS Total_Vendido
FROM DetalleOrdenes D
JOIN Productos P ON D.ProductoID = P.ProductoID
JOIN Categorias C ON P.CategoriaID = C.CategoriaID
GROUP BY C.Nombre, P.Nombre
ORDER BY C.Nombre, Total_Vendido DESC;

--Cual es el producto más rentable por categoria 
SELECT 
    C.Nombre AS Categoria, 
    SUM(D.Precio * D.Cantidad) AS Ingresos
FROM DetalleOrdenes D
JOIN Productos P ON D.ProductoID = P.ProductoID
JOIN Categorias C ON P.CategoriaID = C.CategoriaID
GROUP BY C.Nombre
ORDER BY Ingresos DESC;

-- Cuantas ordenes gestiona cada empleado 

SELECT 
    E.Nombre, 
    COUNT(O.OrdenID) AS TotalOrdenes
FROM Ordenes O
JOIN Empleados E ON O.EmpleadoID = E.EmpleadoID
GROUP BY E.Nombre
ORDER BY TotalOrdenes DESC;

--Promedio de ventas por empleado

SELECT 
    E.Nombre, 
    AVG(O.TotalCompra) AS Promedio_Venta
FROM Ordenes O
JOIN Empleados E ON O.EmpleadoID = E.EmpleadoID
GROUP BY E.Nombre
ORDER BY Promedio_Venta DESC;

-- Los 3 empleados que más ventas generan
SELECT TOP 3
    E.Nombre, 
    AVG(O.TotalCompra) AS Promedio_Venta
FROM Ordenes O
JOIN Empleados E ON O.EmpleadoID = E.EmpleadoID
GROUP BY E.Nombre
ORDER BY Promedio_Venta DESC;


--Rendimiento de ventas por sucursal 
SELECT 
    S.Nombre AS Sucursal, 
    SUM(O.TotalCompra) AS Ventas
FROM Ordenes O
JOIN Sucursales S ON O.SucursalID = S.SucursalID
GROUP BY S.Nombre
ORDER BY Ventas DESC;

--Análisis de Canales de Venta, Ventas por origen de orden
SELECT 
    OO.Descripcion, 
    COUNT(O.OrdenID) AS NumeroOrdenes, 
    SUM(O.TotalCompra) AS TotalVentas
FROM Ordenes O
JOIN OrigenesOrden OO ON O.OrigenID = OO.OrigenID
GROUP BY OO.Descripcion
ORDER BY TotalVentas DESC;

--Tipo de pago por frecuencia de uso y ventas generadas
SELECT 
    TP.Descripcion, 
    COUNT(O.OrdenID) AS Frecuencia,
    SUM(O.TotalCompra) AS Total_Pagado
FROM Ordenes O
JOIN TiposPago TP ON O.TipoPagoID = TP.TipoPagoID
GROUP BY TP.Descripcion
ORDER BY Frecuencia DESC;

--  Ventas mensuales agrupadas por año y mes
SELECT 
    YEAR(FechaOrdenTomada) AS Año,
    MONTH(FechaOrdenTomada) AS Mes,
    DATENAME(MONTH, FechaOrdenTomada) AS Nombre_Mes,
    COUNT(OrdenID) AS Total_Ordenes,
    SUM(TotalCompra) AS Ventas_Totales
FROM Ordenes
GROUP BY YEAR(FechaOrdenTomada), MONTH(FechaOrdenTomada), DATENAME(MONTH, FechaOrdenTomada)
ORDER BY Año, Mes;

-- Consulta para saber la preferencia de productos por región (Sucursal)
SELECT 
    S.Nombre AS Sucursal,
    P.Nombre AS Producto,
    SUM(D.Cantidad) AS Total_Vendido
FROM DetalleOrdenes D
JOIN Ordenes O ON D.OrdenID = O.OrdenID
JOIN Productos P ON D.ProductoID = P.ProductoID
JOIN Sucursales S ON O.SucursalID = S.SucursalID
GROUP BY S.Nombre, P.Nombre
ORDER BY S.Nombre, Total_Vendido DESC;

