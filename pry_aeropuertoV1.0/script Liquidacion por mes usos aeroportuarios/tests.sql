DECLARE
    aerolineas BC_LIQAIR.airlines;
    resultado BC_LIQAIR.results_airline;
    sbMonth varchar2(256);
    sbYear  varchar2(256);
BEGIN
    BC_LIQAIR.getTrackCost(
          aerolineas,
         TO_DATE('2006-1-01','YY-MM-DD'),
          resultado
          
    );
  --  dbms_output.put_line( resultado(1).nuTotal);
     FOR i in resultado.first..resultado.last LOOP
    dbms_output.put_line
      (
          resultado(i).sbAirlineDescription
          ||' => '|| resultado(i).nuTotal
          ||' Fecha:'|| resultado(i).daLandingTime
      );
    END LOOP;
END;
/
SELECT count(track_cost.nuCost) costo 
FROM detail,
     airline,
     track_cost 
WHERE detail.SBAIRLINEID=track_cost.sbAirlineId 
                      AND detail.SBAIRPLANEMODE=track_cost.SBPLANEMODEID 
                      AND DETAIL.SBTRACKID=TRACK_COST.SBTRACKID
                      AND airline.sbId=detail.sbAirlineId AND detail.daLandingTime >TO_DATE('2006-1-01','YY-MM-DD') --AND detail.daLandingTime <TO_DATE('2006-1-31','YY-MM-DD')
                      AND airline.sbDescription like 'Myers'
