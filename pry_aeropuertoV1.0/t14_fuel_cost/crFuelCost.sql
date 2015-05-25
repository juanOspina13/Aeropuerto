/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crFuelCost.sql
Autor         : Juan ospina
Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación de la tabla para registrar los costos por aerolinea,avion y tipo de combustible
Observaciones :
Historia de Modificaciones
Fecha          IDEntrega
02-03-2014    <Autor>SAONNNNN
Modificacion
*/
CREATE TABLE fuel_cost(
    sbId                varchar2(256),
    sbAirplaneSize      varchar2(256),      --FK
    sbAirlineId         varchar2(256),      --FK
    sbFuelTypeId        varchar2(256),      --FK
    nuCost              number
);