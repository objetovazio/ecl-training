EXPORT File_LookupCSZ := MODULE
  EXPORT Layout := RECORD
   UNSIGNED4  CSZ_ID;
   STRING20   City;
   STRING2    State;
   UNSIGNED3  ZipCode;
   END;

  SHARED Filename := '~ONLINE::AM::ROXIE::lookupcsz'; //AM = your initials
   		
  EXPORT File     := DATASET(Filename,Layout,THOR);
  EXPORT FilePlus := DATASET(Filename,
                            {Layout,
                            UNSIGNED8 RecPos{virtual(fileposition)}},FLAT);

  // Lab1 - Creating file indexes
  SHARED FILENAME_IDX_st_city := '~ONLINE::AM::KEY::LookupCSZ';
  EXPORT IDX_st_city := INDEX(FilePlus, {State, City, Recpos}, FILENAME_IDX_st_city);
END;