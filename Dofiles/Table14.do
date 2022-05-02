****** Table 14 Individual characteristics ******

use  "../Data/summerparty.dta", clear

do "labeling.do"

eststo clear

eststo: reg Contribution trdona tr10 frauen  prof  postdocs nawi studhk sumv, vce(robust) 

eststo: reg Contribution trdona tr10 frauen  prof  postdocs nawi studhk sumv if Contribution>0, vce(robust) 

probit contrdum trdona tr10 frauen  prof  postdocs nawi studhk sumv 
estpost margins, dydx(*)

eststo

esttab using "../Output/summerparty_table14.rtf", ///
	   b(%8.3f) replace compress  r2 pr2 se label ///
	   nonumbers star(* 0.10 ** 0.05 *** 0.01) ///
	   title("Table 14 Individual characteristics") ///
	   mtitle("Monetary return OLS" "Average positive gift OLS" "Overall response rate Probit marginal effects") ///
	   note("Note: Robust standard errors in parentheses; not accounting for buffet contributions.")
	   
