USE FastFood;

--1.- ¿Cuál es el total de ventas (TotalCompra) a nivel global? 

SELECT * FROM Ordenes -- Ayuda a Visualizar la tabal sobre la que vamos a trabajar 

SELECT SUM(TotalCompra) AS Total_Compras 
FROM Ordenes;

--------------------------------------------------------------

--2. ¿Cuál es el precio promedio de los productos dentro de cada categoría?

SELECT * FROM Productos

SELECT CategoriaID, 
	AVG(Precio) AS Promedio_Precio
FROM Productos
GROUP BY  CategoriaID; 


---------------------------------------------------------------------------

--3.  ¿Cuál es el valor de la orden mínima y máxima por cada sucursal?

SELECT * FROM Ordenes

SELECT SucursalID, 
	MIN(TotalCompra) AS Compra_Min,
	MAX(TotalCompra) AS Compra_Max
FROM Ordenes
GROUP BY  SucursalID; 



---------------------------------------------------------------------------

--4. ¿Cuál es el mayor número de kilómetros recorridos para una entrega?

SELECT * FROM Ordenes

SELECT TOP 1 OrdenID, MAX(KilometrosRecorrer) AS KM
FROM Ordenes
GROUP BY OrdenID
ORDER BY KM DESC;


----------------------------------------------------------------------------

--5. ¿Cuál es la cantidad promedio de productos por orden?

SELECT * FROM DetalleOrdenes

SELECT OrdenID, AVG(Cantidad) AS Promedio_Cantidad_Product
FROM DetalleOrdenes
GROUP BY OrdenID

--------------------------------------------------------------------------

--6. ¿Cómo se distribuye la Facturación Total del Negocio de acuerdo a los métodos de pago?

SELECT * FROM Ordenes

SELECT TipoPagoID, SUM (TotalCompra) AS Total_Compra
FROM Ordenes
GROUP BY TipoPagoID


--------------------------------------------------------------------------------------------

--7. ¿Cuál Sucursal tiene el ingreso promedio más alto?

SELECT * FROM Ordenes

SELECT TOP 1 SucursalID, AVG(TotalCompra) AS Total_Compra
FROM Ordenes
GROUP BY SucursalID
ORDER BY Total_Compra DESC;
-------------------------------------------------------------------------------------------

--8. ¿Cuáles son las sucursales que han generado ventas totales por encima de $ 1000?

SELECT * FROM Ordenes

SELECT SucursalID, SUM(TotalCompra) AS Total_Compra
FROM Ordenes
GROUP BY SucursalID
HAVING SUM(TotalCompra) >= 1000.00


-------------------------------------------------------------------------------------------

--9. ¿Cómo se comparan las ventas promedio antes y después del 1 de julio de 2023?

SELECT * FROM Ordenes

SELECT 
    CASE   -- Clasificamos cada registro deacuedo a si la orden fue tomada antes o después del 1 de julio de 2023
        WHEN FechaOrdenTomada < '2023-07-01' THEN 'Antes de Julio 2023'
        ELSE 'Después de Julio 2023'
    END AS Periodo,
    AVG(TotalCompra) AS PromedioVentas -- Calcula el promedio de TotalCompra para cada grupo por periodo
FROM Ordenes
GROUP BY 
    CASE 
        WHEN FechaOrdenTomada < '2023-07-01' THEN 'Antes de Julio 2023'
        ELSE 'Después de Julio 2023'
    END;


----------------------------------------------------------------------------------------------------

/*10.¿Durante qué horario del día (mañana, tarde, noche) se registra la mayor cantidad de ventas, cuál es 
el ingreso promedio de estas ventas, y cuál ha sido el importe máximo alcanzado por una orden en dicha jornada?*/

SELECT * FROM Ordenes

SELECT 
    HorarioVenta, 
    COUNT(OrdenID) AS Cantida_Ventas, --Cuenta cuantas ventas hubo por horario, por Orden y asigna un nombre a la columna
    AVG(TotalCompra) AS Promedio_Ingresos, -- Calcula el promedio del importe y asigna un nombre a la columna
    MAX(TotalCompra) AS Importe_Max --  Calcula el importe máximo vendido y asigna nombre de columan 
FROM Ordenes
GROUP BY HorarioVenta
ORDER BY Cantida_Ventas DESC;


