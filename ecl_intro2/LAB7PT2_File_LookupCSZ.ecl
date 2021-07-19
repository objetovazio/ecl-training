IMPORT $, STD;

PersonsUID := $.LAB4_UID_Persons;

EXPORT LAB7PT2_File_LookupCSZ := MODULE
    EXPORT Layout := RECORD
        UNSIGNED4 CSZ_ID;
        STRING20  City;
        STRING2   State;
        UNSIGNED3 ZipCode;
    END;

    SHARED Filename := '~ONLINE::AM::OUT::LOOKUPCSZ';
    EXPORT File := DATASET(Filename, Layout, THOR); 
END;
