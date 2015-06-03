DECLARE

    TYPE info_airplane IS RECORD(
        sbAirlineID     airline.sbId%type,
        sbAirplaneId    airplane.sbId%type
    );
    
    TYPE record_vuelos IS TABLE OF info_airplane INDEX BY BINARY_INTEGER;
    rec_vuelo record_vuelos;
    
    CURSOR cu_infoAirplanes 
    IS
    SELECT sbAirlineId,sbId
    FROM airplane;
    
    
BEGIN

    OPEN cu_infoAirplanes;
    FETCH cu_infoAirplanes BULK COLLECT INTO rec_vuelo; 
    CLOSE cu_infoAirplanes;
  
  FOR i in rec_vuelo.first..rec_vuelo.last LOOP
  
    dbms_output.put_line(rec_vuelo(i).sbAirlineId);
    EXECUTE IMMEDIATE 'UPDATE flight SET sbAirlineID=:airlineId 
                                  WHERE sbAirplaneId=:airplaneId' 
      USING rec_vuelo(i).sbAirlineId,
            rec_vuelo(i).sbAirplaneId;    
            
  END LOOP;
  
END;
