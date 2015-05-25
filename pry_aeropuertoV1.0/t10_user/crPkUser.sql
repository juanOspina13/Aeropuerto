/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crPKUsers.sql
Autor         : Juan ospina
Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación de la llave primaria a la tabla de usuarios
Observaciones :
Historia de Modificaciones
Fecha          IDEntrega
02-03-2014    <Autor>SAONNNNN
Modificacion
*/
ALTER TABLE users ADD
    CONSTRAINT users_pk
    PRIMARY KEY (sbId)
    USING INDEX ENABLE;