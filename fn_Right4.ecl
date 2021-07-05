EXPORT fn_Right4(String s) := IF(LENGTH(TRIM(s)) > 4, 
                                s[LENGTH(TRIM(s)) - 3 ..],
                                s);