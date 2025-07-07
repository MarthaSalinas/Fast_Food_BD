USE FastFood
-- ¿Cuál es el tiempo promedio desde el despacho hasta la entrega de los pedidos gestionados por todo el equipo de mensajería?

SELECT 
    AVG(DATEDIFF(MINUTE, FechaDespacho, FechaEntrega)) AS Demora_Promedio

FROM Ordenes
WHERE MensajeroID IS NOT NULL; -- Solo se consideran órdenes que fueron entregadas por un mensajero


-----------------------------------------------------------------------------

--¿Qué canal de ventas genera más ingresos?

SELECT * FROM Ordenes AS O -- Seleccionamos desde la tabla Ordenes y le damos el alias O  

LEFT JOIN OrigenesOrden AS O_O /* Realizamos un LEFT JOIN con la tabla OrigenesOrden (alias O_O) para obtener la descripción del origen.
								Se usa LEFT JOIN para que se incluyan también las órdenes que no tienen origen asignado.*/

	ON O.OrigenID = O_O.OrigenID;

SELECT 
	OrigenesOrden.Descripcion AS Origen, 
	SUM(Ordenes.TotalCompra) AS Venta_Total -- Calculamos la suma total de las compras realizadas desde origen

FROM Ordenes

LEFT JOIN  OrigenesOrden 
	ON Ordenes.OrigenID = OrigenesOrden.OrigenID

GROUP BY OrigenesOrden.Descripcion
ORDER BY Venta_Total DESC; /*En caso de que dos o más orígenes estén empatados en el primer lugar de ventas totales, 
							se mostrarán todos debido a que no hay un límite impuesto*/

	
------------------------------------------------------------------------------


--¿Cuál es el nivel de ingreso generado por Empleado?


SELECT
    Empleados.Nombre AS Nombre,
    SUM(Ordenes.TotalCompra) AS Ingresos -- Calculamos la suma de todas las compras gestionadas por cada empleado

FROM Ordenes 

JOIN Empleados
    ON Ordenes.EmpleadoID = Empleados.EmpleadoID -- Hacemos JOIN entre Ordenes y Empleados para relacionar cada orden con el empleado que la gestiono

GROUP BY Empleados.Nombre -- Agrupamos los resultados por nombre del empleado para poder sumar los ingresos correspondientes a cada uno

ORDER BY Ingresos DESC; -- Ordenamos los resultados de mayor a menor según el ingreso generado
-----------------------------------------------------------------------------

--¿Cómo varía la demanda de productos a lo largo del día? 

SELECT 
    O.HorarioVenta,                         -- Mostramos el horario de ventas (Mañana, Tarde, Noche)
    SUM(DO.Cantidad) AS Total_Productos     -- Sumamos cuántos productos se vendieron en dicho horario
FROM Ordenes AS O
JOIN DetalleOrdenes AS DO                    -- Hacemos JOIN con DetalleOrden para acceder a la cantidad de productos
    ON O.OrdenID = DO.OrdenID              -- Relacionamos cada orden con sus detalles (productos)
GROUP BY O.HorarioVenta                     -- Agrupamos por horario de ventas

---------------------------------------------------


--¿Cuál es la tendencia de los ingresos generados en cada periodo mensual?

SELECT 
    FORMAT(FechaOrdenTomada, 'yyyy-MM') AS Periodo, -- Se extrae el año y mes (formato: 2023-01)
    SUM(TotalCompra) AS Ingreso_Total_Mensual       -- Se suma el total vendido en ese mes
FROM Ordenes
GROUP BY FORMAT(FechaOrdenTomada, 'yyyy-MM')        -- Agrupamos por año y mes
ORDER BY Periodo;                                   -- Ordenamos cronológicamente


