/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crFKUsers_fuels_plane_flight.sql
 Autor         : Juan Ospina
 Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación llave foranea Vuelo
 Observaciones :

 Historia de Modificaciones
 Fecha          IDEntrega

 02-03-2014    <Autor>SAONNNNN
 Modificacion
*/
ALTER TABLE user_fuels_plane ADD
    CONSTRAINT fk_user_fuels_flight
    FOREIGN KEY (sbFlightId)
    REFERENCES  flight (sbId);