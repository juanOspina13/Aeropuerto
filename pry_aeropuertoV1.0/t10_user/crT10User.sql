/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crUser.sql
Autor         : Juan ospina
Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación de la tabla para los usuarios
Observaciones :
Historia de Modificaciones
Fecha          IDEntrega
02-03-2014    <Autor>SAONNNNN
Modificacion
*/
CREATE TABLE users(
    sbId varchar2(256),              --PK
    sbDescription varchar2(256),
    sbUsername varchar2(256),
    sbPassword varchar2(256),
    sbRole varchar2(256),           --hay que darle el dominio 1= admin, 2 =tanqueador
    sbNotes varchar2(1024)
);
