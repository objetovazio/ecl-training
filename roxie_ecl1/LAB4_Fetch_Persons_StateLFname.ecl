IMPORT $;

basefile := $.File_Persons_Slim.FilePlus;
basekey  := $.File_Persons_Slim.IDX_CSZ_lname_fname;
cszfile  := $.File_LookupCSZ.FilePlus;
cszskey  := $.File_LookupCSZ.IDX_st_city;

EXPORT LAB4_Fetch_Persons_StateLFname(STRING2 s_key, STRING25 l_key, STRING15 f_key) := FUNCTION
    
    // Fetch by states
    StateRecords := FETCH(cszfile, cszskey(State = s_key), RIGHT.RecPos);
    SetCSZ_Ids := SET(StateRecords, CSZ_ID);

    validate := cszfile.CSZ_ID IN SetCSZ_Ids;

    // Filter if f_key is empty, since its optional
    filteredKey :=  IF(
                        f_key = '', 
                        basekey(CSZ_ID IN SetCSZ_Ids, LastName = l_key), 
                        basekey(CSZ_ID IN SetCSZ_Ids, LastName = l_key, FirstName = f_key)
                    );

    // Fetch persons based on filteredKey
    Fetch_Persons := FETCH(basefile, FilteredKey, RIGHT.RecPos);

    // Define output Record
    OutputRecord := RECORD
        RECORDOF(basefile) AND NOT [RecPos, CSZ_ID];
        RECORDOF(cszfile) AND NOT [RecPos, CSZ_ID];
    END;

    // Define TRANSFORM
    OutputRecord JoinPersonsCSZ(cszfile Le, basefile Ri) := TRANSFORM
        SELF := Le;
        SELF := Ri;
    END;

    // Return JOINED DATASET
    RETURN JOIN(cszfile, Fetch_Persons, LEFT.csz_id = RIGHT.csz_id, JoinPersonsCSZ(LEFT, RIGHT), ALL);
END;