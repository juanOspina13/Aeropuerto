create or replace PACKAGE BC_UTILS
  IS
  TYPE rcStrDefi IS RECORD 
  (
      sbFielNam varchar2(1024)
  ) ;
  
  TYPE rcStrType IS TABLE OF rcStrDefi INDEX BY BINARY_INTEGER;
  TYPE rcStrTyRe IS TABLE OF rcStrDefi INDEX BY varchar2(1024);
  
   
  /*****************************************************************
  Propiedad intelectual de Open International Systems (c).
  
  Unidad         : <Nombre de la UNIDAD>
  Descripción    : Funcion que devuelve los campos que cumplan con las 
                  condiciones determinadas
  Autor          : Juan ospina (jospina)
  Fecha          : 
  
  Métodos 
  
  Nombre         : PRGetFields
  Parámetros         Descripción
  ============	===================
    rcNombTab     Nombre de las tablas que se van a usar 
    rcWhereFi     Nombre de los campos del where
    rcWhereVa     Valores de los campos del where
    rcIndexVa     Valores asociados a indices     
    rcGroupBy     Campos para el group by
    rcOrderBy     Campos para order by
    
  Historia de Modificaciones
  Fecha             Autor             Modificación
  =========         =========         ====================
  
  ******************************************************************/

  PROCEDURE PRGETFIELDS (
    rcSelFiel in  rcStrType ,
    rcNombTab in  rcStrType ,
    rcWhereFi in  rcStrType ,
    rcWhereVa in  rcStrType ,
    sbWhereTy in  varchar2,
    rcIndexFi in  rcStrType ,
    rcGroupBy in  rcStrType ,
    rcOrderBy in  rcStrType ,
    rcResValu out rcStrTyRe 
  );
  
  PROCEDURE PRSETFIELDS (
    rcSelFiel in  rcStrType ,
    rcSelValu in  rcStrType ,
    rcNombTab in  rcStrType ,
    rcWhereFi in  rcStrType ,
    rcWhereVa in  rcStrType ,
    sbWhereTy in  varchar2
  );
  
  FUNCTION FNSETSTRI(
    sbConnect   varchar2
      ,
    boNeedEqu   boolean   ,
    rcIniFiel   rcStrType ,
    rcFinFiel   rcStrType 
    
  )
   RETURN varchar2;
   
  
END BC_UTILS;

