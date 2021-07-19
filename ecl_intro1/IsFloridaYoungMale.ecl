IMPORT $;

BOOLEAN IsFloridian := $.Persons.State = 'FL';
BOOLEAN IsMale      := $.Persons.Gender = 'M';
BOOLEAN IsBorn80    := $.Persons.BirthDate != '' AND $.Persons.BirthDate[..4] >= '1980';

EXPORT IsFloridaYoungMale := IsFloridian AND IsMale AND IsBorn80;