IMPORT $;

File := $.LAB6_STD_Persons.File;

Layout_T_Recs := RECORD
    UNSIGNED4 CSZ_ID := File.RecId;
    File.City;
    File.State;
    File.ZipCode;
END;

// Created and Sorted all records by ZipCode, State, City
T_recs := TABLE(File, Layout_T_Recs);
S_recs := SORT(T_recs, ZipCode, State, City);


Layout_T_Recs RollCSV(Layout_T_Recs L, Layout_T_Recs R) := TRANSFORM
    SELF.CSZ_ID := IF(L.CSZ_ID < R.CSZ_ID, L.CSZ_ID, R.CSZ_ID);
    SELF := L;
END;

// Transformed table, removing all ZipCode, State, City that matched
Rollup_CSZ := ROLLUP(
    S_Recs, 
    LEFT.Zipcode = RIGHT.ZipCode AND LEFT.State = Right.State AND LEFT.City = RIGHT.City,
    RollCSV(LEFT, RIGHT)
);

OUTPUT(Rollup_CSZ,, '~ONLINE::AM::OUT::LOOKUPCSZ', OVERWRITE);