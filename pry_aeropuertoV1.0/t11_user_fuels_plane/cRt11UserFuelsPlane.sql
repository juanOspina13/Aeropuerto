/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crUserFuelsPlane.sql
Autor         : Juan ospina
Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación de la tabla para registrar los tanqueos de los usuarios
Observaciones :
Historia de Modificaciones
Fecha          IDEntrega
02-03-2014    <Autor>SAONNNNN
Modificacion
*/
CREATE TABLE user_fuels_plane(
        sbId            varchar2(256),
        nuQuantity      number,
        daFuelingTime   date,
        sbUserId        varchar2(256),    --FK
        sbLandingBayId  varchar2(256),    --FK
        sbFuelTypeId    varchar2(256),    --FK
        sbFlightId      varchar2(256),    --FK
        sbAirlineId     varchar2(256)     --FK
);