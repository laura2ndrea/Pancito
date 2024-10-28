USE Pancito; 

-- 1. Calcular el costo total de los ingredientes utilizados en un producto.
DELIMITER $
CREATE FUNCTION calcularCosto(idProducto INT) 
RETURNS DECIMAL (10,2) 
DETERMINISTIC
BEGIN 
	DECLARE totalCosto DECIMAL (10,2); 
    
	SELECT COALESCE(SUM(ip.costo)) INTO totalCosto 
    FROM Ingredientes_Presentaciones ip
    JOIN Ingredientes i ON ip.id_ingrediente = i.id
    JOIN Productos_Ingredientes pi ON i.id = pi.id_ingrediente
    JOIN Productos p ON pi.id_producto = p.id
    WHERE p.id = idProducto; 
    
    RETURN totalCosto; 
END $
DELIMITER ; 

SELECT p.nombre, calcularCosto(p.id) AS 'Costo del producto' FROM Productos p; 

-- 2. Devolver el precio promedio de los productos vendidos.
DELIMITER $
CREATE FUNCTION promedioProductos () 
RETURNS DECIMAL (10,2) 
DETERMINISTIC 
BEGIN 
	DECLARE promedio DECIMAL(10,2); 
	SELECT AVG(precio_venta) INTO promedio FROM Productos; 
    RETURN promedio; 
END $ 
DELIMITER ; 

SELECT promedioProductos() AS 'Precio promedio de los productos'; 

-- 3. Calcular el costo total de una venta.
DELIMITER $ 
CREATE FUNCTION costoVenta (idFactura INT)
RETURNS DECIMAL (10,2)
DETERMINISTIC
BEGIN
	DECLARE total DECIMAL(10,2);
    
    SELECT SUM(p.precio_venta) INTO total
    FROM Productos p
    JOIN Ventas v ON p.id = v.id_producto
    JOIN Facturas f ON v.id_factura = f.id
    WHERE f.id = idFactura; 
    
    RETURN total; 
END $ 
DELIMITER ; 

SELECT costoVenta(1) AS 'Total de la venta'; 
