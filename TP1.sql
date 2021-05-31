-- Tienda de ropa
use negocioWebRopa;

-- ///////////////////   TABLA ARTICULOS ////////////////////////////////////////////////////

DROP PROCEDURE IF EXISTS SP_Articulos_Insert_Min;
DELIMITER //
CREATE PROCEDURE SP_Articulos_Insert_Min(
IN descripcion varchar(25),
tipo enum('CALZADO', 'ROPA'),
stock int(11),
costo double,
precio double)
       BEGIN
        INSERT INTO articulos(descripcion, tipo, stock, costo, precio)
        VALUES(descripcion, tipo, stock, costo, precio);
       END//
DELIMITER ; 

CALL SP_Articulos_Insert_Min('Campera','ROPA', 50, 20500, 23000); 

DROP PROCEDURE IF EXISTS SP_Articulos_Insert_Full;
DELIMITER //
CREATE PROCEDURE SP_Articulos_Insert_Full(
IN descripcion varchar(25),
tipo enum('CALZADO', 'ROPA'),
color varchar(20),
talle_num varchar(20),
stock int(11),
stockMin int(11),
stockMax int(11),
costo double,
precio double,
temporada enum('VERANO', 'OTOÑO', 'INVIERNO'))
          BEGIN
            INSERT INTO articulos(descripcion, tipo, color, talle_num, stock, stockMin, stockMax, costo, precio, temporada)
            VALUES(descripcion, tipo, color, talle_num, stock, stockMin, stockMax, costo, precio, temporada);
          END //
DELIMITER ;

CALL SP_Articulos_Insert_Full('Musculosa', 'ROPA', 'negro', 'XL', 150, 50, 200, 750, 1000, 'VERANO'); 

select * from articulos;

DROP PROCEDURE IF EXISTS SP_Articulos_Delete;
DELIMITER //
CREATE PROCEDURE SP_Articulos_Delete(
IN Artid int)
       BEGIN
        DELETE FROM articulos
        WHERE id = Artid;
       END //
DELIMITER ; 

CALL SP_Articulos_Delete(11); 

SELECT * FROM articulos; 

DROP PROCEDURE IF EXISTS SP_Articulos_Update_descripcion;
DELIMITER // 
CREATE PROCEDURE SP_Articulos_Update_Descripcion(
IN valor varchar(50),
ArtId int)
   BEGIN
    UPDATE articulos
    SET descripcion = valor
    WHERE id = ArtId;
   END //
DELIMITER ; 

DROP PROCEDURE IF EXISTS SP_Articulos_Update_tipo;
DELIMITER //
CREATE PROCEDURE SP_Articulos_Update_Tipo(
IN valor varchar(50),
ArtId int)
   BEGIN
    UPDATE articulos
    SET tipo = valor
    WHERE id = ArtId;
   END //
DELIMITER ; 

DROP PROCEDURE IF EXISTS SP_Articulos_Update_color;
DELIMITER //
CREATE PROCEDURE SP_Articulos_Update_color(
IN valor varchar(50),
ArtId int)
   BEGIN
    UPDATE articulos
    SET color = valor
    WHERE id=ArtId;
   END //
DELIMITER ; 

DROP PROCEDURE IF EXISTS SP_Articulos_Update_talle;
DELIMITER //
CREATE PROCEDURE SP_Articulos_Update_talle(
IN valor varchar(50),
ArtId int)
   BEGIN
    UPDATE articulos
    SET talle_num = valor
    WHERE id=ArtId;
   END //
DELIMITER ; 

DROP PROCEDURE IF EXISTS SP_Articulos_Update_stock;
DELIMITER //
CREATE PROCEDURE SP_Articulos_Update_stock(
IN valor varchar(50),
ArtId int)
   BEGIN
    UPDATE articulos
    SET stock = valor
    WHERE id=ArtId;
   END //
DELIMITER ; 

DROP PROCEDURE IF EXISTS SP_Articulos_Update_stockMin;
DELIMITER //
CREATE PROCEDURE SP_Articulos_Update_stockMin(
IN valor varchar(50),
ArtId int)
   BEGIN
    UPDATE articulos
    SET stockMin = valor
    WHERE id=ArtId;
   END //
DELIMITER ; 

