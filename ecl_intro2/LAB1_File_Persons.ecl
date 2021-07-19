EXPORT LAB1_File_Persons := MODULE
    EXPORT Filename := '~online::am::training::persons';

    EXPORT Layout := RECORD
        INTEGER4  RecId;
        STRING15  FirstName;
        STRING25  LastName;
        STRING15  MiddleName;
        STRING2   NameSuffix;
        STRING8   FileDate;
        UNSIGNED2 BureauCode;
        STRING1   MaritalStatus;
        STRING1   Gender;
        UNSIGNED1 DependentCount;
        STRING8   BirthDate;
        STRING42  StreetAddress;
        STRING20  City;
        STRING2   State;
        STRING5   ZipCode;
    END;

    EXPORT File := DATASET(Filename, Layout, THOR);
END;
