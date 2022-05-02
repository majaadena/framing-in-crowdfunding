****** Table 8 Early and late gifts ******

use  "../Data/summerparty.dta", clear

do "labeling.do"

gen bonus=0 if Day!=.
replace bonus=1 if Day<=22

tab Contribution bonus if trdona==0
tab Contribution bonus if trdona==1
tab Büffet bonus if trdona==0
tab Büffet bonus if trdona==1
tab Contrmon bonus if trdona==0
tab Contrmon bonus if trdona==1
sort bonus
by bonus: sum Contribution if trdona==0
by bonus: sum Contribution if trdona==1
mean Contribution if trdona==1, over(bonus)
mean Contribution if trdona==0, over(bonus)
by bonus: sum Contrmon if trdona==0
by bonus:sum Contrmon if trdona==1
mean Contrmon if trdona==1, over(bonus)
mean Contrmon if trdona==0, over(bonus)

ttest Contribution if trdona==0, by(bonus)
ttest Contribution if trdona==1, by(bonus)
prtest Büffet  if trdona==0, by(bonus)
prtest Büffet  if trdona==1, by(bonus)

ttest Contribution, by(bonus)
prtest Büffet, by(bonus)

