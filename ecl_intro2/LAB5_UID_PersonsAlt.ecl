IMPORT $, STD;

Layout := $.LAB1_File_Persons.Layout;
File := $.LAB1_File_Persons.File;

Layout_Persons_UID := RECORD
    UNSIGNED4 UID := 0;
    File;
END;

FileUID := TABLE(File, Layout_Persons_UID);

Layout_Persons_UID IDRecs(Layout_Persons_UID L, Layout_Persons_UID R) := TRANSFORM
    SELF.UID := IF(L.UID = 0, STD.system.Thorlib.node() + 1, L.UID + CLUSTERSIZE);
    SELF := R;
END;

EXPORT LAB5_UID_PersonsAlt := ITERATE(FileUID, IDRecs(LEFT, RIGHT), LOCAL):PERSIST('~class::am::persist:UID_PersonsAlt');