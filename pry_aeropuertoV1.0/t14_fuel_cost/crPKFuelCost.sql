/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crPKFuelCost.sql
Autor         : Juan ospina
Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación de la llave primaria para los costos de tanqueo
Observaciones :
Historia de Modificaciones
Fecha          IDEntrega
02-03-2014    <Autor>SAONNNNN
Modificacion
*/
ALTER TABLE fuel_cost ADD
    CONSTRAINT fuel_cost_pk
    PRIMARY KEY (sbAirplaneSize,sbAirlineId,sbFuelTypeId)
    USING INDEX ENABLE;

 