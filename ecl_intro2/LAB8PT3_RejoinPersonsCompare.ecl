IMPORT $, STD;

RJPersons := DATASET('~ONLINE::AM::OUT::Persons_Rejoined', $.LAB1_File_Persons.Layout, THOR);

AppendRecs   := $.LAB1_File_Persons.File + RJPersons;
SortRecs     := SORT(AppendRecs, RECORD);
DedupPersons := DEDUP(SortRecs, RECORD);

// Count Rejoined Persons
OUTPUT(COUNT(RJPersons), NAMED('Input_Recs_Persons'));

// Should be Zero
OUTPUT(COUNT(DedupPersons) - COUNT(RJPersons), NAMED('Dup_Person'));

// OUTPUT(Rejoined,, '~ONLINE::AM::OUT::Persons_Rejoined', OVERWRITE);