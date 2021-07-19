IMPORT $;

Persons := $.LAB1_File_Persons.File;

GENDER_CNT := RECORD
    Persons.gender;
    INTEGER cnt := COUNT(GROUP);
END;

MyTable := TABLE(Persons,GENDER_CNT,gender);
OUTPUT(MyTable);