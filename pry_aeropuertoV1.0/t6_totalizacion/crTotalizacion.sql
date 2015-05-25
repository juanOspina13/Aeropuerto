/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crTotalizacion.sql
Autor         : Juan ospina
Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación de la tabla totalizacion
Observaciones :
Historia de Modificaciones
Fecha          IDEntrega
02-03-2014    <Autor>SAONNNNN
Modificacion
*/
CREATE TABLE totalizacion (
    sbId            varchar2(256)  NOT NULL,
    sbAirline_id    varchar2(256)  NOT NULL,
    daDate          date  NOT NULL,
    nuTotal         number NOT NULL
) ;


