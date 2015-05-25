/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crPKAirlines.sql
Autor         : Juan ospina
Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación de la llave primaria de tipos de detalles(plano de txt que entra desde un programa externo)
Observaciones : 
Historia de Modificaciones
Fecha          IDEntrega
02-03-2014    <Autor>SAONNNNN
Modificacion

*/ 
ALTER TABLE detail ADD
    CONSTRAINT detail_pk
    PRIMARY KEY (sbId)
    USING INDEX ENABLE;