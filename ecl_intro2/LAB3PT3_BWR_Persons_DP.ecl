IMPORT STD.DataPatterns;

Persons := $.LAB1_File_Persons.File;

size_persons := COUNT(Persons);
half_size := (INTEGER) size_persons / 2;

dt := DISTRIBUTE(Persons, RANDOM());
Half_Persons := dt[..half_size];

profileResults := DataPatterns.Profile(Half_Persons);
bestRecord := DataPatterns.BestRecordStructure(Half_Persons);

OUTPUT(profileResults, ALL, NAMED('profileResults'));
OUTPUT(bestRecord, ALL, NAMED('bestRecord'));

// DataPatterns.Profile (inFile, fieldListStr, maxPatterns, maxPatternLen, features, sampleSize, lcbLimit)