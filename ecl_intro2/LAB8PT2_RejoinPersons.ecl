IMPORT $, STD;

Slim_Persons := $.LAB8PT1_File_Persons_Slim.File;
LookupCSZ := $.LAB7PT2_File_LookupCSZ.File;

$.LAB1_File_Persons.Layout RejoinPersons(Slim_Persons L, LookupCSZ R) := TRANSFORM
    SELF.ZipCode        := IF(R.ZipCode = 0, '', INTFORMAT(R.ZipCode, 5, 1));
    SELF.FileDate       := IF(L.FileDate = 0, '', (STRING8) L.FileDate);
    SELF.BirthDate      := IF(L.BirthDate = 0, '', (STRING8) L.BirthDate);
    SELF.FirstName      := STD.Str.ToTitleCase(L.FirstName);
    SELF.LastName       := STD.Str.ToTitleCase(L.LastName);
    SELF.MiddleName     := STD.Str.ToTitleCase(L.MiddleName);
    SELF.NameSuffix     := STD.Str.ToTitleCase(L.NameSuffix);
    SELF.MaritalStatus  := '';
    SELF := R;
    SELF := L;
END;

Rejoined := JOIN(
    Slim_Persons, 
    LookupCSZ, 
    LEFT.CSZ_ID = RIGHT.CSZ_ID,
    RejoinPersons(LEFT, RIGHT), LEFT OUTER, LOOKUP
);

OUTPUT(Rejoined,, '~ONLINE::AM::OUT::Persons_Rejoined', OVERWRITE);