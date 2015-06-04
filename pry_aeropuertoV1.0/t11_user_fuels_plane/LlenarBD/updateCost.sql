DECLARE
  
  TYPE rec_fueCosts IS RECORD
  (
      sbAirplaneSize    fuel_cost.sbAirplaneSize%type,
      sbAirlineId       fuel_cost.sbAirlineId%type,
      sbFuelTypeId      fuel_cost.sbFuelTypeId%type,
      nuCost            fuel_cost.nuCost%type
   );
  
  TYPE rec_cost IS TABLE OF rec_fueCosts INDEX BY BINARY_INTEGER;
  cost_r rec_cost;
  
  CURSOR cu_getInfo 
  IS
    select  sbAirplaneSize,
            sbAirlineId,
            sbFuelTypeId,
            nuCost
    FROM fuel_cost;
    
    BEGIN
    
    OPEN cu_getInfo;
    FETCH cu_getInfo BULK COLLECT INTO cost_r;
    CLOSE cu_getInfo;
    
    FOR i in cost_r.first .. cost_r.last LOOP
    
    EXECUTE IMMEDIATE 'UPDATE user_fuels_plane SET nuFuelCost = :costo 
                        WHERE sbAirplaneSize = :plane_size 
                        AND sbAirlineId = :airId
                        AND sbFuelTypeId = :FuelId' 
                        USING cost_r(i).nuCost,
                              cost_r(i).sbAirplaneSize,
                              cost_r(i).sbAirlineId,
                              cost_r(i).sbFuelTypeId;
    END LOOP;
  END;
 /
 SELECT user_fuels_plane.sbAirlineId,
       EXTRACT(Month FROM user_fuels_plane.daFuelingTime),
       EXTRACT(Year FROM user_fuels_plane.daFuelingTime),          
SUM(user_fuels_plane.nuQuantity*fuel_cost.nuCost)
FROM fuel_cost,user_fuels_plane
WHERE user_fuels_plane.sbFueltypeid=fuel_cost.sbfuelTypeId
      AND user_fuels_plane.sbAirlineId=fuel_cost.sbAirlineId
      AND user_fuels_plane.sbAirplaneSize=fuel_cost.sbAirplaneSize
GROUP BY  user_fuels_plane.sbAirlineId,
       EXTRACT(Month FROM user_fuels_plane.daFuelingTime),
       EXTRACT(Year FROM user_fuels_plane.daFuelingTime)
/
SELECT * FROM user_fuels_plane,fuel_cost WHERE user_fuels_plane.sbFueltypeid=fuel_cost.sbfuelTypeId
      AND user_fuels_plane.sbAirlineId=fuel_cost.sbAirlineId
      AND user_fuels_plane.sbAirplaneSize=fuel_cost.sbAirplaneSize
AND user_fuels_plane.nuYear=2000 AND user_fuels_plane.nuMonth=11 AND user_fuels_plane.sbAirlineId=63
/
  select  sbAirplaneSize,
            sbAirlineId,
            sbFuelTypeId,
            nuCost
    FROM fuel_cost;
    /
  SELECT * FROM fuel_totalization 
  where sbAirlineId=63 AND nuYear=2008 
  AND nuMonth=6
    /
  --  INSERT INTO user_fuels_plane VALUES (1001,1,TO_DATE('30/06/08','DD/MM/YY'),1,1,1,807,63,1,10000);
    /
  /*  DELETE FROM user_fuels_plane WHERE sbId=1001
  SELECT * FROM user_fuels_plane WHERE sbId=1001*/
  /
  SELECT   user_fuels_plane.sbAirlineId,
                        EXTRACT(Month FROM user_fuels_plane.daFuelingTime),
                        EXTRACT(Year FROM user_fuels_plane.daFuelingTime),          
                        SUM(user_fuels_plane.nuQuantity*fuel_cost.nuCost)  FROM  user_fuels_plane,
                          fuel_cost  WHERE  user_fuels_plane.sbFueltypeid=fuel_cost.sbfuelTypeId
                      AND user_fuels_plane.sbAirlineId=fuel_cost.sbAirlineId
                      AND user_fuels_plane.sbAirplaneSize=fuel_cost.sbAirplaneSize 
                      AND  user_fuels_plane.sbAirlineId=63 
                      HAVING EXTRACT(Year FROM user_fuels_plane.daFuelingTime)=2008
                      AND EXTRACT(Month FROM user_fuels_plane.daFuelingTime)=06
                      GROUP BY  user_fuels_plane.sbAirlineId,
       EXTRACT(Month FROM user_fuels_plane.daFuelingTime),
       EXTRACT(Year FROM user_fuels_plane.daFuelingTime) 
  /
  SELECT * 
  FROM fuel_totalization 
  WHERE sbAirlineId like '63' 
  AND nuMonth=6
  AND nuYear=2008
  /
  SELECT * FROM user_fuels_plane where sbId=1003
  /
  COMMIT;
/
SELECT * FROM fuel_totalization  WHERE sbAirlineId=63 AND nuYear=2008 and nuMonth=06
/

SELECT   user_fuels_plane.sbAirlineId,
                        EXTRACT(Month FROM user_fuels_plane.daFuelingTime),
                        EXTRACT(Year FROM user_fuels_plane.daFuelingTime),          
                        SUM(user_fuels_plane.nuQuantity*user_fuels_plane.nuFuelCost)  FROM  user_fuels_plane,
                          fuel_cost  WHERE  user_fuels_plane.sbFueltypeid=fuel_cost.sbfuelTypeId
                      AND user_fuels_plane.sbAirlineId=fuel_cost.sbAirlineId
                      AND user_fuels_plane.sbAirplaneSize=fuel_cost.sbAirplaneSize 
                      AND user_fuels_plane.sbAirlineId=63 
                      HAVING EXTRACT(Month FROM user_fuels_plane.daFuelingTime)=06
                      AND EXTRACT(year FROM user_fuels_plane.daFuelingTime)=2008
                      GROUP BY  user_fuels_plane.sbAirlineId,
       EXTRACT(Month FROM user_fuels_plane.daFuelingTime),
       EXTRACT(Year FROM user_fuels_plane.daFuelingTime) 
       /
       select * from user_fuels_plane WHERE sbAirlineId=63 
       AND  EXTRACT(Month FROM user_fuels_plane.daFuelingTime)=06
       AND EXTRACT(Year FROM user_fuels_plane.daFuelingTime) =2008
       
      