/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crFKUsers_fuels_plane_user.sql
 Autor         : Juan Ospina
 Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación llave foranea relacionada con usuarios
 Observaciones :

 Historia de Modificaciones
 Fecha          IDEntrega

 02-03-2014    <Autor>SAONNNNN
 Modificacion
*/
ALTER TABLE user_fuels_plane ADD
    CONSTRAINT fk_user_fuels_plane_users
    FOREIGN KEY (sbUserId)
    REFERENCES  users (sbId);