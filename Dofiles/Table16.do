****** Table 16 Gender ******

use  "../Data/summerparty.dta", clear

drop if frauen==.

sort frauen

*Number of subjects
*Overall return per e-mail
by frauen: sum Contribution
ttest Contribution, by(frauen)

*Number of monetary gifts
*Average positive gift
by frauen: sum Contribution if Contribution>0
ttest Contribution if Contribution>0, by(frauen)

*Minimum Median Maximum
by frauen: sum Contribution if Contribution>0, detail

*Share monetary gift
by frauen: sum contrmondum 
prtest contrmondum, by(frauen)

*Share buffet 
by frauen: sum Büffet
prtest Büffet, by(frauen)

*Overall response rate
by frauen: sum contrdum
prtest contrdum, by(frauen)

