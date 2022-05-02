****** Figure 1 ‘Donations’ versus ‘contributions’ on the GEW ******

use "../Data/mturk_data.dta", clear


foreach var in Amusement Pride Relief Contentment Fear Contempt Admiration Disappointment Joy Disgust Anger Compassion Sadness Shame Guilt Love Interest Hate Pleasure Regret Howmuchdoyouthinkthatthe {
egen `var'std=std(`var')
replace `var'=`var'std
}

order Interest Amusement Pride Joy Pleasure Contentment Love Admiration Relief Compassion Sadness Guilt ///
	  Regret Shame Disappointment Fear Disgust Contempt Hate Anger

collapse (mean) Interest Amusement Pride Joy Pleasure Contentment Love Admiration Relief Compassion Sadness Guilt ///
				Regret Shame Disappointment Fear Disgust Contempt Hate Anger, by(trcontr) 

xpose, clear varname

rename _varname trcontr
rename v1 contribution
rename v2 donation
drop if trcontr=="trcontr"

radar trcontr donation contribution, lc(red green) lp(dash solid) lw(thick thick) legend(region(style(none))pos(6)) note("") r(-0.5 -0.2 0 0.2) scheme(s2mono) aspectratio(1) scale(0.7) axelw("0.4") graphregion(margin(vlarge)) graphregion(color(white)) plotregion(color(white)) text(-0.95 -0 "Low control/power", color(black) box margin("2 2 2 2") fcolor(white)) text(1 -0 "High control/power", color(black) box margin("2 2 2 2") fcolor(white)) text(0 1.4  "Positive valence", color(black) orient(vertical) box margin("2 2 2 2") fcolor(white)) text(0 -1.4  "Negative valence", color(black) orient(vertical) box margin("2 2 2 2")  fcolor(white))

