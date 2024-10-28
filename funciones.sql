USE pancito; 

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

SELECT calcularCosto(1) AS 'Costo del producto'; 

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
