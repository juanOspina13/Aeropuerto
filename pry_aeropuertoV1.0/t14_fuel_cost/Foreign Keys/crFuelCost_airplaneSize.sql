/*
 Propiedad intelectual de OPEN International Systems Ltda

 Archivo       : crFKFuel_cost_airplane_size.sql
 Autor         : Juan Ospina
 Fecha         : <28-02-2015> ( Fecha creaci�n )

 Descripci�n   : Creaci�n llave foranea relacionada con tama�o de los aviones
 Observaciones :

 Historia de Modificaciones
 Fecha          IDEntrega

 02-03-2014    <Autor>SAONNNNN
 Modificacion
*/
ALTER TABLE fuel_cost ADD
    CONSTRAINT fk_fuel_cost_airplane_size
    FOREIGN KEY (sbAirplaneSize)
    REFERENCES  airplane_size (sbId);