INSERT INTO Categorias (nombre) VALUES
('Panes'),
('Postres'),
('Bebidas'); 

INSERT INTO Productos (nombre, tamano, precio_venta, disponible, descontinuado, id_categoria) VALUES 
('Pan francés', 'No aplica', 1500.00, TRUE, FALSE, 1),
('Pan integral', 'No aplica', 1800.00, TRUE, FALSE, 1),
('Pan de queso', 'No aplica', 1000.00, TRUE, FALSE, 1),
('Baguette', 'No aplica', 2500.00, TRUE, FALSE, 1),
('Rosca de canela', 'No aplica', 2000.00, TRUE, FALSE, 1),
('Torta de chocolate', 'Mediano', 25000.00, TRUE, FALSE, 2),
('Brownie', 'Pequeño', 3000.00, TRUE, FALSE, 2),
('Cheesecake', 'Mediano', 18000.00, TRUE, FALSE, 2),
('Cupcake de vainilla', 'No aplica', 2500.00, TRUE, FALSE, 2),
('Galleta de avena', 'Mediano', 1500.00, FALSE, TRUE, 2),
('Café americano', 'Pequeño', 2000.00, TRUE, FALSE, 3),
('Cappuccino', 'Mediano', 3000.00, TRUE, FALSE, 3),
('Chocolate Caliente', 'Mediano', 2500.00, TRUE, FALSE, 3),
('Jugo de naranja', 'Grande', 3500.00, FALSE, FALSE, 3),
('Té verde', 'Pequeño', 1800.00, FALSE, TRUE, 3);

INSERT INTO Ingredientes (nombre) VALUES 
('Harina de Trigo'),
('Azúcar'),
('Mantequilla'),
('Levadura'),
('Huevos'),
('Chocolate'),
('Queso'),
('Leche'),
('Café en grano'),
('Vainilla'),
('Avena'),
('Canela'),
('Naranjas'),
('Té Verde'),
('Cacao en polvo');

INSERT INTO Presentaciones (nombre) VALUES 
('Bolsa de 1 kg'),
('Bolsa de 500 g'),
('Paquete de 250 g'),
('Frasco de 100 ml'),
('Frasco de 250 ml'),
('Caja de 12 unidades'),
('Bolsa de 5 kg'),
('Paquete de 1 kg'),
('Bolsa de 100 g'),
('Saco de 50 kg'),
('Botella de 1 litro'),
('Botella de 500 ml'),
('Paquete de 200 g'),
('Caja de 24 unidades'),
('Lata de 400 g');

-- Inserciones para la tabla Ingredientes_Presentaciones con cantidades reducidas
INSERT INTO Ingredientes_Presentaciones (costo, cantidad, id_ingrediente, id_presentacion) VALUES 
(2000.00, 250, 1, 1), -- Harina de Trigo, Bolsa de 1 kg
(90000.00, 12500, 1, 10), -- Harina de Trigo, Saco de 50 kg
(1500.00, 250, 2, 1), -- Azúcar, Bolsa de 1 kg
(800.00, 125, 2, 2), -- Azúcar, Bolsa de 500 g
(5000.00, 62, 3, 3), -- Mantequilla, Paquete de 250 g
(18000.00, 250, 3, 8), -- Mantequilla, Paquete de 1 kg
(1500.00, 25, 4, 9), -- Levadura, Bolsa de 100 g
(80000.00, 12500, 4, 10), -- Levadura, Saco de 50 kg
(4500.00, 3, 5, 6), -- Huevos, Caja de 12 unidades
(8000.00, 6, 5, 13), -- Huevos, Caja de 24 unidades
(10000.00, 50, 6, 12), -- Chocolate, Paquete de 200 g
(22000.00, 100, 6, 14), -- Chocolate, Lata de 400 g
(9000.00, 250, 7, 8), -- Queso, Paquete de 1 kg
(4000.00, 250, 8, 11), -- Leche, Botella de 1 litro
(2500.00, 125, 8, 12), -- Leche, Botella de 500 ml
(15000.00, 125, 9, 2), -- Café en grano, Bolsa de 500 g
(8000.00, 25, 10, 4), -- Vainilla, Frasco de 100 ml
(14000.00, 62.5, 10, 5), -- Vainilla, Frasco de 250 ml
(12000.00, 250, 11, 1), -- Avena, Bolsa de 1 kg
(3500.00, 25, 12, 9), -- Canela, Bolsa de 100 g
(30000.00, 3, 13, 6), -- Naranjas, Caja de 12 unidades
(6000.00, 25, 14, 9), -- Té Verde, Bolsa de 100 g
(10000.00, 125, 15, 2); -- Cacao en polvo, Bolsa de 500 g

-- Inserciones para la tabla Productos_Ingredientes
INSERT INTO Productos_Ingredientes (id_producto, id_ingrediente) VALUES
-- Productos de la categoría "Pan"
(1, 1), -- Pan francés - Harina de Trigo
(1, 2), -- Pan francés - Azúcar
(1, 3), -- Pan francés - Mantequilla
(1, 4), -- Pan francés - Levadura

