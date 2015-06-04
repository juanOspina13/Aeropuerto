/*
  Insercion para costos de combustible 
  hay que corregirla porque no esta guardando el valor unitario del costo 
  de combustible, se le va a registrar a cada vuelo un 
  tanqueo, para performance se le agrego a la tabla un campo relacionando el 
  tamaño del avion, cuyo script para actualizar esta en esta misma carpeta
*/
DECLARE 
    nuLandingBayCount       number;
    nuFuelTypeCount         number;
    nuFlightCount           number;
    nuAirlineCount          number;
    daLandingTime           date;
    nuRandomLandingValue    number;
    nuRandomFuelTypeValue   number;
    nuRandomUserId          number;
    
    
    TYPE vuelos_aerolineas IS RECORD(
                  sbAirlineId   airline.sbId%type,
                  sbFlightId    flight.sbId%type
    );
    
    TYPE record_vuelos IS TABLE OF vuelos_aerolineas INDEX BY BINARY_INTEGER;
    rec_vuelo record_vuelos;
    
    CURSOR cu_flightInfo 
    IS
      SELECT sbAirlineId,sbId
      FROM flight;
    
    CURSOR cu_airlineCount 
    IS
      SELECT count(sbId) 
      FROM airline;
    
    CURSOR cu_flightCount 
    IS
      SELECT count(sbId) 
      FROM flight;
    
    CURSOR cu_fueltype 
    IS
      SELECT count(sbId) 
      FROM fuel_type;
          
    CURSOR cu_landingBayCount
    IS
      SELECT count(sbId) 
      FROM airplane_size;
          
    BEGIN
    
    OPEN cu_flightInfo;
    FETCH cu_flightInfo BULK COLLECT INTO rec_vuelo; 
    CLOSE cu_flightInfo;
    
    OPEN cu_fueltype;
    FETCH cu_fueltype into nuFuelTypeCount;
    CLOSE cu_fueltype;
    
    OPEN cu_airlineCount;
    FETCH cu_airlineCount into nuAirlineCount;
    CLOSE cu_airlineCount;
    
    OPEN cu_flightCount;
    FETCH cu_flightCount into nuFlightCount;
    CLOSE cu_flightCount;
    
    OPEN cu_landingBayCount;
    FETCH cu_landingBayCount into nuLandingBayCount;
    CLOSE cu_landingBayCount;
    
    
    for i in rec_vuelo.first .. rec_vuelo.last LOOP
    daLandingTime := TO_DATE(
              TRUNC(
                   DBMS_RANDOM.VALUE(TO_CHAR(DATE '2000-01-01','J')
                                    ,TO_CHAR(DATE '2015-12-31','J')
                                    )
                    ),'J'
               ) ;
      
        nuRandomLandingValue := ROUND(dbms_random.value*nuLandingBayCount,0);
        nuRandomFuelTypeValue := ROUND(dbms_random.value*nuFuelTypeCount,0);
        
        IF nuRandomLandingValue <= 0 THEN
            nuRandomLandingValue := 1;
         END IF;
         
         IF nuRandomFuelTypeValue <=0 THEN
            nuRandomFuelTypeValue := 1;
         END IF;
          
         nuRandomUserId := ROUND(dbms_random.value*2,0);
         
         IF nuRandomUserId <=0 THEN
            nuRandomUserId := 1;
         END IF;
          
        EXECUTE IMMEDIATE 'INSERT INTO user_fuels_plane(
                                   sbId,
                                    nuQUantity,
                                    DAFuelingTime,
                                    sbUserId,
                                    sbLandingBayId,
                                    sbFuelTypeId,
                                    sbFlightId,
                                    sbAirlineId,
                                    nuFuelCost
                            ) VALUES (
                                    :id_tanqueo,
                                    :cantidad,
                                    :aterrizaje,
                                    :id_usuario,
                                    :bahia_aterrizaje,
                                    :tipo_combustible,
                                    :id_vuelo,
                                    :id_aerolinea
                            )' USING  i,
                                      ROUND(dbms_random.value*20,0),
                                      daLandingTime,
                                      nuRandomUserId,
                                      nuRandomLandingValue,
                                      nuRandomFuelTypeValue,
                                      rec_vuelo(i).sbFlightId,
                                      rec_vuelo(i).sbAirlineId;
     
    END LOOP;
 
    END;
