IMPORT $, STD;

Slim_Persons := $.LAB8PT1_File_Persons_Slim.File;
LookupCSZ := $.LAB7PT2_File_LookupCSZ.File;

$ SlimPersons(STDPersons L, LookupCSZ R) := TRANSFORM
    SELF.CSZ_ID := R.CSZ_ID;
    SELF := L;
END;

SlimRecords := JOIN(
    STDPersons, 
    LookupCSZ, 
    LEFT.Zipcode = RIGHT.ZipCode AND LEFT.State = Right.State AND LEFT.City = RIGHT.City,
    SlimPersons(LEFT, RIGHT)
);

OUTPUT(SlimRecords,, $.LAB8PT1_File_Persons_Slim.Filename, OVERWRITE);