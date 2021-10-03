EXPORT MAC_BuildCASE(Infile,FieldText,FieldNum,OutVal,ROutVal) := MACRO
    IMPORT STD.Str as Z;
    UpperIt(STRING txt) :=  Z.ToUpperCase(txt);

    ded := DEDUP(SORT(Infile, FieldNum), FieldNum);
    
    r := RECORD
        STRING val := (STRING) ded.FieldNum + ' => \'' + TRIM((STRING) ded.FieldText) + '\'';
        STRING RVal := '\'' + UpperIt(TRIM((STRING) ded.FieldText)) + '\' => ' + (STRING) ded.FieldNum;
    END;

    r Conc(r L, r R) := TRANSFORM
        SELF.val := L.Val + ', ' + R.Val;
        SELF.RVal := L.RVal + ', ' + R.RVal;
    END;

    s := ROLLUP(TABLE(ded, r), TRUE, Conc(LEFT, RIGHT));

    OutVal := 'IntTo' + #TEXT(FieldText) + '(INTEGER i) := CASE(i, ' + s[1].Val + ',\'?\');';
    ROutVal := #TEXT(FieldText) + 'ToInt(STRING s) := CASE(i, ' + s[1].RVal + ', 0);';
ENDMACRO;