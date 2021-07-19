IMPORT $, STD;

STDPersons := $.LAB6_STD_Persons.File;

EXPORT LAB8PT1_File_Persons_Slim := MODULE
    EXPORT Layout := RECORD
        RECORDOF(STDPersons) AND NOT [City, State, ZipCode];
        UNSIGNED4 CSZ_ID;
    END;

    EXPORT Filename := '~ONLINE::AM::OUT::Persons_Slim';
    EXPORT File := DATASET(Filename, Layout, THOR); 
END;
