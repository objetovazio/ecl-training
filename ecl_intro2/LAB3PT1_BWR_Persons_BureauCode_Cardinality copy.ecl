IMPORT $;

Persons := $.LAB1_File_Persons.File;

T := TABLE(Persons, {Persons.BureauCode});
DT := DISTRIBUTE(t, HASH32(BureauCode)); // Distribute the data between all Nodes
SDT := SORT(dt, BureauCode, LOCAL);
DSDT := DEDUP(sdt, BureauCode, LOCAL);

DSDT;
COUNT(DSDT);