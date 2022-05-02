****** Figure 7 Average unconditional gifts by status ******

use  "../Data/summerparty.dta", clear 

gen contrmon=Contribution
replace contrmon=Contribution+10 if Büffet==1

gen status=0 if  studhk==1
replace status=1 if  nawi==1
replace status=2 if  postdocs==1
replace status=3 if  prof==1
label define mstatus 0 "Student research assistants" 1 "PhD students" 2 "Postdocs" 3 "Professors"
label value status mstatus

keep if status!=.
 
label define l_trdona 0 "C" 1 "D"
label value trdona l_trdona

collapse (mean) mmy_dona=Contribution mbuf=Büffet contrmon (sd) sdmy_dona=Contribution sdbuf=Büffet (count) nmy_dona=Contribution nbuf=Büffet, by(status trdona) 


//Only monetary gifts
graph bar mmy_dona,  over(trdona) over(status) ytitle("")  yscale(r(0 (1) 14)) yla(0 (1) 14)

//Including buffet pledges monetised at €10
graph bar contrmon,  over(trdona) over(status) ytitle("") yscale(r(0 (1) 14)) yla(0 (1) 14)

