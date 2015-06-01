/*
  Insercion para costos de combustible, se va a generar todas las combinaciones posibles
*/
DECLARE 
    nuAirlineCount         number;
    nuFuelTypeCount        number;
    nuAirplaneSizeCount    number;
    nuAcum                 number;
    
    CURSOR cu_airlineCount 
    IS
    SELECT count(sbId) 
          FROM airline;
    
    CURSOR cu_fuelTypeCount 
    IS
    SELECT count(sbId) 
          FROM fuel_type;
    
    CURSOR cu_airplaneSizeCount
    IS
    SELECT count(sbId) 
          FROM airplane_size;
    BEGIN
    nuAcum:=1;
    
    OPEN cu_airlineCount;
    FETCH cu_airlineCount into nuAirlineCount;
    CLOSE cu_airlineCount;
    
    OPEN cu_fuelTypeCount;
    FETCH cu_fuelTypeCount into nuFuelTypeCount;
    CLOSE cu_fuelTypeCount;
    
    OPEN cu_airplaneSizeCount;
    FETCH cu_airplaneSizeCount into nuAirplaneSizeCount;
    CLOSE cu_airplaneSizeCount;
    
    for i in 1..nuFuelTypeCount LOOP
        for j in 1..nuAirlineCount LOOP
              for k in 1..nuAirplaneSizeCount LOOP
                  dbms_output.put_line(nuAcum||'=>'||i||'-'||j||'-'||k||'random:'||ROUND(dbms_random.value,2)*100000);
                  EXECUTE IMMEDIATE 
                  'INSERT INTO fuel_cost(sbId,sbAirplaneSize,sbairlineId,sbFuelTypeid,nucost) VALUES ('
                                                                  ||nuAcum||','
                                                                  ||k||','
                                                                  ||j||','
                                                                  ||i||','
                                                                  ||ROUND(dbms_random.value,2)*10000||')';
                  nuAcum:=nuAcum+1;
              END LOOP;
        END LOOP;
    END LOOP;
    
    END;
  