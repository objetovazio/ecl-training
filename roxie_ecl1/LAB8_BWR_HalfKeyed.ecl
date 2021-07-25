IMPORT $;

AllDataDS := $.File_NamesPhonesUpd.FilePlus;
INDX := $.File_NamesPhonesUpd.IDX_Fkey_RecID;

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

OutRecPlus := RECORD(OutRec)
    UNSIGNED4 ForeignKeyID;
END;

OutRecPlus XForm1($.File_NamesPhones.File L, INDX R) := TRANSFORM
    SELF.ForeignKeyID := R.RecId;
    SELF := L;
    SELF := [];
END;

HalfKeyedJoin := JOIN(
    $.File_NamesPhones.File(LName[1] = 'L'), INDX,
    LEFT.RecId = RIGHT.ForeignKeyID,
    XForm1(LEFT, RIGHT)
);

SetRecs := SET(HalfKeyedJoin, RecId);
FetchRecs := FETCH(AllDataDS, INDX(ForeignKeyID IN SetRecs), RIGHT.RecPos);

OutRec xform2(OutRecPlus L, AllDataDS R) := TRANSFORM
    SELF.New_HomePhone := R.HomePhone;
    SELF.New_CellPhone := R.CellPhone;
    SELF.New_FName := R.FName;
    SELF.New_MName := R.MName;
    SELF.New_LName := R.LName;
    SELF := L
END;

Result := JOIN(
    HalfKeyedJoin, FetchRecs,
    LEFT.ForeignKeyID = RIGHT.RecId,
    xform2(LEFT, RIGHT)
);

FileOutput := '~ONLINE::AM::JOIN::HALFKEYED';
OUTPUT(Result,, FileOutput, OVERWRITE);
COUNT(Result);