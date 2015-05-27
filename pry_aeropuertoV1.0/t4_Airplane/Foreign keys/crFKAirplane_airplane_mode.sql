/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crFKAirplane_airplane_mode.sql
 Autor         : Juan Ospina
 Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación llave foranea relacionada con modalidades de aerolineas
 Observaciones :

 Historia de Modificaciones
 Fecha          IDEntrega

 02-03-2014    <Autor>SAONNNNN
 Modificacion
*/
ALTER TABLE airplane ADD
    CONSTRAINT fk_Airplane_airplane_mode
    FOREIGN KEY (sbAirplineModeId)
    REFERENCES  airplane_mode (sbId);