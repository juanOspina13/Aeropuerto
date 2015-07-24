/*
  Paquete que liquida el consumo de combustible por aerolinea,
  falta que liquide las aerolineas seleccionadas y en el mes que se quiera
  liquidar
*/
CREATE OR REPLACE PACKAGE BC_LIQCOM IS
  
  TYPE rec_airlines IS RECORD
  (
      sbAirlineId   airline.sbId%type                    
  );
  
  TYPE rec_airCombs IS RECORD(
      sbAirlineId   airline.sbId%type,
      nuTotal       number
  );
  
  TYPE rec_airline IS TABLE OF rec_airlines INDEX BY BINARY_INTEGER;
  TYPE rec_airComb IS TABLE OF rec_airCombs INDEX BY BINARY_INTEGER;
  
  
  PROCEDURE get_CombAir
  (
        airlines        IN  rec_airline,
        month_between   IN  date,
        airComb         IN  rec_aircomb
  );
  
END BC_LIQCOM;
/
CREATE OR REPLACE PACKAGE BODY BC_LIQCOM
IS
 PROCEDURE get_CombAir
  (
        airlines        IN  rec_airline,
        month_between   IN  date,
        airComb         IN  rec_aircomb
  )
  IS
    sbSqlString     varchar2(2056);
    sbSqlFields     varchar2(512);
    sbSqlWhere      varchar2(512);
    sbSqlFrom       varchar2(512);
    
    TYPE rec_airCosts IS RECORD
    (
          sbAirlineId   airline.sbId%type,
          nuCost        fuel_cost.nuCost%type
    );
    
    TYPE aux_airCosts IS RECORD
    (
          sbAirlineId     airline.sbId%type,
          nuTotal         fuel_cost.nuCost%type
    );
    
    TYPE rec_airCost IS TABLE OF rec_airCosts INDEX BY BINARY_INTEGER;
    TYPE rec_auxCost IS TABLE OF aux_airCosts INDEX BY varchar2(1024);
    
    rec_air   rec_airCost;
    rec_aux   rec_auxCost;
    
  BEGIN
      sbSqlFields := ' user_fuels_plane.sbAirlineid,
                       user_fuels_plane.nuQUantity * fuel_cost.NUCOST 
                          as costo_tanqueo ';
                              
      sbSqlFrom := ' user_fuels_plane,
                          fuel_cost ';

      sbSqlWhere:='fuel_cost.sbAirplaneSize = user_fuels_plane.SBAIRPLANESIZE 
                      AND fuel_cost.SBAIRLINEID = user_fuels_plane.SBAIRLINEID
                      AND fuel_cost.SBFUELTYPEID = user_fuels_plane.SBFUELTYPEID';                          
      
      sbSqlString:='SELECT ' 
                    || sbSqlFields 
                    || ' FROM '
                    || sbSqlFrom
                    ||' WHERE '
                    ||sbSqlWhere;
      
      EXECUTE IMMEDIATE sbSqlString BULK COLLECT INTO rec_air;      
      
        
      FOR i in rec_air.first .. rec_air.last LOOP
      
          rec_aux( rec_air(i).sbAirlineId ).nuTotal := 0;    
          rec_aux( rec_air(i).sbAirlineId ).sbAirlineId 
                  := rec_air(i).sbAirlineId;   
          
      END LOOP;
      
      FOR i in rec_air.first .. rec_air.last LOOP
      
          rec_aux( rec_air(i).sbAirlineId ).nuTotal 
          := rec_aux( rec_air(i).sbAirlineId ).nuTotal
          + rec_air(i).nuCost;      
          
      END LOOP;
      
      dbms_output.put_line(rec_aux(rec_aux.first).sbAirlineId 
            ||' '|| rec_aux(rec_aux.first).nuTotal);
      
  END get_CombAir;
  

END BC_LIQCOM;