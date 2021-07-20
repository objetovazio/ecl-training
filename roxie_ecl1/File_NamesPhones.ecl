IMPORT $;
EXPORT File_NamesPhones := MODULE
 EXPORT Layout := RECORD
  UNSIGNED4 RecID;
  STRING25  Address1;
  STRING25  Address2;
  STRING20  OrigCity;
  STRING2   OrigState;
  STRING9   OrigZip;
  STRING35  Country;
  STRING8   DOB;
  STRING8   Gender;
  STRING10  HomePhone;
  STRING10  CellPhone;
  STRING5   Title;
  STRING20  FName;
  STRING20  MName;
  STRING20  LName;
  STRING5   Name_Suffix;
 END;
 EXPORT File := DATASET('~online::xxx::roxie::namephones',Layout,THOR);
 //xxx - your initials
 //add INDEX declarations here
END;