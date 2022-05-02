****** Table 18 Interaction with administrative staff ******

use  "../Data/summerparty.dta", clear

do "labeling.do"

gen admdona=sumv*trdona	
lab var admdona "Administrative staff x donation"

gen adm10=sumv*tr10	
lab var adm10 "Administrative staff x EUR20 suggestion"

eststo clear

eststo: reg Contribution trdona tr10 sumv admdona adm10, vce(robust)

eststo: reg Contribution trdona tr10 sumv admdona adm10 if Contribution>0, vce(robust)

probit contrdum trdona tr10 sumv admdona adm10, vce(robust)

estpost margins, dydx(*)

eststo

esttab using "../Output/summerparty_table18.rtf", ///
	   b(%8.3f) replace compress r2 pr2 se label ///
	   nonumbers star(* 0.10 ** 0.05 *** 0.01 ) ///
	   title ("Table 18 Interaction with administrative staff") ///
	   mtitle("Monetary return OLS" "Average positive gift OLS" "Overall response rate Probit marginal effects") ///
	   note("Note: Robust standard errors in parentheses.")

