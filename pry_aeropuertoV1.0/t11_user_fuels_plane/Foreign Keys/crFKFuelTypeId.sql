/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crFKUsers_fuels_plane_fuel_type.sql
 Autor         : Juan Ospina
 Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación llave foranea Tipo de combustible
 Observaciones :

 Historia de Modificaciones
 Fecha          IDEntrega

 02-03-2014    <Autor>SAONNNNN
 Modificacion
*/
ALTER TABLE user_fuels_plane ADD
    CONSTRAINT fk_user_fuels_fuel_type
    FOREIGN KEY (sbFuelTypeId)
    REFERENCES  fuel_type (sbId);