DROP PROCEDURE IF EXISTS SP_Articulos_Update_stockMax;
DELIMITER //
CREATE PROCEDURE SP_Articulos_Update_stockMax(
IN valor varchar(50),
ArtId int)
   BEGIN
    UPDATE articulos
    SET stockMax = valor
    WHERE id=ArtId;
   END //
DELIMITER ; 

DROP PROCEDURE IF EXISTS SP_Articulos_Update_costo;
DELIMITER //
CREATE PROCEDURE SP_Articulos_Update_costo(
IN valor varchar(50),
ArtId int)
   BEGIN
    UPDATE articulos
    SET costo = valor
    WHERE id=ArtId;
   END //
DELIMITER ; 

DROP PROCEDURE IF EXISTS SP_Articulos_Update_precio;
DELIMITER //
CREATE PROCEDURE SP_Articulos_Update_precio(
IN valor varchar(50),
ArtId int)
   BEGIN
    UPDATE articulos
    SET precio = valor
    WHERE id=ArtId;
   END //
DELIMITER ; 

DROP PROCEDURE IF EXISTS SP_Articulos_Update;
DELIMITER //
CREATE PROCEDURE SP_Articulos_Update(
IN columna varchar(20),
valor varchar(50),
id int)
   BEGIN
    CASE columna
    WHEN 'descripcion' THEN CALL SP_Articulos_Update_descripcion(valor, id);
    WHEN 'tipo' THEN CALL SP_Articulos_Update_tipo(valor, id);
    WHEN 'color' THEN CALL SP_Articulos_Update_color(valor, id);
    WHEN 'talle_num' THEN CALL SP_Articulos_Update_talle(valor, id);
    WHEN 'stock' THEN CALL SP_Articulos_Update_stock(valor, id);
    WHEN 'stockMin'THEN CALL SP_Articulos_Update_stockMin(valor, id);
    WHEN 'stockMax' THEN CALL SP_Articulos_Update_stockMax(valor, id);
    WHEN 'costo' THEN CALL SP_Articulos_Update_costo(valor, id);
    WHEN 'precio' THEN CALL SP_Articulos_Update_precio(valor, id);
    END CASE;
   END //
DELIMITER ; 

CALL SP_Articulos_Update('descripcion', 'Cinturon', 1); 

CALL SP_Articulos_Update('precio', '9995', 9);

CALL SP_Articulos_Update('tipo', 'CALZADO', 2); 

SELECT * FROM articulos;

DROP PROCEDURE IF EXISTS SP_Articulos_All;
DELIMITER //
CREATE PROCEDURE SP_Articulos_All()
       BEGIN
        SELECT *
        FROM articulos;
       END //
DELIMITER ; 

CALL SP_Articulos_All(); 

DROP PROCEDURE IF EXISTS SP_Articulos_Reponer;
DELIMITER //
CREATE PROCEDURE SP_Articulos_Reponer(
IN articulo varchar(30),
ArtId int,
cantidad int(11))
         BEGIN
          UPDATE articulos
          SET stock = cantidad + stock
          WHERE descripcion = articulo AND id = ArtId;
         END //
DELIMITER ; 

CALL SP_Articulos_Reponer('Pantalones',3, 10); 

SELECT * FROM articulos;


-- ////////////////// TABLA FACTURAS ////////////////////////////////////////////////////////////

DROP PROCEDURE IF EXISTS SP_Facturas_Insert;
DELIMITER //
CREATE PROCEDURE SP_Facturas_Insert(
IN letra enum('A','B','C'),
numero int,
fecha date,
medioDePago enum('EFECTIVO','DEBITO','TARJETA'),
idCliente int)
       BEGIN
        INSERT INTO facturas(letra,numero,fecha,medioDePago,idCliente)
        VALUES(letra,numero,fecha,medioDePago,idCliente);
       END //
DELIMITER ; 

CALL SP_Facturas_Insert('B',907,'2020-09-09','TARJETA',5); 

SELECT * FROM facturas; 

DROP PROCEDURE IF EXISTS SP_Facturas_Delete;
DELIMITER //
CREATE PROCEDURE SP_Facturas_Delete(
IN FactId int)
       BEGIN
        DELETE FROM facturas
        WHERE id = FactId;
       END //
DELIMITER ; 

CALL SP_Facturas_Delete(6);

SELECT * FROM facturas; 

