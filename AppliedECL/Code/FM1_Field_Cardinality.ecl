EXPORT FM1_Field_Cardinality(file,field) := FUNCTIONMACRO
  IMPORT STD ;
  
  t    := TABLE(file,{field});
  dt   := DISTRIBUTE(t,HASH32(field));
  sdt  := SORT(dt,field,LOCAL);
  dsdt := DEDUP(sdt,field,LOCAL);

  RETURN OUTPUT(COUNT(dsdt), NAMED('Cardinality_' + #TEXT(field)));
ENDMACRO;