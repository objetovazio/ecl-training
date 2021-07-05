Num25 := 25;

// Inline function Example
AddFive(INTEGER x = 10) := x + 5;

// Example with Parameter
NumResult1 := AddFive(Num25);

// Exampel withot parameter, using default value.
NumResult2 := AddFive();

// Passing a DATASET as a Parameter
MyRecord := {STRING1 Letter};
SomeFile := DATASET([{'A'}, {'B'}, {'C'}, {'D'}, {'E'}], MyRecord);

// Passing dataser referenced as "ds" in expression
FilteredDS(DATASET(MyRecord) ds) := ds(Letter NOT IN ['A', 'B', 'C']);

OUTPUT(NumResult1); 
OUTPUT(NumResult2); 
OUTPUT(FilteredDS(SomeFile));