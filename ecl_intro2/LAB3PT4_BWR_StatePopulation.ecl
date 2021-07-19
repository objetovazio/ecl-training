IMPORT $, Visualizer;

Persons := $.LAB1_File_Persons.File;

STATE_CNT := RECORD
    Persons.State;
    INTEGER4 StateCnt := COUNT(GROUP);
END;

RecByState := TABLE(Persons, STATE_CNT, State);
OUTPUT(RecByState, NAMED('choro_usStates'));
Visualizer.Choropleth.USStates('usStates',, 'choro_usStates');