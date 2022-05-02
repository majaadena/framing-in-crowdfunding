****** Table 13 Results of suggestions ******

use  "../Data/summerparty.dta", clear

do "labeling.do"

//Panel A: only monetary gifts
*Number of subjects by treatment
tab tr10

*Number of monetary gifts
tab tr10 if Contribution_d==1

*Share of monetary gift
mean Contribution_d, over(tr10)
prtest Contribution_d, by(tr10)

*Monetary return per mail in €
ttest Contribution, by(tr10)

*Average positive monetary gift in €
ttest Contribution if Contribution>0 , by(tr10)

*minimum, median, maximum
sort tr10
by tr10: sum Contribution if Contribution>0, detail

*Share of gifts €5–6 conditional on giving
gen giftsize1=0 if Contribution>0 
replace giftsize1=1 if Contribution>0 & Contribution<=6
prtest giftsize1, by(tr10)

*Share of gifts €10 conditional on giving
gen giftsize2=0 if Contribution>0 
replace giftsize2=1 if Contribution==10
prtest giftsize2, by(tr10)

*Share of gifts €15 and more conditional on giving
gen giftsize3=0 if Contribution>0 
replace giftsize3=1 if Contribution>=15
prtest giftsize3, by(tr10)

//Panel B: including buffet pledges monetized at €10
*Number of buffet gifts
tab Büffet tr10

*Share of buffet gifts
prtest Büffet, by(tr10)

*Total number of gift givers
gen dondum=(Contrmon>0)
tab dondum tr10 

*Overall response rate
prtest dondum, by(tr10)

*Return in € per mail including buffet pledges monetized at €10
ttest Contrmon, by(tr10)

*Average positive gift in € including buffet pledges monetized at 10€
ttest Contrmon if Contrmon>0 , by(tr10)
