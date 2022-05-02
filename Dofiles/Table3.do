****** Table 3 Treatment effect on revenue and accounting for potential outliers ******

use  "../Data/summerparty.dta", clear

do "labeling.do"

cap drop Contrmon
gen Contrmon=Contribution
replace Contrmon=Contrmon+10 if Büffet==1 & Contrmon!=.
replace Contrmon=10 if Büffet==1 & Contrmon==.

eststo clear
eststo:areg Contribution trdona nawi postdocs SPI SPII SPIII SPIV verw edv datm bib presse frauen studhk if Contribution<100, vce(robust) a(z4)
eststo:areg Contribution trdona nawi postdocs SPI SPII SPIII SPIV verw edv datm bib presse frauen studhk if Contribution<50, vce(robust) a(z4)

eststo: areg Contribution trdona nawi postdocs SPI SPII SPIII SPIV verw edv datm bib presse frauen studhk , vce(robust) a(z4)
replace Contribution=Contribution-10 if Contribution==100
eststo: areg Contribution trdona nawi postdocs SPI SPII SPIII SPIV verw edv datm bib presse frauen studhk , vce(robust) a(z4)
replace Contribution=Contribution-10 if Contribution==90
eststo: areg Contribution trdona nawi postdocs SPI SPII SPIII SPIV verw edv datm bib presse frauen studhk , vce(robust) a(z4)
replace Contribution=Contribution-10 if Contribution==80
eststo: areg Contribution trdona nawi postdocs SPI SPII SPIII SPIV verw edv datm bib presse frauen studhk , vce(robust) a(z4)
replace Contribution=Contribution-10 if Contribution==70
eststo: areg Contribution trdona nawi postdocs SPI SPII SPIII SPIV verw edv datm bib presse frauen studhk , vce(robust) a(z4)
replace Contribution=Contribution-10 if Contribution==60
eststo: areg Contribution trdona nawi postdocs SPI SPII SPIII SPIV verw edv datm bib presse frauen studhk , vce(robust) a(z4)
replace Contribution=Contribution-10 if Contribution==50
eststo: areg Contribution trdona nawi postdocs SPI SPII SPIII SPIV verw edv datm bib presse frauen studhk , vce(robust) a(z4)
replace Contribution=Contribution-10 if Contribution==40
eststo: areg Contribution trdona nawi postdocs SPI SPII SPIII SPIV verw edv datm bib presse frauen studhk , vce(robust) a(z4)

esttab using "../Output/summerparty_table3_panelA.rtf", ///
		 b(%8.3f) replace compress label title("Table 3 Treatment effect on revenue and accounting for potential outliers, Panel A: only monetary gifts") onecell nogap ///
		nonumbers star(* 0.10 ** 0.05 *** 0.01 ) se r2 keep(trdona) /// 
		mtitles ("drop 100" "drop 50+" "100" "90" "80" "70" "60" "50" "40" "30" ) note("Robust errors.")


eststo clear
eststo: areg Contrmon trdona nawi postdocs SPI SPII SPIII SPIV verw edv datm bib presse frauen studhk if Contrmon<100, vce(robust) a(z4)
eststo:areg Contrmon trdona nawi postdocs SPI SPII SPIII SPIV verw edv datm bib presse frauen studhk if Contrmon<50, vce(robust) a(z4)

eststo: areg Contrmon trdona nawi postdocs SPI SPII SPIII SPIV verw edv datm bib presse frauen studhk , vce(robust) a(z4)
replace Contrmon=Contrmon-10 if Contrmon==100
eststo: areg Contrmon trdona nawi postdocs SPI SPII SPIII SPIV verw edv datm bib presse frauen studhk , vce(robust) a(z4)
replace Contrmon=Contrmon-10 if Contrmon==90
eststo: areg Contrmon trdona nawi postdocs SPI SPII SPIII SPIV verw edv datm bib presse frauen studhk , vce(robust) a(z4)
replace Contrmon=Contrmon-10 if Contrmon==80
eststo: areg Contrmon trdona nawi postdocs SPI SPII SPIII SPIV verw edv datm bib presse frauen studhk , vce(robust) a(z4)
replace Contrmon=Contrmon-10 if Contrmon==70
eststo: areg Contrmon trdona nawi postdocs SPI SPII SPIII SPIV verw edv datm bib presse frauen studhk , vce(robust) a(z4)
replace Contrmon=Contrmon-10 if Contrmon==60
eststo: areg Contrmon trdona nawi postdocs SPI SPII SPIII SPIV verw edv datm bib presse frauen studhk , vce(robust) a(z4)
replace Contrmon=Contrmon-10 if Contrmon==50
eststo: areg Contrmon trdona nawi postdocs SPI SPII SPIII SPIV verw edv datm bib presse frauen studhk , vce(robust) a(z4)
replace Contrmon=Contrmon-10 if Contrmon==40
eststo: areg Contrmon trdona nawi postdocs SPI SPII SPIII SPIV verw edv datm bib presse frauen studhk , vce(robust) a(z4)

esttab using "../Output/summerparty_table3_panelB.rtf", ///
		 b(%8.3f) replace compress label title("Table 3 Treatment effect on revenue and accounting for potential outliers, Panel B: including buffet pledges monetized at 10") onecell nogap ///
		nonumbers star(* 0.10 ** 0.05 *** 0.01 ) se r2 keep(trdona) /// 
		mtitles ("drop 100" "drop 50+" "100" "90" "80" "70" "60" "50" "40" "30" ) note("Robust errors.")
	
	
	
