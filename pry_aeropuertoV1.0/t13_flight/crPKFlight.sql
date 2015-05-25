/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crPKFlight.sql
Autor         : Juan ospina
Fecha         : <28-02-2015> ( Fecha creación )

 Descripción   : Creación de la llave primaria para los vuelos
Observaciones :
Historia de Modificaciones
Fecha          IDEntrega
02-03-2014    <Autor>SAONNNNN
Modificacion
*/
ALTER TABLE flight ADD
  CONSTRAINT flight_pk
  PRIMARY KEY (sbId)
  USING INDEX ENABLE;