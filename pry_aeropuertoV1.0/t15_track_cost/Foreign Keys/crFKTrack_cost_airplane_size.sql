/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crFKUsers_fuels_plane_airplane_size.sql
 Autor         : Juan Ospina
 Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación llave foranea relacionada con tamaño de aviones
 Observaciones :

 Historia de Modificaciones
 Fecha          IDEntrega

 02-03-2014    <Autor>SAONNNNN
 Modificacion
*/
ALTER TABLE track_cost ADD
    CONSTRAINT fk_track_cost_tamanho_avion
    FOREIGN KEY (sbTamanhoAvionId)
    REFERENCES  airplane_size (sbId);