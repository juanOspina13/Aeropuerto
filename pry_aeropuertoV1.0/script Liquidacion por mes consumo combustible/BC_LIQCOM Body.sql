create or replace PACKAGE BODY BC_LIQCOM
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
    sbSqlGroupBy    varchar2(512);
    sbCurrentKey    varchar2(512);
    
    TYPE rec_airCosts IS RECORD
    (
          sbAirlineId   airline.sbId%type,
          nuMonth       number,
          nuYear        number,
          nuTotal       fuel_cost.nuCost%type
    );
    
    
    TYPE rec_airCost IS TABLE OF rec_airCosts INDEX BY BINARY_INTEGER;
    
    rec_air   rec_airCost;
    
  BEGIN
      dbms_output.put_line('hola');
      sbSqlFields := '  user_fuels_plane.sbAirlineId,
                        EXTRACT(Month FROM user_fuels_plane.daFuelingTime),
                        EXTRACT(Year FROM user_fuels_plane.daFuelingTime),          
                        SUM(user_fuels_plane.nuQuantity*fuel_cost.nuCost) ';
                              
      sbSqlFrom := ' user_fuels_plane,
                          fuel_cost ';

      sbSqlWhere := ' user_fuels_plane.sbFueltypeid=fuel_cost.sbfuelTypeId
                      AND user_fuels_plane.sbAirlineId=fuel_cost.sbAirlineId
                      AND user_fuels_plane.sbAirplaneSize=fuel_cost.sbAirplaneSize ';                          
      
      sbSqlGroupBy:=' user_fuels_plane.sbAirlineId,
       EXTRACT(Month FROM user_fuels_plane.daFuelingTime),
       EXTRACT(Year FROM user_fuels_plane.daFuelingTime) ';
      sbSqlString:='SELECT ' 
                    || sbSqlFields 
                    || ' FROM '
                    || sbSqlFrom
                    ||' WHERE '
                    ||sbSqlWhere
                    ||' GROUP BY '
                    ||sbSqlGroupBy;
      
     -- EXECUTE IMMEDIATE sbSqlString BULK COLLECT INTO rec_air;      
      dbms_output.put_line(sbSqlString);
      
      dbms_output.put_line(rec_air(1).nuTotal);
      
/*      FOR i in rec_air.first .. rec_air.last LOOP
     
            dbms_output.put_line(rec_air(i).nuTotal);
            dbms_output.put_line('hola');
     
      END LOOP;
*/
  END get_CombAir;  

END BC_LIQCOM;