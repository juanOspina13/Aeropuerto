/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crPKAirplane.sql
Autor         : Juan ospina
Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación de la llave primaria de Aviones
Observaciones : 
Historia de Modificaciones
Fecha          IDEntrega
02-03-2014    <Autor>SAONNNNN
Modificacion

*/ 

ALTER TABLE airplane ADD
    CONSTRAINT airplane_pk
    PRIMARY KEY (sbId)
    USING INDEX ENABLE;
    