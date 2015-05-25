/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crTrackCost.sql
Autor         : Juan ospina
Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación de la tabla para registrar los costos por usos aeroportuarios(De pistas)
Observaciones :
Historia de Modificaciones
Fecha          IDEntrega
02-03-2014    <Autor>SAONNNNN
Modificacion
*/CREATE TABLE track_cost(
    sbId                varchar2(256),      --PK
    sbTamanhoAvionId    varchar2(256),      --FK 
    sbPlaneModeId       varchar2(256),      --FK
    sbTrackId           varchar2(256),      --FK
    sbAirlineId         varchar2(256),      --FK
    nuCost              number
);