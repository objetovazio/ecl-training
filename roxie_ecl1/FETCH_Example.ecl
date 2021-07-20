IMPORT $;
Person := $.File_Persons_Slim.File;
SPerson := SORT(Person,Lastname);
OUTPUT(SPerson);
PtblRec := RECORD
  STRING25 Lname   := Person.Lastname;
  STRING15 Fname   := Person.Firstname;
  STRING42 Address := Person.StreetAddress;
  UNSIGNED4 CSZ_ID := Person.CSZ_ID;	
END;

DataFile := '~AMTEMP::TestFetch';    //~AM = your initials
KeyFile  := '~AMTEMP::TestFetchKey'; //~AM = your initials

PtblOut := OUTPUT(TABLE(Person(lastname[1..3]='WIK'),PtblRec),,DataFile,OVERWRITE);

Ptbl := DATASET(DataFile,
                {PtblRec,UNSIGNED8 RecPos {virtual(fileposition)}},
                FLAT);

AlphaInStateCity := INDEX(Ptbl,
                          {address,csz_id,lname,fname,RecPos},
                          KeyFile);

Bld :=   BUILD(AlphaInStateCity,OVERWRITE);

AlphaPeople := FETCH(Ptbl, 
                     AlphaInStateCity(WILD(address),
                     WILD(csz_id),
                     KEYED(Lname='WIK')),
                     RIGHT.RecPos);

OutFile := OUTPUT(CHOOSEN(AlphaPeople,10));

PtblOut;
Bld;
OutFile;
/* Expected output: 3 tabs -- 66 rows on tab 1-2 and 1 row on tab 3 */