DROP PROCEDURE IF EXISTS SP_Facturas_Update_letra;
DELIMITER //
CREATE PROCEDURE SP_Facturas_Update_letra(
IN valor varchar(35),
FactId int)
   BEGIN
    UPDATE facturas
    SET letra = valor
    WHERE id = FactId;
   END //
DELIMITER ; 

DROP PROCEDURE IF EXISTS SP_Facturas_Update_numero;
DELIMITER //
CREATE PROCEDURE SP_Facturas_Update_numero(
IN valor varchar(35),
FactId int)
       BEGIN
        UPDATE facturas
        SET numero = valor
        WHERE id = FactId;
       END //
DELIMITER ; 

DROP PROCEDURE IF EXISTS SP_Facturas_Update_fecha;
DELIMITER //
CREATE PROCEDURE SP_Facturas_Update_fecha(
IN valor varchar(35),
FactId int)
       BEGIN
        UPDATE facturas
        SET fecha = valor
        WHERE id = FactId;
       END //
DELIMITER ; 

DROP PROCEDURE IF EXISTS SP_Facturas_Update_medioDePago;
DELIMITER //
CREATE PROCEDURE SP_Facturas_Update_medioDePago(
IN valor varchar(35),
FactId int)
       BEGIN
        UPDATE facturas
        SET medioDePago = valor
        WHERE id = FactId;
       END //
DELIMITER ; 

DROP PROCEDURE IF EXISTS SP_Facturas_Update_IdCliente;
DELIMITER //
CREATE PROCEDURE SP_Facturas_Update_IdCliente(
IN valor varchar(35),
FactId int)
       BEGIN
        UPDATE facturas
        SET IdCliente = valor
        WHERE id = FactId;
       END //
DELIMITER ; 

DROP PROCEDURE IF EXISTS SP_Facturas_Update;
DELIMITER //
CREATE PROCEDURE SP_Facturas_Update(
IN columna varchar(35),
valor varchar(35),
id int)
       BEGIN
        CASE columna
        WHEN 'letra' THEN CALL SP_Facturas_Update_letra(valor, id);
        WHEN 'numero' THEN CALL SP_Facturas_Update_numero(valor, id);
        WHEN 'fecha' THEN CALL SP_Facturas_Update_fecha(valor, id);
        WHEN 'medioDePago' THEN CALL SP_Facturas_Update_medioDePago(valor, id);
        WHEN 'idCliente' THEN CALL SP_Facturas_Update_IdCliente(valor, id);
        END CASE;
       END //
DELIMITER ; 

CALL SP_Facturas_Update('fecha', '2021-05-10', 2); 

CALL SP_Facturas_Update('medioDePago', 'EFECTIVO', 5); 

SELECT * FROM facturas; 

DROP PROCEDURE IF EXISTS SP_Facturas_All;
DELIMITER //
CREATE PROCEDURE SP_Facturas_All()
       BEGIN
        SELECT *
        FROM facturas;
       END //
DELIMITER ; 

CALL SP_Facturas_All(); 

DROP PROCEDURE IF EXISTS SP_Facturas_AgregarDetalle;
DELIMITER //
CREATE PROCEDURE SP_Facturas_AgregarDetalle(
IN idArticulo int,
idFactura int,
precio double,
cantidad int)
       BEGIN
        INSERT INTO detalles(idArticulo,idFactura,precio,cantidad)
        VALUES(idArticulo,idFactura,precio,cantidad);
       END //
DELIMITER ; 

CALL SP_Facturas_AgregarDetalle(10, 5, 45000, 12); 

SELECT * FROM detalles; 

-- ///////////////// TABLA DETALLES //////////////////////////////////////////////////////// 

DROP PROCEDURE IF EXISTS SP_Detalles_Delete;
DELIMITER //
CREATE PROCEDURE SP_Detalles_Delete(
IN DetId int)
       BEGIN
        DELETE FROM detalles
        WHERE id = DetId;
       END //
DELIMITER ; 

CALL SP_Detalles_Delete(9);

SELECT * FROM detalles; 

DROP PROCEDURE IF EXISTS SP_Detalles_All;
DELIMITER //
CREATE PROCEDURE SP_Detalles_All()
       BEGIN
        SELECT *
        FROM detalles;
       END //
DELIMITER ; 

CALL SP_Detalles_All(); 
