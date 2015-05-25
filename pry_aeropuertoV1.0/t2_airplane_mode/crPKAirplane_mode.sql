/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crPKAirplane_mode.sql
Autor         : Juan ospina
Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación de la llave primaria de modalidad de aerolineas
Observaciones : 
Historia de Modificaciones
Fecha          IDEntrega
02-03-2014    <Autor>SAONNNNN
Modificacion

*/ 
ALTER TABLE airplane_mode ADD
    CONSTRAINT airplane_mode_pk
    PRIMARY KEY (sbId)
    USING INDEX ENABLE; 