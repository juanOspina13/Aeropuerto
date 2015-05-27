/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crFKDetail_airplane_mode.sql
 Autor         : Juan Ospina
 Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación llave foranea relacionada con modalidades de aviones
 Observaciones :

 Historia de Modificaciones
 Fecha          IDEntrega

 02-03-2014    <Autor>SAONNNNN
 Modificacion
*/
ALTER TABLE detail ADD
    CONSTRAINT fk_detail_airplane_mode
    FOREIGN KEY (sbAirplaneMode)
    REFERENCES  airplane_mode (sbId);