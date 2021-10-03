EXPORT MAC_Field_Cardinality(file,field) := MACRO
  IMPORT STD ;
  
  #UNIQUENAME(t_macro)
  %t_macro% := TABLE(file,{field});
  #UNIQUENAME(dt_macro)
  %dt_macro%   := DISTRIBUTE(%t_macro%,HASH32(field));
  #UNIQUENAME(sdt_macro)
  %sdt_macro%  := SORT(%dt_macro%,field,LOCAL);
  #UNIQUENAME(dsdt_macro)
  %dsdt_macro% := DEDUP(%sdt_macro%,field,LOCAL);

  OUTPUT(COUNT(%dsdt_macro%), NAMED('Cardinality_' + #TEXT(field)));
ENDMACRO;