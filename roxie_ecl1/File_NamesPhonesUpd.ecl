IMPORT $;
EXPORT File_NamesPhonesUpd := MODULE
 EXPORT Layout := RECORD
  UNSIGNED4 RecID;
  UNSIGNED4 ForeignKeyID;
  STRING10  HomePhone;
  STRING10  CellPhone;
  STRING20  FName;
  STRING20  MName;
  STRING20  LName;
  STRING5   Name_Suffix;
  END;
 SHARED Filename := '~online::am::roxie::namephonesupd'; //AM - your initials
 EXPORT File     := DATASET(Filename,Layout,THOR);
 EXPORT FilePlus := DATASET(Filename,{Layout,UNSIGNED8 RecPos{VIRTUAL(fileposition)}},THOR);

 EXPORT IDX_Keyname := '~online::AM::IDX::AllDataIDX';
 EXPORT IDX_Fkey_RecID := INDEX(FilePlus,{ForeignKeyID,RecID,RecPos}, IDX_Keyname); //AM - your initials

 EXPORT IDX_FKey_RecIDpay_Filename := '~ONLINE::AM::IDX::AllDataPayloadIDX';
 EXPORT IDX_FKey_RecIDpay := INDEX(FilePlus, {ForeignKeyID, RecID}, {FilePlus}, IDX_FKey_RecIDpay_Filename);
END;
