/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crFKTotalization_airline.sql
 Autor         : Juan Ospina
 Fecha         : <28-02-2015> ( Fecha creaci�n )

 Descripci�n   : Creaci�n llave foranea relacionada con totalizaciones de uso aeroportuario
 Observaciones :

 Historia de Modificaciones
 Fecha          IDEntrega

 02-03-2014    <Autor>SAONNNNN
 Modificacion
*/
ALTER TABLE track_totalization ADD
    CONSTRAINT fk_traTota_airline
    FOREIGN KEY (sbAirlineId)
    REFERENCES  airline (sbId);