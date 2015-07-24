/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crFKFuel_totalization_airline.sql
 Autor         : Juan Ospina
 Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación llave foranea relacionada con las aerolineas
 Observaciones :

 Historia de Modificaciones
 Fecha          IDEntrega

 02-03-2014    <Autor>SAONNNNN
 Modificacion
*/
ALTER TABLE fuel_totalization ADD
    CONSTRAINT fk_fuel_totalization_airline
    FOREIGN KEY (sbAirlineId)
    REFERENCES  airline (sbId);