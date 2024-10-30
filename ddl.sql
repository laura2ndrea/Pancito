CREATE DATABASE IF NOT EXISTS Pancito; 

USE Pancito; 

CREATE TABLE IF NOT EXISTS Categorias (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL UNIQUE
); 

CREATE TABLE IF NOT EXISTS Productos (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    tamano ENUM('No aplica', 'Pequeño', 'Mediano', 'Grande'),
    precio_venta DECIMAL(10,2) NOT NULL, 
    disponible BOOLEAN NOT NULL, 
    descontinuado BOOLEAN NOT NULL, 
    stock INT,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id)
); 

CREATE TABLE IF NOT EXISTS Ingredientes (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    cantidad INT NOT NULL, 
    costo DECIMAL(10,2) NOT NULL
); 

CREATE TABLE IF NOT EXISTS Fabricacion (
    id_producto INT,
    id_ingrediente INT, 
    cantidad INT NOT NULL, 
    PRIMARY KEY(id_producto, id_ingrediente), 
    FOREIGN KEY (id_ingrediente) REFERENCES Ingredientes(id), 
    FOREIGN KEY (id_ingrediente) REFERENCES Ingredientes(id)
);

CREATE TABLE IF NOT EXISTS Clientes (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nombre VARCHAR(100) NOT NULL, 
    telefono VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Areas (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Puestos (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nombre VARCHAR(100) NOT NULL,
    salario DECIMAL(10,2) NOT NULL, 
    id_area INT, 
    FOREIGN KEY (id_area) REFERENCES Areas(id)
);

CREATE TABLE IF NOT EXISTS Empleados (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nombre VARCHAR(100) NOT NULL,
    fecha_contratacion DATE NOT NULL, 
    telefono VARCHAR(100) NOT NULL, 
    activo BOOLEAN NOT NULL, 
    id_puesto INT,
    FOREIGN KEY (id_puesto) REFERENCES Puestos(id)
);

CREATE TABLE IF NOT EXISTS Facturas (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    fecha DATETIME NOT NULL, 
    total DECIMAL(10,2) NOT NULL,
    id_cliente INT, 
    id_empleado INT, 
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id), 
	FOREIGN KEY (id_empleado) REFERENCES Empleados(id)
);

CREATE TABLE IF NOT EXISTS Ventas (
    cantidad INT NOT NULL, 
    id_producto INT, 
    id_factura INT, 
    PRIMARY KEY(id_producto, id_factura),
	FOREIGN KEY (id_producto) REFERENCES Productos(id), 
	FOREIGN KEY (id_factura) REFERENCES Facturas(id)
);

CREATE TABLE IF NOT EXISTS Proveedores (
	id INT PRIMARY KEY AUTO_INCREMENT, 
    nombre VARCHAR(100) NOT NULL, 
    telefono VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Empresas (
	id INT PRIMARY KEY AUTO_INCREMENT, 
    nombre VARCHAR(100) NOT NULL UNIQUE, 
    direccion VARCHAR(200) NOT NULL
);

CREATE TABLE IF NOT EXISTS Proveedores_Empresas (
	id_proveedor INT, 
    id_empresa INT, 
    PRIMARY KEY (id_proveedor, id_empresa),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id),
    FOREIGN KEY (id_empresa) REFERENCES Empresas(id)
);

CREATE TABLE IF NOT EXISTS Ordenes (
	id INT PRIMARY KEY AUTO_INCREMENT, 
    fecha DATETIME NOT NULL, 
    estado ENUM('En espera', 'Entregado', 'Cancelado'),
    total DECIMAL(10,2) NOT NULL, 
    id_empleado INT, 
    id_proveedor INT,
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id)
);

CREATE TABLE IF NOT EXISTS Compras (
	cantidad INT NOT NULL, 
    id_orden INT, 
    id_ingrediente INT, 
    PRIMARY KEY (id_orden, id_ingrediente),
    FOREIGN KEY (id_orden) REFERENCES Ordenes(id),
    FOREIGN KEY (id_ingrediente) REFERENCES Ingredientes(id)
);

CREATE TABLE IF NOT EXISTS Metodos_Pagos (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Transacciones (
	id INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATETIME NOT NULL, 
    estado ENUM('Aceptada', 'En espera', 'Rechazada') NOT NULL, 
    monto DECIMAL(10,2) NOT NULL, 
    id_metodo_pago INT,
    id_factura INT,
    FOREIGN KEY (id_metodo_pago) REFERENCES Metodos_Pagos(id),
    FOREIGN KEY (id_factura) REFERENCES Facturas(id)
);