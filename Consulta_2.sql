USE FastFood

----------------------------------------------------------------------------
--1. �C�mo puedo obtener una lista de todos los productos junto con sus categor�as?
SELECT * FROM Productos --Visualizamos la tablas sobre las que queremos trabajar
SELECT * FROM Categorias


SELECT 
    P.Nombre AS Nombre_Producto,        -- Nombre del producto
    C.Nombre AS Nombre_Categoria        -- Nombre de la categor�a
FROM 
    Productos P                        -- Utilizaos el alias P para la tabla Productos
INNER JOIN 
    Categorias C                       -- Utilizamos el alias C para la tabla Categorias
    ON P.CategoriaID = C.CategoriaID;  -- Relacionamos por el ID de categor�a


--2. �C�mo puedo saber a qu� sucursal est� asignado cada empleado?

SELECT * FROM Empleados --Visualizamos la tablas sobre las que queremos trabajar
SELECT * FROM Sucursales

SELECT 
    E.Nombre AS Nombre_Empleado,        -- Nombre del empleado
    S.Nombre AS Nombre_Sucursal         -- Nombre de la sucursal asignada
FROM 
    Empleados E                        -- Utilizamos el alias E para la tabla Empleados
INNER JOIN 
    Sucursales S                       -- Utilizamos el alias S para la tabla Sucursales
    ON E.SucursalID = S.SucursalID;    -- Relacionamos por el ID de sucursal
------------------------------------------------------------------------------

--3. �Existen productos que no tienen una categor�a asignada?

SELECT * FROM Productos --Visualizamos la tablas sobre las que queremos trabajar
SELECT * FROM Categorias

SELECT 
    P.Nombre AS Nombre_Producto,        -- Nombre del producto
    C.Nombre AS Nombre_Categoria        -- Nombre de la categor�a (puede ser NULL)
FROM 
    Productos P                        -- Alias P para la tabla Productos
LEFT JOIN 
    Categorias C                       -- Alias C para la tabla Categorias
    ON P.CategoriaID = C.CategoriaID   -- Relaci�n por categor�a
WHERE 
    C.CategoriaID IS NULL;             -- Filtro: categor�a no existe (sin asignar)
-------------------------------------------------------------------------------

--4. �C�mo puedo obtener un detalle completo de las �rdenes, incluyendo el Nombre del cliente, Nombre del empleado que tom� la orden, y Nombre del mensajero que la entreg�?

SELECT * FROM Ordenes --Visualizamos la tablas sobre las que queremos trabajar
SELECT * FROM Empleados
SELECT * FROM Mensajeros
SELECT * FROM Clientes

SELECT 
    O.OrdenID,                         -- ID de la orden
    C.Nombre AS Cliente,        -- Nombre del cliente
    E.Nombre AS Empleado,       -- Nombre del empleado que tomo la orden
    M.Nombre AS Mensajero       -- Nombre del mensajero que entrego la orden
FROM 
    Ordenes O                          -- Alias O para la tabla Ordenes
INNER JOIN 
    Clientes C                         -- Alias C para la tabla Clientes
    ON O.ClienteID = C.ClienteID       -- Relaci�n cliente con el orden
INNER JOIN 
    Empleados E                        -- Alias E para la tabla Empleados
    ON O.EmpleadoID = E.EmpleadoID     -- Relaci�n empleado con el  orden
INNER JOIN 
    Mensajeros M                       -- Alias M para la tabla Mensajeros
    ON O.MensajeroID = M.MensajeroID;  -- Relaci�n mensajero con el orden
---------------------------------------------------------------------------------------------

-- 5.�Cu�ntos art�culos correspondientes a cada Categor�a de Productos se han vendido en cada sucursal?

SELECT * FROM DetalleOrdenes --Visualizamos la tablas sobre las que queremos trabajar
SELECT * FROM Productos
SELECT * FROM Categorias
SELECT * FROM Sucursales

SELECT 
    S.Nombre AS Sucursal,        -- Nombre de la sucursal
    C.Nombre AS Categoria,       -- Nombre de la categor�a del producto
    SUM(D.Cantidad) AS Productos_Vendidos   -- Total de unidades vendidas por catgoria 
FROM 
    DetalleOrdenes D                   -- Alias D para DetalleOrdenes
INNER JOIN 
    Ordenes O                          -- Alias O para Ordenes
    ON D.OrdenID = O.OrdenID           -- Relaci�n orden/detalle
INNER JOIN 
    Productos P                        -- Alias P para Productos
    ON D.ProductoID = P.ProductoID     -- Relaci�n producto/detalle
INNER JOIN 
    Categorias C                       -- Alias C para Categor�as
    ON P.CategoriaID = C.CategoriaID   -- Relaci�n producto/categor�a
INNER JOIN 
    Sucursales S                       -- Alias S para Sucursales
    ON O.SucursalID = S.SucursalID     -- Relaci�n orden/sucursal
GROUP BY 
    S.Nombre,                          -- Agrupamos por nombre de sucursal y por nombre de categor�a
    C.Nombre;                          
