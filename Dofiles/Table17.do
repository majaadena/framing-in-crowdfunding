****** Table 17 Interaction with gender ******

use  "../Data/summerparty.dta", clear

do "labeling.do"

gen femtrdona=frauen*trdona
lab var femtrdona "Female x donation"

gen femtr10=frauen*tr10	
lab var femtr10 "Female x EUR20 suggestion"

eststo clear

eststo: reg Contribution trdona tr10 frauen femtrdona femtr10, vce(robust)

eststo: reg Contribution trdona tr10 frauen femtrdona femtr10 if Contribution>0, vce(robust)

probit contrdum trdona tr10 frauen femtrdona femtr10, vce(robust)
estpost margins, dydx(*)

eststo

esttab using "../Output/summerparty_table17.rtf", ///
	   replace b(%8.3f) compress r2 pr2 se label ///
	   nonumbers star(* 0.10 ** 0.05 *** 0.01 ) ///
	   title("Table 17 Interaction with gender") ///
	   mtitle("Monetary return OLS" "Average positive gift OLS" "Overall response rate Probit marginal effects") ///
	   note("Note: Robust standard errors in parentheses.")
	   
	   