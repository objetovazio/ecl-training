EXPORT FM3_Field_Population(File, Field, CompareVal) := FUNCTIONMACRO
  IMPORT STD ;
  c1 := COUNT(File(Field = CompareVal));

  c2 := COUNT(File);

  d := DATASET([{'Total Records',c2},
                {'Recs ' + #TEXT(Field) + ' = ' + CompareVal, c1},
                {'Population Pct',(INTEGER)(((c2-c1)/c2)*100.0)}],
                {STRING valuetype,INTEGER val});
  
  RETURN OUTPUT(d, NAMED('Population_' + #TEXT(Field)), EXTEND);
ENDMACRO;