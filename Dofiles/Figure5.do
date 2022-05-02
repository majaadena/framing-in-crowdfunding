****** Figure 5 Fisherian randomization inference test for the treatment effect estimated in Table 2, Column I ******

use  "../Data/summerparty.dta", clear 
	
gen Contrmon=Contribution
replace Contrmon=Contrmon+10 if Büffet==1 & Contrmon!=.
replace Contrmon=10 if Büffet==1 & Contrmon==.
	
ritest trdona _b[trdona], reps(5000) kdensityplot seed(123) saving("ritestdonvallt.dta", replace): areg Contrmon trdona nawi postdocs SPI SPII SPIII SPIV verw edv datm bib presse frauen studhk, vce(robust) a(z4)

preserve
use "../Data/ritestdonvallt.dta", clear
hist _pm_1, bin(100) xline(  1.625273 ) xtitle("") xlabel(-2 (0.5) 2)
graph save Graph "../Output/randomization_inference_contrmon.gph", replace
restore

ritest trdona _b[trdona], reps(5000) kdensityplot seed(123) saving("../Data/ritestdonvallt.dta", replace) : areg Contribution trdona nawi postdocs SPI SPII SPIII SPIV verw edv datm bib presse frauen studhk,  vce(robust) a(z4)

preserve
use "../Data/ritestdonvallt.dta", clear
hist _pm_1, bin(100) xline(1.553164 ) xtitle("") xlabel(-2 (0.5) 2)
graph save Graph "../Output/randomization_inference_contr.gph", replace
restore

