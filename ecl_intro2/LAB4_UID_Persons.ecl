IMPORT $;

Layout_People_RecId := RECORD
    UNSIGNED4 UID;
    $.LAB1_File_Persons.Layout;
END;

Layout_People_RecId IDRecs($.LAB1_File_Persons.Layout L, INTEGER CNT) := TRANSFORM
    SELF.UID := CNT;
    SELF     := L;
END;

EXPORT LAB4_UID_Persons := PROJECT($.LAB1_File_Persons.File, IDRecs(LEFT, COUNTER))
        :PERSIST('~CLASS::AM::PERSIST::UID_PERSONS');