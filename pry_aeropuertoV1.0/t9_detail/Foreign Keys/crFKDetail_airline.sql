/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crFKDetail_airline.sql
 Autor         : Juan Ospina
 Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación llave foranea relacionada con aerolineas
 Observaciones :

 Historia de Modificaciones
 Fecha          IDEntrega

 02-03-2014    <Autor>SAONNNNN
 Modificacion
*/
ALTER TABLE detail ADD
    CONSTRAINT fk_detail_airline
    FOREIGN KEY (sbAirlineId)
    REFERENCES  airline (sbId);