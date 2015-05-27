/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crFuel_totalization.sql
Autor         : Juan ospina
Fecha         : <28-02-2015> ( Fecha creaci�n )

 Descripci�n   : Creaci�n de la tabla para la totalizacion de combustibles
Observaciones :
Historia de Modificaciones
Fecha          IDEntrega
02-03-2014    <Autor>SAONNNNN
Modificacion
*/
CREATE TABLE fuel_totalization(
    sbId            varchar2(256),      
    daInicio        date,
    sbAirlineId     varchar2(256),
    nuTotal         number
);
