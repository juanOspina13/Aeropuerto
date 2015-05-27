/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crFKTrack_cost_airplane_mode.sql
 Autor         : Juan Ospina
 Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación llave foranea relacionada con modalidades de aviones
 Observaciones :

 Historia de Modificaciones
 Fecha          IDEntrega

 02-03-2014    <Autor>SAONNNNN
 Modificacion
*/
ALTER TABLE track_cost ADD
    CONSTRAINT fk_track_cost_tamanho_avion
    FOREIGN KEY (sbTamanhoAvionId)
    REFERENCES  airplane_mode (sbId);