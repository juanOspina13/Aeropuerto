/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crFKUser_fuels_plane_airline.sql
 Autor         : Juan Ospina
 Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación llave foranea Aerolineas
 Observaciones :

 Historia de Modificaciones
 Fecha          IDEntrega

 02-03-2014    <Autor>SAONNNNN
 Modificacion
*/ALTER TABLE user_fuels_plane ADD
    CONSTRAINT fk_user_fuels_airline
    FOREIGN KEY (sbAirlineId)
    REFERENCES  airline(sbId)