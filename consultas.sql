USE oancito; 

-- 1. Consultas simples 
	-- a. Mostrar todos los productos disponibles en la panadería.
    SELECT nombre AS 'Producto', tamano AS 'Presentación', precio_venta AS 'Precio' 
    FROM Productos
    WHERE disponible = 1; 
    
-- 2. Consultas con JOIN 
	-- a. Obtener todas las ventas con el detalle de los productos vendidos.
    SELECT v.id_factura AS '# de factura', f.fecha AS 'Fecha', p.nombre AS 'Producto', p.precio_venta AS 'Precio', c.nombre AS 'Cliente', e.nombre AS 'Vendedor'
    FROM Ventas v
    JOIN Facturas f ON v.id_factura = f.id
    JOIN Productos p ON v.id_producto = p.id
    JOIN Clientes c ON f.id_cliente = c.id
    JOIN Empleados e ON f.id_empleado = e.id
    ORDER BY v.id_factura; 

-- 3. Consultas con funciones de agregación 
	-- a. Calcular el total de ventas de la panadería
	SELECT SUM(total) AS 'Total ventas' FROM Facturas; 
    
    SELECT SUM(v.cantidad * p.precio_venta) AS 'Total ventas'
    FROM Ventas v
    JOIN Productos p ON v.id_producto = p.id; 
    
-- 4. Consultas con subconsultas 
	-- a. Listar los productos que tienen un costo mayor al precio promedio de todos los productos.
    SELECT p.nombre AS 'Productos', p.precio_venta AS 'Precio'
    FROM Productos p
    WHERE p.precio_venta > (SELECT AVG(p2.precio_venta) FROM Productos p2); 
    
-- 5. Consultas con filtros avanzados 
	-- a. Mostrar las ventas que se realizaron entre dos fechas específicas.
    SET @fechaInicio = '2023-10-01'; 
    SET @fechaFin = '2023-10-05 23:59:59'; 
    
    SELECT v.id_factura AS '# factura', DATE(f.fecha) AS 'Fecha', p.nombre AS 'Producto', p.precio_venta AS 'Precio', c.nombre AS 'Cliente', e.nombre AS 'Vendedor'
    FROM Facturas f
    JOIN Ventas v ON f.id = v.id_factura
    JOIN Productos p ON v.id_producto = p.id
    JOIN Clientes c ON f.id_cliente = c.id
    JOIN Empleados e ON f.id_empleado = e.id
    WHERE f.fecha BETWEEN @fechaInicio AND @fechaFin; 
    
-- 6. Consultas de actualización 
	-- a. Actualizar el precio de todos los productos de la categoría 'pan' en un 5%.
    UPDATE Productos 
    SET precio_venta = precio_venta + (precio_venta * 0.5)
    WHERE id_categoria = 1; 
    
     SELECT * FROM Productos; 

-- 7. Consultas de eliminación 
	-- a. Eliminar las órdenes de compra que ya han sido entregadas hace más de un año.
    INSERT INTO Ordenes (fecha, estado, total, id_empleado, id_proveedor)
    VALUES ('2023-01-10 10:00:00', 'Entregado', 250000.00, 8, 2); 
    
    SET SQL_SAFE_UPDATES = 0;
    
    DELETE FROM Ordenes 
    WHERE fecha <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR); 
    
    SELECT * FROM Ordenes; 
    