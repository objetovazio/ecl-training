EXPORT MAC2_FieldValueCount(File, Field, MaxRecs = 'ALL') := FUNCTIONMACRO
  IMPORT STD ;
  
  #UNIQUENAME(r_macro)
  %r_macro% := RECORD
    File.Field;
    INTEGER cnt := COUNT(GROUP);
  END;

  RETURN OUTPUT(CHOOSEN(SORT(TABLE(file, %r_macro%, field), -cnt), MaxRecs),
          NAMED('ValueCount' + #TEXT(field)));
ENDMACRO;