IMPORT $;

SortedPersons := SORT($.Persons, LastName, FirstName, RecId);

EXPORT DedupPersons := DEDUP(
                            SortedPersons, 
                            LEFT.LastName = RIGHT.LastName AND LEFT.FirstName = Right.FirstName, 
                            LEFT
                        ):PERSIST('~CLASS::AM::TEMP::DedupPersons');

// TotalPersons := COUNT(SortedPersons);
// TotalDeduped := COUNT(DedupPersons);

// OUTPUT(DedupPersons);
// OUTPUT(TotalPersons);
// OUTPUT(TotalDeduped);
