/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crFKDetail_airplane.sql
 Autor         : Juan Ospina
 Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación llave foranea relacionada con aviones
 Observaciones :

 Historia de Modificaciones
 Fecha          IDEntrega

 02-03-2014    <Autor>SAONNNNN
 Modificacion
*/
ALTER TABLE detail ADD
    CONSTRAINT fk_detail_airline
    FOREIGN KEY (sbAirplaneID)
    REFERENCES  airplane (sbId);