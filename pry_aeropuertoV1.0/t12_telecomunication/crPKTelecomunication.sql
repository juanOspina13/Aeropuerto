/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crPKTelecomunication.sql
Autor         : Juan ospina
Fecha         : <28-02-2015> ( Fecha creaci�n )

 Descripci�n   : Creaci�n de la llave primaria para los tipos de telecomunicaciones
Observaciones :
Historia de Modificaciones
Fecha          IDEntrega
02-03-2014    <Autor>SAONNNNN
Modificacion
*/
ALTER TABLE telecomunication ADD 
  CONSTRAINT telecomunication_pk
  PRIMARY KEY (sbId)
  USING INDEX ENABLE;