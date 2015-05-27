/*
Insercion de 1'000.000 Registros en la tabla detalle

*/
DECLARE
numero_aleatorio number;
fecha_aleatoria date;
BEGIN
    for i in 1001..1000000
    LOOP numero_aleatorio:=round(dbms_random.value(1,1000));
     fecha_aleatoria:=TO_DATE (
              TRUNC (
                     DBMS_RANDOM.VALUE (2451545, 5373484) 
                    )
                , 'J'
              );
       -- dbms_output.put_line(fecha_aleatoria);             
    INSERT INTO detail(
                sbId,
                daLandingTime,
                daComunnicationTime,
                sbTrackId,
                sbAirlineId,
                sbAirplaneMode,
                sbAirplaneId,
                sbFlightId
    ) VALUES(
                              i,                                          ---sbId     
                              fecha_aleatoria,                            -- daLandingTime           date,
                              fecha_aleatoria,                            --  daComunnicationTime     date,
                              ROUND(DBMS_RANDOM.VALUE (1, 10)),           -- sbTrackId               varchar2(256),        --FK
                              ROUND(DBMS_RANDOM.VALUE (1, 100)),          ---sbAirlineId             varchar2(256),      --FK
                              ROUND(DBMS_RANDOM.VALUE (1, 2)),            --sbAirplaneMode          varchar2(256),   --FK 
                              ROUND(DBMS_RANDOM.VALUE (1, 1000)),         --sbAirplaneId            varchar2(256),    --FK
                              ROUND(DBMS_RANDOM.VALUE (1, 1000))         --  sbFlightId              varchar2(256)    --FK     
   );

   END LOOP;
END;
/

