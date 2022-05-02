****** Table 7 Individual characteristics in each of the 2x2 randomization cells and t-test p-values ******

use  "../Data/summerparty.dta", clear

do "labeling.do"
 
local a = 1
local b = 2 
local i = 1

foreach var in frauen prof postdocs nawi studhk SPI SPII SPIII SPIV SPV verw datm bib presse sek {
	display "`var'"
	ttest  `var' if treatment==`a' | treatment==`b' , by( treatment) unequal 
	return list
	
	local medA = r(mu_1)
	local medB = r(mu_2)
	local pvalAB  = r(p)
	local seA = (r(sd_1)/sqrt(r(N_1)))
	local seB = (r(sd_2)/sqrt(r(N_2)))
	
		if `i' == 1 {
		matrix M =((`medA')\(`seA')\(`medB')\(`seB')\0\0\(`pvalAB')\0\0)
		matrix rownames M = meanA seA meanB seB meanC seC p-value_AB p-value_AC p-value_BC
		}
	
		else { 
		matrix S =((`medA')\(`seA')\(`medB')\(`seB')\0\0\(`pvalAB')\0\0)
		matrix M = M,S
		}
	
	local i = `i' +1
	}


local a = 1 
local b = 3
local i = 1

foreach var in frauen prof postdocs nawi studhk SPI SPII SPIII SPIV SPV verw datm bib presse sek {
	display "`var'"
	ttest `var' if treatment==`a' | treatment==`b' , by( treatment) unequal 
	return list
	
	local medC = r(mu_2)
	local seC = r(sd_2)/sqrt(r(N_2))
	local pvalAC  = r(p)
	
		if `i' == 1 {
		matrix M2 = (0\0\0\0\(`medC')\(`seC')\0\(`pvalAC')\0)
		matrix rownames M2 = meanA seA meanB seB meanC seC p-value_AB p-value_AC p-value_BC
		}
	
		else {
		matrix S = (0\0\0\0\(`medC')\(`seC')\0\(`pvalAC')\0)
		matrix M2 = M2,S
		}
		
	local i = `i' +1
	}


local a = 2
local b = 3
local i = 1

foreach var in frauen prof postdocs nawi studhk SPI SPII SPIII SPIV SPV verw datm bib presse sek {
	display "`var'"
	ttest `var' if treatment==`a' | treatment==`b' , by( treatment) unequal 
	return list
	local pvalBC =  r(p)
	
		if `i' == 1 {
		matrix M3 = (0\0\0\0\0\0\0\0\ (`pvalBC'))
		matrix rownames M3 = meanA seA meanB seB meanC seC p-value_AB p-value_AC p-value_BC
		}
	
		else {
		matrix S = (0\0\0\0\0\0\0\0\(`pvalBC'))
		matrix M3 = M3,S	
		}
		
	local i = `i' +1
	}

*matrix list M 
*matrix list M2 
*matrix list M3

matrix M = M + M2 + M3

matrix colnames M = "`:variable label frauen'" "`:variable label prof'" "`:variable label postdocs'" "`:variable label nawi'" "`:variable label studhk'" "`:variable label SPI'" "`:variable label SPII'" "`:variable label SPIII'" "`:variable label SPIV'" "`:variable label SPV'" "`:variable label verw'" "`:variable label datm'" "`:variable label bib'" "`:variable label presse'" "`:variable label sek'"

matrix rownames M = "Treatment 1: Mean" "Std err" "Treatment 2: Mean" "Std err" "Treatment 3: Mean" "Std err" "Two-sided t-test p-values: 1=2"  "1=3" "2=3"

matrix list M 

putexcel set "../Output/summerparty_table7.xlsx", replace

putexcel A1 = matrix(M), names 

