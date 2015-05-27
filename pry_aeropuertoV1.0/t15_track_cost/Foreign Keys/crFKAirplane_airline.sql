/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crFKTrack_cost_airline.sql
 Autor         : Juan Ospina
 Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación llave foranea relacionada con aerolineas
 Observaciones :

 Historia de Modificaciones
 Fecha          IDEntrega

 02-03-2014    <Autor>SAONNNNN
 Modificacion
*/
ALTER TABLE airplane ADD
    CONSTRAINT fk_Airplane_airline
    FOREIGN KEY (sbAirlineId)
    REFERENCES  airline (sbId);