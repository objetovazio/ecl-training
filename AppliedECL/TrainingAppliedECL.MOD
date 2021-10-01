//Import:AppliedECL.BWR_GenerateStates
IMPORT $;

State_Rec := RECORD
  STRING2   State;
  UNSIGNED1 StateCode;
 END;


States_DS :=
  DATASET([{'AE', 1},{'WY', 2},{'TN', 3},{'MI', 4},{'RI', 5},{'SC', 6},{'VA', 7},{'NH', 8},{'AP', 9},{'NM', 10}, 
           {'IL', 11},{'KS', 12}, {'ME', 13}, {'AL', 14}, {'WA', 15}, {'NY', 16}, {'MO', 17}, {'PA', 18}, {'HI', 19}, {'GU', 20}, 
           {'VT', 21},{'CT', 22}, {'NC', 23}, {'OR', 24}, {'IA', 25}, {'DE', 26}, {'VI', 27}, {'ID', 28}, {'MT', 29}, {'AR', 30}, 
           {'MS', 31},{'UT', 32}, {'NE', 33}, {'IN', 34}, {'GA', 35}, {'WV', 36}, {'NJ', 37}, {'LA', 38}, {'WI', 39}, {'AK', 40}, 
           {'CA', 41},{'NV', 42}, {'FL', 43}, {'MA', 44}, {'CO', 45}, {'AZ', 46}, {'SD', 47}, {'DC', 48}, {'KY', 49}, {'MP', 50}, 
           {'ND', 51},{'AS', 52}, {'TX', 53}, {'PR', 54}, {'MD', 55}, {'OH', 56}, {'MN', 57}, {'OK', 58}, {'AA', 59}], State_Rec);

OUTPUT(States_DS,,'~ONLINE::AppliedECL::States',OVERWRITE);
//Import:AppliedECL.Cardinality
IMPORT <YourModule> AS X;

t    := TABLE(X.Persons,{BureauCode});
dt   := DISTRIBUTE(t,HASH32(BureauCode));
sdt  := SORT(dt,BureauCode,LOCAL);
dsdt := DEDUP(sdt,BureauCode,LOCAL);

COUNT(dsdt);
//Import:AppliedECL.Field_Population
IMPORT AppliedECL AS X;

c1 := COUNT(X.Persons(DependentCount=0));

c2 := COUNT(X.Persons);

d := DATASET([{'Total Records',c2},
              {'Recs=0',c1},
              {'Population Pct',(INTEGER)(((c2-c1)/c2)*100.0)}],
              {STRING15 valuetype,INTEGER val});

OUTPUT(d);
//Import:AppliedECL.File_PersonsAccounts
IMPORT AppliedECL;
EXPORT File_PersonsAccounts := MODULE

EXPORT ParentRec := RECORD
 UNSIGNED8 RecID;
 STRING15  FirstName;
 STRING25  LastName;
 STRING15  MiddleName;
 STRING2   NameSuffix;
 STRING8   FileDate;
 UNSIGNED2 BureauCode;
 STRING1   MaritalStatus;
 STRING1   Gender;
 UNSIGNED1 DependentCount;
 STRING8   BirthDate;
 STRING42  StreetAddress;
 STRING20  City;
 STRING2   State;
 STRING5   ZipCode;
END;

EXPORT ChildRec := RECORD
  UNSIGNED8 PersonID;
  STRING8   ReportDate;
  STRING2   IndustryCode;
  UNSIGNED4 Member;
  STRING8   OpenDate;
  STRING1   TradeType;
  STRING1   TradeRate;
  UNSIGNED1 Narr1;
  UNSIGNED1 Narr2;
  UNSIGNED4 HighCredit;
  UNSIGNED4 Balance;
  UNSIGNED2 Terms;
  UNSIGNED1 TermTypeR;
  STRING20  AccountNumber;
  STRING8   LastActivityDate;
  UNSIGNED1 Late30Day;
  UNSIGNED1 Late60Day;
  UNSIGNED1 Late90Day;
  STRING1   TermType;
 END;

