/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crTrack_totalizacion.sql
Autor         : Juan ospina
Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación de la tabla totalizacion para pistas
Observaciones :
Historia de Modificaciones
Fecha          IDEntrega
02-03-2014    <Autor>SAONNNNN
Modificacion
*/
CREATE TABLE track_totalization(
    sbId            varchar2(256)   NOT NULL,
    sbAirlineid    varchar2(256)   NOT NULL,
    nuMonth         number          NOT NULL,
    nuYear          number          NOT NULL,
    nuTotal         number          NOT NULL
) ;

