USE pancito; 

SHOW TRIGGERS; 

-- 1. Actualizar automáticamente el inventario después de cada venta.
DELIMITER $
CREATE TRIGGER actualizarInventario
AFTER INSERT ON Ventas FOR EACH ROW 
BEGIN 
	UPDATE Ingredientes_Presentaciones ip
    SET ip.cantidad = ip.cantidad - NEW.cantidad
    WHERE ip.id_ingrediente IN (SELECT pi.id_ingrediente FROM Productos_Ingredientes pi WHERE pi.id_producto = NEW.id_producto); 
END $
DELIMITER ; 

SELECT i.nombre , ip.* 
FROM Ingredientes i
JOIN Ingredientes_Presentaciones ip ON i.id = ip.id_ingrediente; 

SELECT * 
FROM Ventas;  

INSERT INTO Ventas (cantidad, id_producto, id_factura) VALUES (5, 13, 5);
