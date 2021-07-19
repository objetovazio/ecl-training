IMPORT $, STD;

PersonsUID := $.LAB4_UID_Persons;

EXPORT LAB6_STD_Persons := MODULE
    EXPORT Layout := RECORD
        PersonsUID.UID;
        PersonsUID.RecId;
        String15 FirstName := STD.Str.ToUpperCase(PersonsUID.FirstName);
        String25 LastName := STD.Str.ToUpperCase(PersonsUID.LastName);
        String1 MiddleName := STD.Str.ToUpperCase(PersonsUID.MiddleName);
        String2 NameSuffix := STD.Str.ToUpperCase(PersonsUID.NameSuffix);
        UNSIGNED4 FileDate := (UNSIGNED4) PersonsUID.FileDate;
        PersonsUID.BureauCode;
        PersonsUID.Gender;
        PersonsUID.DependentCount;
        UNSIGNED4 BirthDate := (UNSIGNED4) PersonsUID.BirthDate;
        PersonsUID.StreetAddress;
        PersonsUID.City;
        PersonsUID.State;
        UNSIGNED3 ZipCode := (UNSIGNED3) PersonsUID.ZipCode;
    END;

    EXPORT File := TABLE(PersonsUID, Layout)
                    :Persist('~class::AM::persist::std_persons');
END;
