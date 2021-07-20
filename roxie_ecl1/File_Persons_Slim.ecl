IMPORT $;
EXPORT File_Persons_Slim := MODULE
 EXPORT Layout := RECORD
   UNSIGNED4 RecID;
   UNSIGNED8 ID;
   STRING15  FirstName;
   STRING25  LastName;
   STRING1   MiddleName;
   STRING2   NameSuffix;
   UNSIGNED4 FileDate;
   UNSIGNED2 BureauCode;
   STRING1   Gender;
   UNSIGNED4 BirthDate;
   STRING42  StreetAddress;
   UNSIGNED4 CSZ_ID;
 END;
 
 SHARED Filename := '~ONLINE::AM::ROXIE::persons_slim';
 EXPORT File     := DATASET(Filename,Layout,FLAT);
 EXPORT FilePlus := DATASET(Filename,{Layout,UNSIGNED8 RecPos{virtual(fileposition)}},FLAT);

 // Lab1 - Creating file indexes
 SHARED FILENAME_IDX_CSZ_lname_fname := '~ONLINE::AM::KEY::CSZ_Lname_Fname';
 EXPORT IDX_CSZ_lname_fname := INDEX(FilePlus, {CSZ_ID, LastName, FirstName, RecPos}, FILENAME_IDX_CSZ_lname_fname);

 // Lab1 - Creating file indexes
 SHARED FILENAME_IDX_lname_fname_NAME := '~ONLINE::AM::KEY:LNAME_FNAME';
 EXPORT IDX_lname_fname := INDEX(FilePlus, {LastName, FirstName, RecPos}, FILENAME_IDX_lname_fname_NAME);

END;																	