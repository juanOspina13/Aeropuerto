
CREATE OR REPLACE PACKAGE BC_LIQAIR
IS
    type detalles_vuelo IS table of detail%rowtype index BY binary_integer;
    PROCEDURE CopyAirplanesIntoAudit (
        inuLasValue         number,
        detalle_vuelo out detalles_vuelo
    );
END BC_LIQAIR;
/
    
CREATE OR REPLACE PACKAGE BODY BC_LIQAIR
IS
   PROCEDURE CopyAirplanesIntoAudit
    (
        inuLasValue         number,
        detalle_vuelo out detalles_vuelo
    )
    IS  
        fallo_registro varchar2(200);
        query_insert varchar2(200);
        --ocuDataCursor constants.tyRefCursor;
        sbQuery varchar2(2000);
        
        CURSOR cuInfoDetalle(
                  inuLastValue        number
        )
        IS
        SELECT /*+ index(jo_airplane pk_jo_airplane)*/
                *
        FROM detail
          --  LANDING_TIME BETWEEN ADD_MONTHS(CURRENT_TIMESTAMP,-1) AND CURRENT_TIMESTAMP
        WHERE  detail.sbId>inuLastValue;
        
    BEGIN
        OPEN cuInfoDetalle(inuLasValue);
        FETCH cuInfoDetalle BULK collect INTO detalle_vuelo limit 100;
        CLOSE cuInfoDetalle;

    ------------------------------------------------------------------------
    -----------------Inserto los datos en la tabla--------------------------
    ------------------------------------------------------------------------
    for i in detalle_vuelo.first..detalle_vuelo.last

    loop
        dbms_output.put_line(detalle_vuelo(i).sbFlightId);
       /* if vuelo_aerolinea.exists(i) then
            query_insert:='INSERT INTO jo_last_month_flights values('''||vuelo_aerolinea(i).jo_flight_id
            ||''','''||TO_TIMESTAMP(vuelo_aerolinea(i).landing_time)||''','''
            ||vuelo_aerolinea(i).status||''')';
           EXECUTE IMMEDIATE query_insert;
        else
            dbms_output.put_line('Codigo->'||i||':no existe');
            END if;*/
    end loop;
   /*  EXCEPTION
            when ex.CONTROLLED_ERROR then
                raise ex.CONTROLLED_ERROR;
            when others then fallo_registro:='si';*/

     END CopyAirplanesIntoAudit;
END BC_LIQAIR;
/