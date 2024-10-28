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

-- 2. Registrar en una tabla de auditoría cualquier modificación en los productos.
CREATE TABLE IF NOT EXISTS ModificacionesProductos (
	fecha DATETIME NOT NULL, 
    mensaje VARCHAR(200)
);

DELIMITER $
CREATE TRIGGER registroProductos
AFTER UPDATE ON Productos FOR EACH ROW
BEGIN 
	INSERT INTO ModificacionesProductos (fecha, mensaje)
    VALUES (NOW(), CONCAT('El producto ', NEW.nombre, ' ha sido modificado')); 
END $
DELIMITER ; 

UPDATE Productos 
SET precio_venta = 3000.00
WHERE id = 2; 
DROP TRIGGER registroProductos; 
SELECT * FROM ModificacionesProductos; 
