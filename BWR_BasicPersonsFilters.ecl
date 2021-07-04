IMPORT $;

// Lives in Florida
COUNT($.Persons(State = 'FL'));

// Lives in Florida and Miami
COUNT($.Persons(State = 'FL', City = 'Miami'));

// Lives in Zipcode 33102
COUNT($.Persons(ZipCode = '33102'));

// Name starts with B
COUNT($.Persons(FirstName[1] = 'B'));

// File Date bigger than 2000
COUNT($.Persons(FileDate[0..4] > '2000'));