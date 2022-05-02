****** Table 15 Academics versus administration ******

use  "../Data/summerparty.dta", clear

keep if sum==1 | sumv==1 | postdoc==1 | nawi==1 | prof==1

sort sumv

*Number of subjects
*Overall return per e-mail
by sumv: sum Contribution
ttest Contribution, by(sumv)
 
*Number of monetary gifts
*Average positive gift
by sumv: sum Contribution if Contribution>0
ttest Contribution if Contribution>0, by(sumv)

*Minimum Median Maximum
by sumv: sum Contribution if Contribution>0, detail

*Share monetary gift
by sumv: sum contrmondum 
prtest contrmondum, by(sumv)

*Share buffet 
by sumv: sum Büffet
prtest Büffet, by(sumv)

*Overall response rate
by sumv: sum contrdum
prtest contrdum, by(sumv)

