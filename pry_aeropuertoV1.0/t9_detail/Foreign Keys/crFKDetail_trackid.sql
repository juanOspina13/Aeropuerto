/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crFKDetail_track.sql
 Autor         : Juan Ospina
 Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación llave foranea relacionada con pistas
 Observaciones :

 Historia de Modificaciones
 Fecha          IDEntrega

 02-03-2014    <Autor>SAONNNNN
 Modificacion
*/
ALTER TABLE detail ADD
    CONSTRAINT fk_detail_track_id
    FOREIGN KEY (sbTrackId)
    REFERENCES  track (sbId);