(2, 1), -- Pan integral - Harina de Trigo
(2, 2), -- Pan integral - Azúcar
(2, 4), -- Pan integral - Levadura

(3, 1), -- Pan de queso - Harina de Trigo
(3, 3), -- Pan de queso - Mantequilla
(3, 7), -- Pan de queso - Queso

(4, 1), -- Baguette - Harina de Trigo
(4, 4), -- Baguette - Levadura
(4, 3), -- Baguette - Mantequilla

(5, 1), -- Rosca de canela - Harina de Trigo
(5, 2), -- Rosca de canela - Azúcar
(5, 12), -- Rosca de canela - Canela

-- Productos de la categoría "Pastelería"
(6, 1), -- Torta de chocolate - Harina de Trigo
(6, 2), -- Torta de chocolate - Azúcar
(6, 5), -- Torta de chocolate - Huevos
(6, 6), -- Torta de chocolate - Chocolate
(6, 8), -- Torta de chocolate - Leche

(7, 1), -- Brownie - Harina de Trigo
(7, 2), -- Brownie - Azúcar
(7, 3), -- Brownie - Mantequilla
(7, 6), -- Brownie - Chocolate
(7, 5), -- Brownie - Huevos

(8, 1), -- Cheesecake - Harina de Trigo
(8, 2), -- Cheesecake - Azúcar
(8, 7), -- Cheesecake - Queso
(8, 5), -- Cheesecake - Huevos

(9, 1), -- Cupcake de vainilla - Harina de Trigo
(9, 2), -- Cupcake de vainilla - Azúcar
(9, 10), -- Cupcake de vainilla - Vainilla
(9, 5), -- Cupcake de vainilla - Huevos
(9, 8), -- Cupcake de vainilla - Leche

(10, 1), -- Galleta de avena - Harina de Trigo
(10, 2), -- Galleta de avena - Azúcar
(10, 11), -- Galleta de avena - Avena
(10, 3), -- Galleta de avena - Mantequilla

-- Productos de la categoría "Bebidas"
(11, 9), -- Café americano - Café en grano
(11, 8), -- Café americano - Leche

(12, 9), -- Cappuccino - Café en grano
(12, 8), -- Cappuccino - Leche
(12, 3), -- Cappuccino - Mantequilla

(13, 6), -- Chocolate Caliente - Chocolate
(13, 8), -- Chocolate Caliente - Leche

(14, 13), -- Jugo de naranja - Naranjas

(15, 14); -- Té verde - Té Verde

-- Inserciones para la tabla Clientes
INSERT INTO Clientes (nombre, telefono) VALUES
('Juan Pérez', '3001234567'),
('María Gómez', '3109876543'),
('Luis Martínez', '3154567890'),
('Ana Torres', '3186543210'),
('Carlos Díaz', '3123456789');

-- Inserciones para la tabla Areas
INSERT INTO Areas (nombre) VALUES
('Producción'),
('Ventas'),
('Marketing'),
('Administración');

INSERT INTO Puestos (nombre, salario, id_area) VALUES
('Panadero principal', 3500000.00, 1),  -- Producción
('Ayudante panadero', 2000000.00, 1),  -- Producción
('Vendedor mostrador', 2000000.00, 2),  -- Ventas
('Community Manager', 1500000.00, 3),  -- Marketing
('Contador', 2600000.00, 4),  -- Administración
('Administrador general', 3400000.00, 4),  -- Administración
('Encargado de compras', 3200000.00, 4);  -- Administración

-- Inserciones para la tabla Empleados
INSERT INTO Empleados (nombre, fecha_contratacion, telefono, activo, id_puesto) VALUES
('Juan Rodríguez', '2023-01-15', '3001234567', TRUE, 1),  -- Panadero principal
('María López', '2023-02-20', '3109876543', TRUE, 2),  -- Ayudante panadero
('Carlos Gómez', '2023-03-10', '3154567890', TRUE, 3),  -- Vendedor mostrador
('Juana Perez', '2024-01-19', '3154561290', TRUE, 3),
('Ana Torres', '2023-04-05', '3186543210', TRUE, 4),  -- Community Manager
('Pedro Martínez', '2023-05-18', '3123456789', TRUE, 5),  -- Contador
('Lucía Fernández', '2023-06-22', '3009876543', TRUE, 6),  -- Administrador general
('Luis Jiménez', '2023-07-30', '3101234567', TRUE, 7);  -- Encargado de compras

-- Inserciones para la tabla Facturas
INSERT INTO Facturas (fecha, total, id_cliente, id_empleado) VALUES
('2023-10-01 10:00:00', 4300.00, 1, 3),  -- Factura 1
('2023-10-02 11:00:00', 28000.00, 2, 4),  -- Factura 2
('2023-10-03 12:00:00', 7500.00, 3, 4),  -- Factura 3
('2023-10-04 13:00:00', 3500.00, 4, 3),  -- Factura 4
('2023-10-05 14:00:00', 20500.00, 5, 4),  -- Factura 5
('2023-10-06 15:00:00', 5300.00, 1, 4),  -- Factura 6
('2023-10-07 16:00:00', 5800.00, 2, 3),  -- Factura 7
('2023-10-08 17:00:00', 21000.00, 3, 3);  -- Factura 8

