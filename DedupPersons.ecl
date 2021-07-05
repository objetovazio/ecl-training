IMPORT $;

SortedPersons := SORT($.Persons, LastName, FirstName, RecId);

DedupedPersons := DEDUP(
                            SortedPersons, 
                            LEFT.LastName = RIGHT.LastName AND LEFT.FirstName = Right.FirstName, 
                            LEFT
                        ):PERSIST('~CLASS::AM::TEMP::DedupPersons');

TotalPersons := COUNT(SortedPersons);
TotalDeduped := COUNT(DedupedPersons);

OUTPUT(DedupedPersons);
OUTPUT(TotalPersons);
OUTPUT(TotalDeduped);