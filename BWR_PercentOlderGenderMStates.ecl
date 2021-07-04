IMPORT $;

isOlderPerson := $.Persons.BirthDate <> '' AND $.Persons.BirthDate[1..4] < '1980';

// All Men born before 80s and living in M's states
c1 := COUNT($.MeninMStatesPersons(isOlderPerson)); // Older men living in M's states
c2 := COUNT($.Persons(Gender = 'M', isOlderPerson)); // All older men in US
PercOlderMaleInMStates := (DECIMAL5_2) (c1/c2 * 100); // Ratio % of older men in M's states


// All Woman born before 80s and living in M's states
OlderFemaleInMStates := COUNT($.Persons(State IN $.SetMStates, Gender = 'F', isOlderPerson));
AllOlderFemale       := COUNT($.Persons(Gender = 'F', isOlderPerson));
PercOlderFemaleInMStates := (DECIMAL5_2) (OlderFemaleInMStates / AllOlderFemale * 100);

OUTPUT(PercOlderMaleInMStates, NAMED('Male_Percentage'));
OUTPUT(PercOlderFemaleInMStates, NAMED('Female_Percentage'));