-- Inserciones para la tabla Ventas
INSERT INTO Ventas (cantidad, id_producto, id_factura) VALUES
(1, 1, 1),  -- 1 Pan francés en Factura 1
(1, 2, 1),  -- 1 Pan integral en Factura 1
(1, 3, 1),  -- 1 Pan de queso en Factura 1

(1, 6, 2),  -- 1 Torta de chocolate en Factura 2
(1, 7, 2),  -- 1 Brownie en Factura 2

(1, 11, 3),  -- 1 Café americano en Factura 3
(1, 12, 3),  -- 1 Cappuccino en Factura 3
(1, 13, 3),  -- 1 Chocolate Caliente en Factura 3

(1, 5, 4),  -- 1 Rosca de canela en Factura 4
(1, 10, 4),  -- 1 Galleta de avena en Factura 4

(1, 8, 5),  -- 1 Cheesecake en Factura 5
(1, 4, 5),  -- 1 Cupcake de vainilla en Factura 5

(1, 14, 6),  -- 1 Jugo de naranja en Factura 6
(1, 15, 6),  -- 1 Té verde en Factura 6

(1, 1, 7),  -- 1 Pan francés en Factura 7
(1, 2, 7),  -- 1 Pan integral en Factura 7
(1, 4, 7),  -- 1 Baguette en Factura 7

(1, 7, 8),  -- 1 Brownie en Factura 8
(1, 8, 8);  -- 1 Cheesecake en Factura 8

INSERT INTO Proveedores (nombre, telefono) VALUES
('Carlos Pérez', '3001234567'),     -- Panadería El Buen Sabor
('Laura Gómez', '3107654321'),      -- Distribuciones Alimentos Frescos
('José Rodríguez', '3209876543'),   -- Proveedores de Lácteos La Vaquita
('Ana Martínez', '3152345678'),      -- Frutas y Verduras Del Campo
('Sofía Hernández', '3148765432');   -- Repostería Tradicional

INSERT INTO Empresas (nombre, direccion) VALUES
('Panadería El Buen Sabor', 'Calle 10 #12-34, Bogotá'), 
('Distribuciones Alimentos Frescos', 'Avenida 5 #21-56, Medellín'),
('Proveedores de Lácteos La Vaquita', 'Carrera 8 #45-67, Cali'), 
('Frutas y Verduras Del Campo', 'Calle 15 #34-21, Barranquilla'), 
('Repostería Tradicional', 'Calle 20 #56-78, Cartagena');

INSERT INTO Proveedores_Empresas (id_proveedor, id_empresa) VALUES
(1, 1),  -- Carlos Pérez es proveedor de Panadería El Buen Sabor
(2, 2),  -- Laura Gómez es proveedora de Distribuciones Alimentos Frescos
(3, 3),  -- José Rodríguez es proveedor de Proveedores de Lácteos La Vaquita
(4, 4),  -- Ana Martínez es proveedora de Frutas y Verduras Del Campo
(5, 5);  -- Sofía Hernández es proveedora de Repostería Tradicional

-- Inserciones en la tabla Ordenes
INSERT INTO Ordenes (fecha, estado, total, id_empleado, id_proveedor) VALUES
('2024-10-01 10:00:00', 'Entregado', 84400.00, 8, 2), -- Orden 1
('2024-10-02 10:00:00', 'Entregado', 29900.00, 8, 5), -- Orden 2
('2024-10-03 10:00:00', 'En espera', 49000.00, 8, 5), -- Orden 3
('2024-10-04 10:00:00', 'En espera', 904500.00, 8, 2), -- Orden 4
('2024-10-05 10:00:00', 'En espera', 50000.00, 8, 4); -- Orden 5

INSERT INTO Compras (cantidad, id_orden, id_ingrediente_presentacion) VALUES
-- Orden 1: Harina de Trigo, Mantequilla y Queso
(5, 1, 1),  -- Harina de Trigo, Bolsa de 1 kg
(3, 1, 2),  -- Azúcar, Bolsa de 500 g
(2, 1, 8),  -- Mantequilla, Paquete de 1 kg
(4, 1, 7),  -- Queso, Paquete de 1 kg

-- Orden 2: Azúcar y Leche
(3, 2, 2),  -- Azúcar, Bolsa de 500 g
(1, 2, 4),  -- Leche, Botella de 1 litro
(5, 2, 5),  -- Huevos, Caja de 12 unidades

-- Orden 3: Mantequilla y Chocolate
(1, 3, 3),  -- Mantequilla, Paquete de 250 g
(2, 3, 14), -- Chocolate, Lata de 400 g

-- Orden 4: Harina de Trigo y Azúcar
(10, 4, 10), -- Harina de Trigo, Saco de 50 kg
(3, 4, 1),  -- Azúcar, Bolsa de 1 kg

-- Orden 5: Té Verde y Chocolate
(5, 5, 14), -- Té Verde, Bolsa de 100 g
(2, 5, 10); -- Chocolate, Paquete de 200 g


    







