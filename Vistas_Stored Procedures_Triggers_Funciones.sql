-- VISTAS
-- Mostrar motos con sus propietarios
-- Objetivo: Mostrar la información de las motos con los nombres de sus propietarios y el tipo de moto.
-- Tablas que componen la vista: MOTO, PROPIETARIO, TIPO.
CREATE VIEW Vista_Motos_Propietarios AS
SELECT 
    M.id_moto,
    M.id_modelo,
    M.id_tipo,
    P.nombre AS propietario_nombre,
    P.apellido AS propietario_apellido,
    T.nombre AS tipo_moto
FROM MOTO M
JOIN PROPIETARIO P ON M.id_propietario = P.id_propietario
JOIN TIPO T ON M.id_tipo = T.id_tipo;

--

-- CREAR FUNCION PARA CALCULAR PRECIO PROMEDIO DE MOTOS VENDIDAS
DELIMITER $$

CREATE FUNCTION ContarMotos()
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE cantidad INT;

    -- Contamos las motos en la tabla MOTO
    SELECT COUNT(*) INTO cantidad FROM MOTO;

    -- Devolvemos el valor de cantidad
    RETURN cantidad;
END $$

DELIMITER ;

-- PROBAR FUNCION
-- SELECT ContarMotos();

--
-- PROCEDIMIENTO ALMACENADO
DELIMITER $$

CREATE PROCEDURE RegistrarVenta(
    IN p_id_moto INT,           -- ID de la moto que se va a vender
    IN p_id_comprador INT,      -- ID del comprador de la moto
    IN p_fecha_venta DATE,      -- Fecha de la venta
    IN p_precio_venta DECIMAL(10,2),  -- Precio de venta
    IN p_tipo_venta VARCHAR(50)       -- Tipo de venta (Ej. Compra Nueva, Compra Usada)
)
BEGIN
    -- Insertamos la venta en la tabla VENTA
    INSERT INTO VENTA (id_moto, id_comprador, fecha_venta, precio_venta, tipo_venta)
    VALUES (p_id_moto, p_id_comprador, p_fecha_venta, p_precio_venta, p_tipo_venta);
END $$

DELIMITER ;

-- TRIGGER
CREATE TABLE AUDITORIA_VENTAS (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    id_moto INT NOT NULL,
    id_comprador INT NOT NULL,
    precio_venta DECIMAL(10,2),
    fecha_venta DATE
);

DELIMITER $$

CREATE TRIGGER AuditarVenta
AFTER INSERT ON VENTA
FOR EACH ROW
BEGIN
    -- Insertamos un registro en la tabla de auditoría cada vez que se registre una venta
    INSERT INTO AUDITORIA_VENTAS (id_moto, id_comprador, precio_venta, fecha_venta)
    VALUES (NEW.id_moto, NEW.id_comprador, NEW.precio_venta, NEW.fecha_venta);
END $$

DELIMITER ;




