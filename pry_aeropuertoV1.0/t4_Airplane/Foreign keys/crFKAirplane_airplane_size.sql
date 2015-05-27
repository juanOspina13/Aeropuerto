/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crFKAirplane_airplane_size.sql
 Autor         : Juan Ospina
 Fecha         : <28-02-2015> ( Fecha creaci�n )

 Descripci�n   : Creaci�n llave foranea relacionada con tama�os de aviones
 Observaciones :

 Historia de Modificaciones
 Fecha          IDEntrega

 02-03-2014    <Autor>SAONNNNN
 Modificacion
*/
ALTER TABLE airplane ADD
    CONSTRAINT fk_Airplane_airplane_size
    FOREIGN KEY (itfaprco)
    REFERENCES  JO_Producto (prodcons);