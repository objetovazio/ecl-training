IMPORT $;
// X.FM1_Field_Cardinality(X.Persons, BureauCode);
// X.FM2_FieldValueCount(X.Persons, Gender);
// X.FM3_Field_Population(X.Persons, DependentCount, 0);

// $.MAC_Field_Cardinality($.Persons, BureauCode);
// $.MAC_Field_Cardinality($.Persons, Gender);
// $.MAC_Field_Cardinality($.Persons, City);

// $.MAC2_FieldValueCount($.Persons, Gender);

// $.MAC3_Field_Population($.Persons, DependentCount, 0);


$.MAC_BuildCASE($.File_States.File, State, StateCode, O, RO);

O;
RO;