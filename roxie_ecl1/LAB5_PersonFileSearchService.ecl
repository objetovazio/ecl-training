IMPORT $;

Fetch_Persons_LFname := $.LAB3_Fetch_Persons_LFname;
Fetch_Persons_StateLFname := $.LAB4_Fetch_Persons_StateLFname;

EXPORT LAB5_PersonFileSearchService() := FUNCTION
    STRING15 fname_value := '' : STORED('FirstName');
    STRING25 lname_value := '' : STORED('LastName');
    STRING2  state_value := '' : STORED('State');
    STRING1  sex_value   := '' : STORED('Sex');
    SET OF STRING2 State := [] : STORED('State2');

    // fetched := IF(
    //                 state_value = '', 
    //                 Fetch_Persons_LFname(lname_value, fname_value),
    //                 Fetch_Persons_StateLFname(state_value, lname_value, fname_value)
    //             );

    // FilterBy := sex_value = '' OR fetched.Gender = sex_value;

    OutRec := RECORD
        fname_value;
        lname_value;
        state_value;
        sex_value;
        State;
    END;

    OutDS := DATASET([{fname_value, lname_value, state_value, sex_value, State}], OutRec);

    return OUTPUT(OutDS);
END;