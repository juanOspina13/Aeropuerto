/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crFlight_airline.sql
 Autor         : Juan Ospina
 Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación llave foranea relacionada con Aerolineas
 Observaciones :

 Historia de Modificaciones
 Fecha          IDEntrega

 02-03-2014    <Autor>SAONNNNN
 Modificacion
*/
ALTER TABLE flight ADD
    CONSTRAINT fk_flight_airplane
    FOREIGN KEY (sbAirplaneId)
    REFERENCES  airplane (sbId);
    