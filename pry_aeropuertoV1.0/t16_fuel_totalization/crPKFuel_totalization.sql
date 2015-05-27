/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crPKFuel_totalization.sql
Autor         : Juan ospina
Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación de la llave primaria a la tabla para totalizar el uso de combustible por aerolinea
Observaciones :
Historia de Modificaciones
Fecha          IDEntrega
02-03-2014    <Autor>SAONNNNN
Modificacion
*/
ALTER TABLE fuel_totalization ADD
    CONSTRAINT fuel_totalization
    PRIMARY KEY (sbId)
    USING INDEX ENABLE;