/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crFKTotalization_airline.sql
 Autor         : Juan Ospina
 Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación llave foranea relacionada con totalizaciones de uso aeroportuario
 Observaciones :

 Historia de Modificaciones
 Fecha          IDEntrega

 02-03-2014    <Autor>SAONNNNN
 Modificacion
*/
ALTER TABLE totalization ADD
    CONSTRAINT fk_totalization_airplane_mode
    FOREIGN KEY (sbAirline_id)
    REFERENCES  airline (sbId);