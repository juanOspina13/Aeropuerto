/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crPKTrackCost.sql
Autor         : Juan ospina
Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación de la llave primaria para los costos de uso de pistas
Observaciones :
Historia de Modificaciones
Fecha          IDEntrega
02-03-2014    <Autor>SAONNNNN
Modificacion
*/ALTER TABLE track_cost ADD
    CONSTRAINT track_cost_pk
    PRIMARY KEY (sbId)
    USING INDEX ENABLE;