/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crFKFlight_airplane.sql
 Autor         : Juan Ospina
 Fecha         : <28-02-2015> ( Fecha creaci�n )

 Descripci�n   : Creaci�n llave foranea relacionada con Aviones
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
    
