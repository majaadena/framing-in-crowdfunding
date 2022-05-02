****** Table 5 Distance to suggested amounts and variance ******

use  "../Data/summerparty.dta", clear

do "labeling.do"

gen distance=abs(Contribution-10) if tr10==0 & Contribution>0
replace distance=abs(Contribution-20) if tr10==1 & Contribution>0
lab var distance "Distance to the suggested amount"

gen distancemon=abs(Contrmon-10) if tr10==0 & Contrmon>0
replace distancemon=abs(Contrmon-20) if tr10==1 & Contrmon>0
lab var distancemon "Standard deviations from the mean"

//Left panel: Only monetary gifts
*Number of subjects
*Distance to the suggested amount
*One-sided t-test p-value
ttest distance, by(trdona)

*Standard deviations from the mean
*Variance-comparison test p-value
sdtest Contribution if Contribution>0, by(trdona)

*Variance-comparison robust test p-value
robvar Contribution if Contribution>0, by(trdona)

//Right panel: Including buffet pledges monetized at €10
*Number of subjects
*Distance to the suggested amount
*One-sided t-test p-value
ttest distancemon, by(trdona)

*Standard deviations from the mean
*Variance-comparison test p-value
sdtest Contrmon if Contrmon>0, by(trdona)

*Variance-comparison robust test p-value
robvar Contrmon if Contrmon>0, by(trdona)