//
create or replace PACKAGE BODY BC_UTILS
  
  IS
   
  /*****************************************************************
  Propiedad intelectual de Open International Systems (c).
  
  Unidad         : <Nombre de la UNIDAD>
  Descripción    : Funcion que devuelve los campos que cumplan con las 
                  condiciones determinadas
  Autor          : Juan ospina (jospina)
  Fecha          : 
  
  Métodos 
  
  Nombre         : PRGetFields
  Parámetros         Descripción
  ============	===================
    rcNombTab     Nombre de las tablas que se van a usar 
    rcWhereFi     Nombre de los campos del where
    rcWhereVa     Valores de los campos del where
    rcIndexVa     Valores asociados a indices     
    rcGroupBy     Campos para el group by
    rcOrderBy     Campos para order by
    
  Historia de Modificaciones
  Fecha             Autor             Modificación
  =========         =========         ====================
  
  ******************************************************************/

  PROCEDURE PRGETFIELDS (
    rcSelFiel in  rcStrType ,
    rcNombTab in  rcStrType ,
    rcWhereFi in  rcStrType ,
    rcWhereVa in  rcStrType ,
    sbWhereTy in  varchar2,
    rcIndexFi in  rcStrType ,
    rcGroupBy in  rcStrType ,
    rcOrderBy in  rcStrType ,
    rcResValu out rcStrTyRe 
    
  )
  IS
  sbFieQuer varchar2 (2056);
  sbSelResp varchar2 (2056);
  nuTmpAcum number ;
  
  BEGIN
 
     /* 
     sbSelResp := BC_UTILS.FNSETSTR(
          'SELECT' 
          ,
          0 ,
          rcSelFiel,
          rcSelFiel
          
      );*/
      sbSelResp := '';
      sbFieQuer := ' SELECT ';
      
      FOR i in rcSelFiel.first .. rcSelFiel.last  LOOP
        sbFieQuer := sbFieQuer || rcSelFiel(i).sbFielNam;
      END LOOP ;
      
      nuTmpAcum := 0;
      sbFieQuer := sbFieQuer || ' FROM ';
      
      IF rcNombTab IS NULL THEN
        dbms_output.put_line('es null');
      ELSE 

         FOR i in rcNombTab.first .. rcNombTab.last  LOOP
        
            IF nuTmpAcum = 0 THEN 
              sbFieQuer := sbFieQuer ||
                rcIndexFi(i).sbFielNam ||
                rcNombTab(i).sbFielNam ;
            ELSE 
              sbFieQuer := sbFieQuer || ',' ||
                rcIndexFi(i).sbFielNam || 
                rcNombTab(i).sbFielNam;
            END IF;
          
            nuTmpAcum := nuTmpAcum + 1 ;
            
          END LOOP;
      
      END IF;
      
      
      
      nuTmpAcum := 0;
      sbFieQuer := sbFieQuer || ' WHERE ';
      
      FOR i in rcWhereFi.first .. rcWhereFi.last  LOOP
        
        IF nuTmpAcum = 0 THEN 
          sbFieQuer := sbFieQuer ||
            rcWhereFi(i).sbFielNam || ' = ' ||
            rcWhereFi(i).sbFielNam ;
        ELSE 
          sbFieQuer := sbFieQuer ||' ' ||
            sbWhereTy || ' ' || 
            rcWhereFi(i).sbFielNam || ' = ' ||
            rcWhereFi(i).sbFielNam ;
        END IF;
        
        nuTmpAcum := nuTmpAcum + 1 ;
      END LOOP;
      
      nuTmpAcum := 0;
      sbFieQuer := sbFieQuer || ' GROUP BY  ';
      
      IF rcGroupBy IS NOT NULL THEN
        FOR i in rcGroupBy.first .. rcGroupBy.last  LOOP
          
          IF nuTmpAcum = 0 THEN 
            sbFieQuer := sbFieQuer ||
              rcGroupBy(i).sbFielNam ;
          ELSE 
            sbFieQuer := sbFieQuer ||' , ' ||
              rcGroupBy(i).sbFielNam ;
          END IF;
          
          nuTmpAcum := nuTmpAcum + 1 ;
        END LOOP;
      END IF ;
      
      dbms_output.put_line(sbFieQuer);
      
  END PRGETFIELDS;
 
  
  /*****************************************************************
  Propiedad intelectual de Open International Systems (c).
  
  Unidad         : <Nombre de la UNIDAD>
  Descripción    : Funcion que devuelve los campos que cumplan con las 
                  condiciones determinadas
  Autor          : Juan ospina (jospina)
  Fecha          : 
  
  Métodos 
  
  Nombre         : PRGetFields
  Parámetros         Descripción
  ============	===================
    rcNombTab     Nombre de las tablas que se van a usar 
    rcWhereFi     Nombre de los campos del where
    rcWhereVa     Valores de los campos del where
    rcIndexVa     Valores asociados a indices     
    rcGroupBy     Campos para el group by
    rcOrderBy     Campos para order by
    
  Historia de Modificaciones
  Fecha             Autor             Modificación
  =========         =========         ====================
  
  ******************************************************************/
  
  PROCEDURE PRSETFIELDS (
    rcSelFiel in  rcStrType ,
    rcSelValu in  rcStrType ,
    rcNombTab in  rcStrType ,
    rcWhereFi in  rcStrType ,
    rcWhereVa in  rcStrType ,
    sbWhereTy in  varchar2
  )
  IS
  sbFieQuer varchar2 (2056);
  sbSelResp varchar2 (2056);
  nuTmpAcum number ;
  
  BEGIN
      sbSelResp := '';
      sbFieQuer := ' UPDATE ';
      
      IF rcNombTab IS NULL THEN
        dbms_output.put_line('es null');
      ELSE 

         FOR i in rcNombTab.first .. rcNombTab.last  LOOP
        
            IF nuTmpAcum = 0 THEN 
                sbFieQuer := sbFieQuer ||
                rcNombTab(i).sbFielNam ;
            ELSE 
                sbFieQuer := sbFieQuer || ',' ||
                rcNombTab(i).sbFielNam;
            END IF;
          
            nuTmpAcum := nuTmpAcum + 1 ;
            
          END LOOP;
      
      END IF;
      
      
      nuTmpAcum := 0;
      sbFieQuer := sbFieQuer || ' SET ' ;
      
      FOR i in rcSelFiel.first .. rcSelFiel.last  LOOP
        
        IF nuTmpAcum = 0 THEN 
          sbFieQuer := sbFieQuer ||
            rcSelFiel(i).sbFielNam || ' = ' ||
            rcSelValu(i).sbFielNam ;
        ELSE 
          sbFieQuer := sbFieQuer ||' ' ||
            sbWhereTy || ' ' || 
            rcSelFiel(i).sbFielNam || ' = ' ||
            rcSelValu(i).sbFielNam ;
        END IF;
        
        nuTmpAcum := nuTmpAcum + 1 ;
      END LOOP;
      
      
      nuTmpAcum := 0;
      sbFieQuer := sbFieQuer || ' WHERE ';
      
      FOR i in rcWhereFi.first .. rcWhereFi.last  LOOP
        
        IF nuTmpAcum = 0 THEN 
          sbFieQuer := sbFieQuer ||
            rcWhereFi(i).sbFielNam || ' = ' ||
            rcWhereFi(i).sbFielNam ;
        ELSE 
          sbFieQuer := sbFieQuer ||' ' ||
            sbWhereTy || ' ' || 
            rcWhereFi(i).sbFielNam || ' = ' ||
            rcWhereFi(i).sbFielNam ;
        END IF;
        
        nuTmpAcum := nuTmpAcum + 1 ;
      END LOOP;
      
      nuTmpAcum := 0;
      sbFieQuer := sbFieQuer || ' GROUP BY  ';
      
      
      dbms_output.put_line(sbFieQuer);
      
  END PRSETFIELDS;
 
 FUNCTION FNSETSTRI(
    sbConnect   varchar2 ,
    boNeedEqu   boolean   ,
    rcIniFiel   rcStrType ,
    rcFinFiel   rcStrType 
   
  )
   RETURN varchar2
   IS
   BEGIN
      dbms_output.put_line('hola');
      RETURN 'hola';
   END FNSETSTRI;
   
END BC_UTILS;