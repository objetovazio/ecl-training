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

 SHARED Filename := '~online::AM::roxie::namephones'; //AM - your initials
 EXPORT File := DATASET(Filename, Layout, THOR);

 EXPORT IDX_Lname_Pay_Filename := '~ONLINE::AM::IDX::HalfKeyedPayloadRoxie';
 EXPORT IDX_Lname_Pay := INDEX(File, {Lname}, {File}, IDX_Lname_Pay_Filename);
END;