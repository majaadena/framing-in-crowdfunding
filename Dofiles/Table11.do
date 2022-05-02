****** Table 11 MTurk survey and emotion levels by frame ******

use "../Data/mturk_data.dta", clear

tab trcontr

gen treatment=(trcontr=="contribution")

local a = 0
local b = 1 
local i = 1

foreach var in Interest Amusement Pride Joy Pleasure Contentment Love Admiration Relief Compassion Sadness Guilt Regret Shame Disappointment Fear Disgust Contempt Hate Anger {
	display "`var'"
	ttest  `var' if treatment==`a' | treatment==`b' , by(treatment) unequal 
	
	return list
	local medA = r(mu_1)
	local medB = r(mu_2)
	local pvalAB  = r(p)
	local seA = (r(sd_1)/sqrt(r(N_1)))
	local seB = (r(sd_2)/sqrt(r(N_2)))
	
		if `i' == 1 { 
		matrix M =((`medA')\(`seA')\(`medB')\(`seB')\(`pvalAB'))
		}
	
		else {
		matrix S =((`medA')\(`seA')\(`medB')\(`seB')\(`pvalAB'))
		matrix M = M,S
		}
	
	local i = `i' +1
}
	
matrix list M 

putexcel set "../Output/MTurk_table11.xlsx", replace

matrix colnames M = "`:variable label Interest'" "`:variable label Amusement'" "`:variable label Pride'" "`:variable label Joy'" "`:variable label Pleasure'" "`:variable label Contentment'" "`:variable label Love'" "`:variable label Admiration'" "`:variable label Relief'" "`:variable label Compassion'" "`:variable label Sadness'" "`:variable label Guilt'" "`:variable label Regret'" "`:variable label Shame'" "`:variable label Disappointment'" "`:variable label Fear'" "`:variable label Disgust'" "`:variable label Contempt'" "`:variable label Hate'" "`:variable label Anger'" 

matrix rownames M = "Donation: Mean" "Std err" "Constribution: Mean" "Std err" "T-test p-values"

putexcel A1 = matrix(M), names 

