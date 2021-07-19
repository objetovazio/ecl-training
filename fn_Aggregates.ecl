IMPORT $;

// EXPORT 

fn_Aggregates(DATASET(RECORDOF($.Persons)) DS, INTEGER FieldName) := FUNCTION

    totalPersonsWithoutDependents := COUNT(DS(FieldName = 0));
    sumDependents := SUM(DS, FieldName);
    aveDependents := AVE(DS, FieldName);
    maxDependents := MAX(DS, FieldName);
    mimDependents := MIN(DS, FieldName);

    d  := DATASET
                (
                    [
                        {'No Dependents', totalPersonsWithoutDependents}, 
                        {'Total Dependents', sumDependents},
                        {'Average Dependents', aveDependents},
                        {'Max Dependents', maxDependents},
                        {'Min Dependents', mimDependents}
                    ], 
                    {STRING valuetype, INTEGER val}
                );

    RETURN d;
END;

fn_Aggregates($.Persons, $.Persons.DependentCount);
