/*
  Paquete que liquida el uso de pistas por aerolinea
*/
CREATE OR REPLACE PACKAGE BC_LIQAIR
IS  
  TYPE  result_airline is RECORD 
      (
          sbAirlineId             varchar2(256),       --debería ser con %type
          daLandingTime           date,
          sbAirlineDescription    varchar2(256),
          nuTotal                 number
      );
      
    TYPE results_airline IS TABLE OF result_airline INDEX BY BINARY_INTEGER;
    TYPE  airlines IS TABLE OF airline%rowtype INDEX BY binary_integer;
    
    PROCEDURE getTrackCost (
        aerolineas          in airlines,
        daLiquidationDate   in date,
        airline_total       out results_airline
         );
         
END BC_LIQAIR;
/
    
CREATE OR REPLACE PACKAGE BODY BC_LIQAIR
IS
   PROCEDURE getTrackCost
    ( 
        aerolineas          in airlines,
        daLiquidationDate   in date,
        airline_total       out results_airline
    )
    IS  
        fallo_registro    varchar2(200);
        query_insert      varchar2(200);
        sbQuery           varchar2(2056);
        select_fields     varchar2(256);
        tables_selected   varchar2(256);
        where_clause      varchar2(512);
        groupby_fields    varchar2(256);
        sbMonth           varchar2(256);
        sbYear            varchar2(256);
        
    BEGIN
        sbMonth :=EXTRACT
                    (
                        Month FROM daLiquidationDate
                    );
   
        sbYear := EXTRACT 
                  (
                      year FROM daLiquidationDate
                  );
        
        select_fields :=  'airline.sbID,
                          detail.daLandingTime,
                          airline.sbDescription,
                          SUM(track_cost.nuCost) costo';
                
        tables_selected :=  'detail,
                            airline,
                            track_cost';
        
        /* 
            en el where falta acotar la fecha de inicio y de fin (primer y 
            ultimo dia del mes y las aerolineas que se quieren liquidar
        */
        where_clause :=   ' detail.SBAIRLINEID = track_cost.sbAirlineId 
                            AND detail.SBAIRPLANEMODE = track_cost.SBPLANEMODEID 
                            AND DETAIL.SBTRACKID = TRACK_COST.SBTRACKID
                            AND airline.sbId = detail.sbAirlineId ';   
         
         where_clause := where_clause
                        ||' AND detail.daLandingTime > '
                        ||'TO_DATE('''
                        ||sbYear
                        ||'-'
                        ||sbMonth
                        ||'-01'''
                        ||','''
                        ||'YY-MM-DD'''
                        ||')';
                        
        groupby_fields :=   'airline.sbID,
                            detail.daLandingTime,
                            airline.sbDescription';             
        
        sbQuery :=  ' SELECT '
                    ||select_fields
                    ||' FROM '
                    ||tables_selected
                    ||' WHERE '
                    ||where_clause
                    ||' GROUP BY '
                    ||groupby_fields;
        
        EXECUTE IMMEDIATE sbQuery  BULK COLLECT INTO airline_total;

     END getTrackCost;
END BC_LIQAIR;
/