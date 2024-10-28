USE Pancito; 
SET GLOBAL event_scheduler = ON;
SHOW EVENTS;

-- 1. Generar un informe diario de ventas y almacenarlo en una tabla.
CREATE TABLE IF NOT EXISTS InformesVentas (
	id INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATETIME NOT NULL, 
    total_ventas DECIMAL (10,2), 
    total_productos INT
);

DELIMITER $
CREATE EVENT informesVentas
ON SCHEDULE EVERY 1 DAY STARTS '2024-10-27 19:30:00'
DO
BEGIN
	DECLARE totalVentas DECIMAL (10,2); 
    DECLARE totalProductos INT; 
    
    SELECT COALESCE(SUM(f.total), 0) , COALESCE(SUM(v.cantidad), 0)
    INTO totalVentas, totalProductos
    FROM Facturas f
    LEFT JOIN Ventas v ON f.id = v.id_factura
    WHERE DATE(f.fecha) = CURDATE(); 
    
	INSERT INTO InformesVentas (fecha, total_ventas, total_productos)
    VALUES (CURDATE(), totalVentas, totalProductos); 
END $
DELIMITER ; 

-- 2. Actualizar el inventario de ingredientes diariamente.
DELIMITER $
CREATE EVENT actualizarInventario
ON SCHEDULE EVERY 1 DAY STARTS '2024-10-28 19:30:00'
DO
BEGIN 
	UPDATE Ingredientes_Presentaciones ip 
    JOIN (
    SELECT pi.id_ingrediente, SUM(v.cantidad) AS cantidad_vendida
    FROM Ventas v
    JOIN Productos_Ingredientes pi ON v.id_producto = pi.id_producto
    JOIN Facturas f ON f.id = v.id_factura
    WHERE DATE(f.fecha) = CURDATE(); 
    GROUP BY pi.id_ingrediente
) AS ventas_diarias ON ip.id_ingrediente = ventas_diarias.id_ingrediente
SET ip.cantidad = ip.cantidad - ventas_diarias.cantidad_vendida;
END; 
DELIMITER ; 

SELECT * FROM InformesVentas; 
SELECT i.nombre, ip.cantidad
FROM Ingredientes_Presentaciones ip
JOIN Ingredientes i ON ip.id_ingrediente = i.id; 

-- 3. Revisar si algún ingrediente está por debajo del nivel mínimo y generar una alerta.
CREATE TABLE IF NOT EXISTS Alertas (
	id INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATETIME NOT NULL, 
    mensaje VARCHAR(200)
);

DELIMITER $ 
CREATE EVENT alertaMinimo 
ON SCHEDULE EVERY DAY STARTS '2024-10-27 19:30:00'
BEGIN 
	INSERT INTO Alertas (fecha, mensaje)
    VALUES (NOW(), CONCAT('Hay bajo inventario de ', i.nombre, 'esta debajo del nivel mínimo. Cantidad actual: ', ip.cantidad))
    FROM Ingredientes i 
    JOIN Ingredientes_Presentaciones ip ON i.id = ip.id_ingrediente
    WHERE ip.cantidad < 5; 
END $
DELIMITER ; 

SELECT * FROM Alertas; 


