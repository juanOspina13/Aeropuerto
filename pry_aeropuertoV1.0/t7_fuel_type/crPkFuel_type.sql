/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crPKAirlines.sql
Autor         : Juan ospina
Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación de la llave primaria de tipos de combustible
Observaciones : 
Historia de Modificaciones
Fecha          IDEntrega
02-03-2014    <Autor>SAONNNNN
Modificacion

*/ 
ALTER TABLE fuel_type ADD
    CONSTRAINT t7_fuel_type_pk
    PRIMARY KEY (sbId)
    USING INDEX ENABLE;
      