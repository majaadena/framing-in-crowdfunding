****** Table 6 Results of the MTurk experiment ******

use "../Data/mturk_data.dta", clear


cap drop trcontr
gen trcontr=ZumTestenGeneraterandomgrou-1

gen negativityindex=Fear+Disgust+Disappointment+Contempt+Shame+Hate+Regret+Anger+Guilt

egen negativityindexstd=std(negativityindex)

egen giftstd=std(gift)

gen trcontr_negativityindexstd=trcontr*negativityindexstd


eststo clear

eststo: reg giftstd trcontr, robust 
eststo: reg negativityindexstd trcontr, robust 
eststo: reg giftstd negativityindexstd trcontr trcontr_negativityindexstd, robust 

esttab using "../Output/Mturk_table6.rtf", ///
	   b(%8.3f)  replace compress   label title ("Table 6 Results of the MTurk experiment") onecell nogap ///
	   nonumbers star(* 0.10 ** 0.05 *** 0.01 ) se r2  /// 
	   mtitles ("Gifts, standardized (I)" "Sum of negative emotions, standardized (II)" "Gifts, standardized (III)") note("Note: Robust errors.")

