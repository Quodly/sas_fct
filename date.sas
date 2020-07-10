/*************************************************
##################################################
*************************************************/;

proc fcmp outlib = home.functions.date;

/************************************************/;

  function mon(date);
    if missing(date) then return(.);
  
    return(month(date));
  endsub;

  function yea(date);
    if missing(date) then return(.);
  
    return(year (date));
  endsub; 
  
  function diff_date(date1, date2, interval);
    if missing(date1) or missing(date2) then return(.);
      
    days = intck('day', date1, date2);
    
    if mod(days, interval) > 0
      then return(int(days/interval) + 1);
      else return(int(days/interval)    );
  endsub;  

/************************************************/;

  function yymm(date) $ 4;
    if missing(date) then return("");
  
    yy = put(date, year2.);
    mm = month(date);
    
    yymmn = yy*100 + mm;
    yymmc = put(yymmn, z4.);
    
    return(yymmc);
  endsub;
        
  function diff_yymm(yymm1 $, yymm2 $);
    if missing(yymm1) or missing(yymm2) then return(.);
    
    date1 = input(yymm1, yymmn4.);
    date2 = input(yymm2, yymmn4.);
        
    return(intck('month', date1, date2));
  endsub;        
      
/************************************************/;

  function excel_date(date);
    return(date+21916);
  endsub;
  
  function excel_time(time);
    return(time/84600);
  endsub;

/************************************************/;

run;

/*************************************************
##################################################
*************************************************/;