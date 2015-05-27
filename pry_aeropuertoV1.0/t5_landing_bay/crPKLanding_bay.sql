/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crPKLanding_bay.sql
Autor         : Juan ospina
Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación de la llave primaria de bahías de aterrizaje de aviones
Observaciones : 
Historia de Modificaciones
Fecha          IDEntrega
02-03-2014    <Autor>SAONNNNN
Modificacion

*/  
ALTER TABLE landing_bay ADD
    CONSTRAINT t5_landing_bay_pk
    PRIMARY KEY (sbId)
    USING INDEX ENABLE; 