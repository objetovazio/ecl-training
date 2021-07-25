IMPORT $, STD;

BUILD($.File_Persons_Slim.IDX_CSZ_lname_fname, OVERWRITE);
BUILD($.File_Persons_Slim.IDX_lname_fname, OVERWRITE);
BUILD($.File_LookupCSZ.IDX_st_city, OVERWRITE);

// File := $.File_Persons_Slim.IDX_lname_fname;
// HasSmith := STD.Str.Find(File.LastName, 'SMITH', 1) > 0;

// SortedRecs := SORT($.File_Persons_Slim.FilePlus, FirstName);

// OUTPUT(File(HasSmith));