/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crPKUserFuelPlane.sql
Autor         : Juan ospina
Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación de llave primaria para tanqueos de combustible
Observaciones :
Historia de Modificaciones
Fecha          IDEntrega
02-03-2014    <Autor>SAONNNNN
Modificacion
*/
ALTER TABLE user_fuels_plane ADD
    CONSTRAINT user_fuels_plane_pk
    PRIMARY KEY (sbId)
    USING INDEX ENABLE;