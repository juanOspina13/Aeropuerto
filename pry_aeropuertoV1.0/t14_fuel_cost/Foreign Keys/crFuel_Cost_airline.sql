/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crFKFuel_cost_airline.sql
 Autor         : Juan Ospina
 Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación llave foranea relacionada con aerolineas
 Observaciones :

 Historia de Modificaciones
 Fecha          IDEntrega

 02-03-2014    <Autor>SAONNNNN
 Modificacion
*/
ALTER TABLE fuel_cost ADD
    CONSTRAINT fk_fuel_cost_airline
    FOREIGN KEY (sbAirlineId)
    REFERENCES  airline (sbId);