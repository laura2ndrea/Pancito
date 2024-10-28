USE pancito; 

-- 1. Crear un nuevo producto en la base de datos.
DELIMITER $
CREATE PROCEDURE registrarProducto (IN nombreP VARCHAR(100), IN tamanoP ENUM('No aplica', 'Pequeño', 'Mediano', 'Grande'), IN precio_ventaP DOUBLE(10,2), IN categoriaP INT)
BEGIN 
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN 
		SELECT 'Ocurrió un error al intentar insertar el producto. Por favor, verifique los datos.' AS Error;
    END ; 
	IF categoriaP IN (1 ,2 ,3) THEN
		INSERT INTO Productos (nombre, tamano, precio_venta, disponible, descontinuado, id_categoria)
        VALUES (nombreP, tamanoP, precio_ventaP, TRUE, FALSE, categoriaP); 
	ELSE
		SELECT 'La categoria que ingreso no existe en la base de datos.' AS Mensaje; 
	END IF; 
END $
DELIMITER ; 

CALL registrarProducto('Cappuccino', 'Grande', 5000.00, 3); 

SELECT * FROM Productos; 