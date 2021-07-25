IMPORT $;

IDX_FKey_RecIDpay := $.File_NamesPhonesUpd.IDX_FKey_RecIDpay;
IDX_Lname_Pay := $.File_NamesPhones.IDX_Lname_Pay;

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

OutRec XForm1(IDX_Lname_Pay L, IDX_FKey_RecIDpay R) := TRANSFORM
    SELF.New_HomePhone := R.HomePhone;
    SELF.New_CellPhone := R.CellPhone;
    SELF.New_FName := R.FName;
    SELF.New_MName := R.MName;
    SELF.New_LName := R.LName;
    SELF := L;
END;

HalfKeyedJoin := JOIN(
    IDX_Lname_Pay(Lname[1] = 'L'), IDX_FKey_RecIDpay,
    KEYED(LEFT.RecId = RIGHT.ForeignKeyID),
    XForm1(LEFT, RIGHT)
);

FileOutput := '~ONLINE::AM::JOIN::HALFKEYEDPAYLOADROXIE';
OUTPUT(HalfKeyedJoin,, FileOutput, OVERWRITE);