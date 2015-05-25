/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crPKTrack.sql
Autor         : Juan ospina
Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación de la llave primaria de las pistas
Observaciones : 
Historia de Modificaciones
Fecha          IDEntrega
02-03-2014    <Autor>SAONNNNN
Modificacion

*/ 
 ALTER TABLE track ADD
    CONSTRAINT track_pk
    PRIMARY KEY (sbId)
    USING INDEX ENABLE;
    