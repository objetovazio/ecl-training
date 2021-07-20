IMPORT $;

Fetch_Persons_LFname := $.LAB3_Fetch_Persons_LFname;
Fetch_Persons_StateLFname := $.LAB4_Fetch_Persons_StateLFname;

EXPORT LAB5_PersonFileSearchService() := FUNCTION
    STRING15 fname_value := '' : STORED('FirstName');
    STRING25 lname_value := '' : STORED('LastName');
    STRING2  state_value := '' : STORED('State');
    STRING1  sex_value   := '' : STORED('Sex');

    fetched := IF(
                    state_value = '', 
                    Fetch_Persons_LFname(lname_value, fname_value),
                    Fetch_Persons_StateLFname(state_value, lname_value, fname_value)
                );

    FilterBy := sex_value = '' OR fetched.Gender = sex_value;
    return OUTPUT(fetched(FilterBy));
END;