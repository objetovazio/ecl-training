EXPORT FM2_FieldValueCount(File, Field, MaxRecs = 'ALL') := FUNCTIONMACRO
  IMPORT STD ;
  
  r := RECORD
    File.Field;
    INTEGER cnt := COUNT(GROUP);
  END;

  RETURN OUTPUT(CHOOSEN(SORT(TABLE(file, r, field), -cnt), MaxRecs),
          NAMED('ValueCount' + #TEXT(field)));
ENDMACRO;