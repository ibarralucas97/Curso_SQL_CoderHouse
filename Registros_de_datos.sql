USE MotosDB;
-- Registros en la tabla COLOR
INSERT INTO COLOR (nombre) VALUES 
('Rojo'),
('Azul'),
('Verde'),
('Negro'),
('Blanco');

-- Registros en la tabla MARCA
INSERT INTO MARCA (nombre) VALUES 
('Honda'),
('Yamaha'),
('Kawasaki'),
('Suzuki'),
('BMW');

-- Registros en la tabla TIPO
INSERT INTO TIPO (nombre) VALUES 
('Deportiva'),
('Cruiser'),
('Touring'),
('Off-Road'),
('Scooter');

-- Registros en la tabla PROPIETARIO
INSERT INTO PROPIETARIO (nombre, apellido, direccion, correo, telefono) VALUES 
('Juan', 'Pérez', 'Av. Libertador 123', 'juanperez@gmail.com', '123456789'),
('Ana', 'González', 'Calle Falsa 456', 'anagonzalez@gmail.com', '987654321'),
('Carlos', 'López', 'Av. San Martín 789', 'carloslopez@gmail.com', '456789123'),
('Luis', 'Martínez', 'Calle Primavera 101', 'luismartinez@gmail.com', '789123456'),
('Sofía', 'Ruiz', 'Calle Secundaria 202', 'sofiaruiz@gmail.com', '321654987');

-- Inserción de datos en la tabla MODELO
INSERT INTO MODELO (nombre, id_marca, id_color) VALUES 
('CBR600RR', 1, 1),   -- Honda Rojo
('R1', 2, 2),         -- Yamaha Azul
('Ninja ZX-10R', 3, 3), -- Kawasaki Verde
('GSX-R1000', 4, 4),  -- Suzuki Negro
('S1000RR', 5, 5);    -- BMW Blanco

-- Registros en la tabla MOTO
INSERT INTO MOTO (id_modelo, id_tipo, id_propietario) VALUES 
(1, 1, 1),   -- CBR600RR - Deportiva - Propietario Juan
(2, 2, 2),   -- R1 - Cruiser - Propietario Ana
(3, 3, 3),   -- Ninja ZX-10R - Touring - Propietario Carlos
(4, 4, 4),   -- GSX-R1000 - Off-Road - Propietario Luis
(5, 5, 5);   -- S1000RR - Scooter - Propietario Sofía

-- Registros en la tabla SEGURO
INSERT INTO SEGURO (id_moto, empresa, poliza, fecha_inicio, fecha_fin, tipo_cobertura, costo) VALUES 
(1, 'Seguros Axa', 'POL123', '2025-01-01', '2026-01-01', 'Completa', 500.00),
(2, 'La Caja', 'POL124', '2025-02-01', '2026-02-01', 'Terceros', 300.00),
(3, 'Sancor', 'POL125', '2025-03-01', '2026-03-01', 'Combinada', 450.00),
(4, 'Federación Patronal', 'POL126', '2025-04-01', '2026-04-01', 'Limitada', 350.00),
(5, 'Triunfo Seguros', 'POL127', '2025-05-01', '2026-05-01', 'Todo Riesgo', 600.00);

-- Registros en la tabla VENTA
INSERT INTO VENTA (id_moto, id_comprador, fecha_venta, precio_venta, tipo_venta) VALUES 
(1, 1, '2025-01-15', 12000.00, 'Compra Nueva'),
(2, 2, '2025-02-20', 15000.00, 'Compra Usada'),
(3, 3, '2025-03-25', 18000.00, 'Compra Nueva'),
(4, 4, '2025-04-10', 16000.00, 'Compra Usada'),
(5, 5, '2025-05-05', 20000.00, 'Compra Nueva');