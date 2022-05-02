****** Figure 2 Number of contributors by day ******

use "../Data/figure2.dta", clear

gen day_new = 35 - Day

set obs 22

replace dummy = 0 if Day == .

replace day_new = 2 in 16 
replace day_new = 3 in 17 
replace day_new = 9 in 18 
replace day_new = 10 in 19 
replace day_new = 16 in 20 
replace day_new = 17 in 21 
replace day_new = 18 in 22 

twoway bar dummy day_new, barwidth(0.7) bcolor(gs8) ///
xline(2.5, lwidth(10) lpattern(shortdash) lcolor(gs14) noextend) ///
xline(9.5, lwidth(10) lpattern(shortdash) lcolor(gs14) noextend) ///
xline(16.5, lwidth(10) lpattern(shortdash) lcolor(gs14) noextend) ///
xline(21.5, lwidth(0.7) lcolor(black) noextend) text(25 21.1 "First Email", color(black) orient(vertical)) ///
xline(15.5, lwidth(0.7) lcolor(black) noextend) text(25 15.1 "Reminder", color(black) orient(vertical)) ///
xline(13.5, lwidth(0.7) lcolor(black) noextend) text(25 13.1 "Reminder", color(black) orient(vertical)) ///
xline(12.5, lwidth(0.7) lcolor(green) noextend) text(25 12.1 "Bonus End", color(green) orient(vertical)) ///
xline(6.5, lwidth(0.7) lcolor(black) noextend) text(25 6.1 "Reminder", color(black) orient(vertical)) ///
xline(0, lwidth(0.7) lcolor(blue) noextend) text(25 -0.4 "Party", color(blue) orient(vertical)) ///
ysc(range(0 45)) xsc(reverse) xlabel(22(1)0) title("") ytitle("Figure 2 Number of contributors by day") xtitle("Days to Party")

graph export "../Output/summerparty_figure2.png", replace

