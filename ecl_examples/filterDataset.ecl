EXPORT filterDataset(STRING search, BOOLEAN  onlyOldies) := MODULE
    f := namesTable;

    SHARED g        := IF(onlyOldies, f(age >= 65), f);
    EXPORT included := g(surname = search);
    EXPORT excluded := g(surname <> search);
END;
