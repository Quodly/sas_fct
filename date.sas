/*************************************************
##################################################
*************************************************/;

proc fcmp outlib = home.functions.date;       

/************************************************/;

  function mon(date);
    if missing(date) then return(.);
  
    return(month(date));
  endsub;
  
  function qua(date);
    if missing(date) then return(.);
  
    return(qtr  (date));
  endsub;

  function yea(date);
    if missing(date) then return(.);
  
    return(year (date));
  endsub;
  
/************************************************/;

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
  
    return(put(date, yymmn4.));
  endsub;
  
  function yyqq(date) $ 4;
    if missing(date) then return("");
  
    return(put(date,   yyq4.));
  endsub;

  function yyyy(date) $ 4;
    if missing(date) then return("");
  
    return(put(date,  year4.));
  endsub; 
  
/************************************************/;  
       
  function diff_yymm(yymm1 $, yymm2 $);
    if missing(yymm1) or missing(yymm2) then return(.);
    
    date1 = input(yymm1, yymmn4.);
    date2 = input(yymm2, yymmn4.);
        
    return(intck('month', date1, date2));
  endsub;

  function diff_yyqq(yyqq1 $, yyqq2 $);
    if missing(yyqq1) or missing(yyqq2) then return(.);
    
    date1 = input(yyqq1,   yyq4.);
    date2 = input(yyqq2,   yyq4.);
        
    return(intck('qtr'  , date1, date2));
  endsub; 

  function diff_yyyy(yyyy1 $, yyyy2 $);
    if missing(yyyy1) or missing(yyyy2) then return(.);
    
    date1 = input(yyyy1,      4.);
    date2 = input(yyyy2,      4.);
        
    return(date2-date1);
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
