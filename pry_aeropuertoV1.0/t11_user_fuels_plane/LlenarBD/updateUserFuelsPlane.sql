/*
  Para mejorar el performance del reporte le agrege a la tabla user_fuels_plane
  el tamaño del avión
*/
DECLARE

  TYPE rec_flightAirSize IS RECORD(
      sbPlaneSizeId    airplane_size.sbId%type,
      sbFlightId       flight.sbId%type
  );
  
  TYPE rect_flightAirSize IS TABLE OF rec_flightAirSize INDEX BY BINARY_INTEGER;
  recs_flightAirSize rect_flightAirSize;
  
  CURSOR cu_flightAirSize
  IS
    SELECT airplane.sbplanesizeid ,
            flight.sbid
    FROM FLIGHT,
        airplane
    WHERE flight.sbAirplaneId=airplane.sbId;
    
BEGIN
   
   OPEN cu_flightAirSize;
   FETCH cu_flightAirSize BULK COLLECT INTO recs_flightAirSize;
   CLOSE cu_flightAirSize;
   
   FOR i in recs_flightAirSize.first .. recs_flightAirSize.last LOOP
      
     EXECUTE IMMEDIATE 'UPDATE user_fuels_plane 
                        SET sbAirplaneSize=:airplane_size
     WHERE sbFlightId=:flight_id' 
     USING recs_flightAirSize(i).sbPlaneSizeId,
     recs_flightAirSize(i).sbFlightId;
     
          
   END LOOP;
       
 END;
 