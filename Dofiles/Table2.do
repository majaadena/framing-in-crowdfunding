****** Table 2 Results of different wording ******

use  "../Data/summerparty.dta", clear

do "labeling.do"

//Panel A: only monetary gifts
*Number of subjects by treatment
tab trdona

*Number of monetary gifts
tab trdona if Contribution_d==1 

*Share of monetary gift
mean Contribution_d, over(trdona)
prtest Contribution_d, by(trdona)

*Monetary return per mail in €
ttest Contribution, by(trdona)

*Average positive monetary gift in €
ttest Contribution if Contribution>0, by(trdona)

*minimum, median, maximum
sort trdona
by trdona: sum Contribution if Contribution>0, detail

*Share of gifts €5–6 conditional on giving
gen giftsize1=0 if Contribution>0 
replace giftsize1=1 if Contribution>0 & Contribution<=6
prtest giftsize1, by(trdona)

*Share of gifts €10 conditional on giving
gen giftsize2=0 if Contribution>0 
replace giftsize2=1 if Contribution==10
prtest giftsize2, by(trdona)

*Share of gifts €15 and more conditional on giving
gen giftsize3=0 if Contribution>0 
replace giftsize3=1 if Contribution>=15
prtest giftsize3, by(trdona)

//Panel B: including buffet pledges monetized at €10
*Number of buffet gifts
tab Büffet trdona

*Share of buffet gifts
prtest Büffet, by(trdona)

*Total number of gift givers
gen dondum=(Contrmon>0)
tab dondum trdona 

*Overall response rate
prtest dondum, by(trdona)

*Return in € per mail including buffet pledges monetized at €10
ttest Contrmon, by(trdona)

*Average positive gift in € including buffet pledges monetized at 10€
ttest Contrmon if Contrmon>0 , by(trdona)
