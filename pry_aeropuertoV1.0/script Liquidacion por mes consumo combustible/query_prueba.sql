SELECT  user_fuels_plane.sbAirlineid,
         SUM(user_fuels_plane.nuQUantity * fuel_cost.NUCOST )
         as costo_tanqueo  
FROM  user_fuels_plane,
      fuel_cost  
WHERE fuel_cost.sbAirplaneSize = user_fuels_plane.SBAIRPLANESIZE 
      AND fuel_cost.SBAIRLINEID = user_fuels_plane.SBAIRLINEID
      AND fuel_cost.SBFUELTYPEID = user_fuels_plane.SBFUELTYPEID
      AND user_fuels_plane.sbAirlineid=99
GROUP BY user_fuels_plane.sbAirlineid