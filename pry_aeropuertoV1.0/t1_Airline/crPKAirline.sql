/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crPKAirlines.sql
Autor         : Juan ospina
Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación de la llave primaria de aerolineas
Observaciones : 
Historia de Modificaciones
Fecha          IDEntrega
02-03-2014    <Autor>SAONNNNN
Modificacion

*/ 

ALTER TABLE airline ADD
    CONSTRAINT airline_pk
    PRIMARY KEY (airline_id)
    USING INDEX ENABLE;
        