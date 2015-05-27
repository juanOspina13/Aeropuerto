/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crFKUsers_fuels_plane_landing_bay.sql
 Autor         : Juan Ospina
 Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación llave foranea relacionada con bahías de aterrizaje para aviones
 Observaciones :

 Historia de Modificaciones
 Fecha          IDEntrega

 02-03-2014    <Autor>SAONNNNN
 Modificacion
*/
ALTER TABLE user_fuels_plane ADD
    CONSTRAINT fkuser_fuels_plane_landi
    FOREIGN KEY (sbLandingBayId)
    REFERENCES  landing_bay (sbId);