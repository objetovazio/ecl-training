IMPORT $;

IDX_FKey_RecIDpay := $.File_NamesPhonesUpd.IDX_FKey_RecIDpay;
IDX_Lname_Pay := $.File_NamesPhones.IDX_Lname_Pay;
BaseDS := $.File_NamesPhones.File;

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

OutRec XForm1(BaseDS L, IDX_FKey_RecIDpay R) := TRANSFORM
    SELF.New_HomePhone := R.HomePhone;
    SELF.New_CellPhone := R.CellPhone;
    SELF.New_FName := R.FName;
    SELF.New_MName := R.MName;
    SELF.New_LName := R.LName;
    SELF := L;
END;

HalfKeyedJoin := JOIN(
    BaseDS, IDX_FKey_RecIDpay,
    KEYED(LEFT.RecId = RIGHT.ForeignKeyID) AND LEFT.lname[1] = 'L',
    XForm1(LEFT, RIGHT)
);

FileOutput := '~ONLINE::AM::JOIN::HALFKEYED';
OUTPUT(HalfKeyedJoin,, FileOutput, OVERWRITE);