/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crDetail.sql
Autor         : Juan ospina
Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación de la tabla tipo de detalles
Observaciones :
Historia de Modificaciones
Fecha          IDEntrega
02-03-2014    <Autor>SAONNNNN
Modificacion
*/

CREATE TABLE detail(
    sbId                    varchar2(256),              --PK
    daLandingTime           date,
    daComunnicationTime     date,
    sbTrackId               varchar2(256),        --FK
    sbAirlineId             varchar2(256),      --FK
    sbAirplaneMode          varchar2(256),   --FK
    sbAirplaneId            varchar2(256),    --FK
    sbFlightId              varchar2(256),    --FK
    sbAirplaneSizeId        varchar2(256)     --FK
);