EXPORT Layout := RECORD
  ParentRec;
	INTEGER AcctCnt;
  DATASET(ChildRec) ChildAccts;
END;

EXPORT Persons  := DATASET('~ONLINE::XXX::AppliedECL::PersonsAccts',Layout,THOR);
EXPORT PersonsParent := PROJECT(Persons,ParentRec):PERSIST('~ONLINE::PERSIST::PersonsParent');	
EXPORT Accounts := Persons.ChildAccts;

END;
//Import:AppliedECL.File_States
EXPORT File_States := MODULE

 EXPORT Layout := RECORD
  STRING2   State;
  UNSIGNED1 StateCode;
 END;

 EXPORT File := DATASET('~ONLINE::AppliedECL::States',Layout,THOR); 
 
END;
//Import:AppliedECL.HASHAppend_Example
LOADXML('<xml/>');
#DECLARE(OutputStr)
//                 OUTPUT( 'Hello ',NAMED( 'Hello '));
#APPEND(OutputStr,'OUTPUT(\'Hello\',NAMED(\'Hello\'));\n' )
%OutputStr%

#DECLARE(MySymbol)
#SET(MySymbol, 'Hello')
#APPEND(MySymbol, ' World')
%'MySymbol'%  //Will output ' Hello World '

//Import:AppliedECL.HASHExport
LOADXML('<xml/>');

r := RECORD
  UNSIGNED4 id;
  STRING10  name; 
  END;
ds := DATASET([{1234,'Bob'},{5678,'Jim'}], r);  

#DECLARE(out);
#EXPORT(out, r);
OUTPUT(%'out'%);

//Import:AppliedECL.HashFOR_Example
 // This script processes XML and generates ECL COUNT statements
  // which run against the datasets and filters specified in the XML.
  XMLstuff :=
   '<section>'+
       '<item>'+
           '<dataset>persons</dataset>'+
           '<filter>firstname = \'RICHARD\'</filter>'+
       '</item>'+
       '<item>'+
           '<dataset>persons</dataset>'+
           '<filter>firstname = \'JOHN\'</filter>'+
       '</item>'+
       '<item>'+
           '<dataset>persons</dataset>'+
           '<filter>firstname = \'HENRY\'</filter>'+
       '</item>'+
   '</section>';
  
  LOADXML(XMLstuff);
  #DECLARE(CountStr); // Declare CountStr
  #SET(CountStr, '' ); // Initialize it to an empty string
  #FOR(item)
     #APPEND(CountStr,'COUNT(' + %'dataset'% + '(' + %'filter'% + ' ));\n');
  #END
  
  OUTPUT(%'CountStr'%); // output the string just built
  //%CountStr% // then execute the generated "COUNT" actions
  
  // Note that the "CountStr" will have 3 COUNT actions in it:
  //   COUNT(person(person.firstname = 'RICHARD'));
  //   COUNT(person(person.firstname = 'JOHN'));
  //   COUNT(person(person.firstname = 'HENRY'));

//Import:AppliedECL.Persons
Layout_Persons := RECORD
  UNSIGNED4 ID;
  STRING15  FirstName;
  STRING25  LastName;
  STRING15  MiddleName;
  STRING2   NameSuffix;
  STRING8   FileDate;
  UNSIGNED2 BureauCode;
  STRING1   MaritalStatus;
  STRING1   Gender;
  UNSIGNED1 DependentCount;
  STRING8   BirthDate;
  STRING42  StreetAddress;
  STRING20  City;
  STRING2   State;
  STRING5   ZipCode;
 END; 

EXPORT Persons := DATASET('~ONLINE::XXX::AppliedECL::Persons',Layout_Persons,THOR);
//Import:AppliedECL.Value_Count
IMPORT AppliedECL AS X;

r := RECORD
  X.Persons.Gender;
  INTEGER cnt := COUNT(GROUP);
  END;

EXPORT ValueCount := TABLE(X.Persons,r,Gender); 




