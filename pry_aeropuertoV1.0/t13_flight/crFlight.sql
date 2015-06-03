/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crFlight.sql
Autor         : Juan ospina
Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación de la tabla para registrar los vuelos del aeropuereto
Observaciones :
Historia de Modificaciones
Fecha          IDEntrega
02-03-2014    <Autor>SAONNNNN
Modificacion
*/CREATE TABLE flight(
    sbId                varchar2(256),   --PK
    sbNotes             varchar2(1024),
    sbDepartureTime     varchar2(1024),
    sbLandingTime       varchar2(1024),   
    sbAirplaneId        varchar(256),     --FK
    sbStatus            varchar2(256),
    sbDescription       varchar2(1024),
    sbAirlineId         varchar2(256)
);

