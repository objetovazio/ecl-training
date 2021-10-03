EXPORT MAC3_Field_Population(File, Field, CompareVal) := FUNCTIONMACRO
  IMPORT STD ;

  #UNIQUENAME(c1_macro)
  %c1_macro% := COUNT(File(Field = CompareVal));

  #UNIQUENAME(c2_macro)
  %c2_macro% := COUNT(File);

  #UNIQUENAME(d_macro)
  d_macro := DATASET([{'Total Records',%c2_macro%},
                {'Recs ' + #TEXT(Field) + ' = ' + CompareVal, %c1_macro%},
                {'Population Pct',(INTEGER)(((%c2_macro% - %c1_macro%) / %c2_macro%)*100.0)}],
                {STRING valuetype,INTEGER val});
  
  RETURN OUTPUT(d_macro, NAMED('Population_' + #TEXT(Field)), EXTEND);
ENDMACRO;