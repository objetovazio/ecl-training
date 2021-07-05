EXPORT isAnyRateEQSince(STRING1 rate, age) := FUNCTION
  isTradeRateEQSince := Trades.trd_rate = rate AND
                        ValidDate(trades.trd_drpt) AND
                        AgeOf(trades.trd_drpt) <= age;

  isPHRRateEQSince := EXISTS(Prev_rate(phr_rate = rate,
                                       ValidDate(pgr_date),
                                       AgeOf(phr_date) <= age,
                                       phr_grid_flag = TRUE));
  
  RETURN isTradeRateEQSince OR isPHRRateEQSince;
END;
