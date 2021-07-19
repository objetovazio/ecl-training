IMPORT $;

Persons := $.LAB1_File_Persons.File;

// Count of records with dependent counts = 0
c1 := COUNT(Persons(DependentCount = 0));

// Count of records
c2 := COUNT(Persons);

// Percentage of records without Dependents
c3 := (INTEGER) (((c2 - c1) / c2) * 100);

d := DATASET(
                [
                    {'Total Records', c2},
                    {'Records = 0', c1},
                    {'Population %', c3}
                ],  
                {STRING15 valuetype, INTEGER val}
            );

OUTPUT(d);
