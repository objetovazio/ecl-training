IMPORT $;

File := $.File_NamesPhones;
FileUpd := $.File_NamesPhonesUpd;

FileOutput := '~ONLINE::AM::JOIN::FULLKEYED';

OutRec := RECORD
    UNSIGNED4 RecID;
    STRING10  HomePhone;
    STRING10  CellPhone;
    STRING20  FName;
    STRING20  MName;
    STRING20  LName;
    STRING10  New_HomePhone;
    STRING10  New_CellPhone;
    STRING20  New_FName;
    STRING20  New_MName;
    STRING20  New_LName;
END;

OutRec JoinNewData(File.File L, FileUpd.FilePlus R)  := TRANSFORM
    SELF.New_HomePhone := R.HomePhone;
    SELF.New_CellPhone := R.CellPhone;
    SELF.New_FName := R.FName;
    SELF.New_MName := R.MName;
    SELF.New_LName := R.LName;
    SELF := L;
END;

FullKey := JOIN(File.File(LName[1] = 'L'), FileUpd.FilePlus, 
                LEFT.RecID = RIGHT.ForeignKeyID,
                JoinNewData(LEFT, RIGHT), 
                KEYED(FileUpd.IDX_Fkey_RecID)
            );

OUTPUT(FullKey,, FileOutput); 