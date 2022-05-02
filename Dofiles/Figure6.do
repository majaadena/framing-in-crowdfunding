****** Figure 6 Frequency of different gift values by donation/contribution frame and different suggestions ******

use  "../Data/summerparty.dta", clear

gen Contrmon=0
replace Contrmon=Contribution if Contribution!=.
replace Contrmon=Contribution+10 if Büffet==1
replace Contrmon=25 if Contrmon>25
replace Contrmon=5 if Contrmon==6

replace Contribution=5 if Contribution==6
replace Contribution=25 if Contribution>25

label define Contributionl 5 "{c 0128}5-6" 10 "{c 0128}10" 15 "{c 0128}15" 20 "{c 0128}20" 25 "{c 0128}25+"
label values Contribution Contributionl
label values Contrmon Contributionl

//Panel A: only monetary gifts
*** 10 & Donation ***
graph bar (sum) contrdum if tr10==0 & trdona==1 & Contribution>0,  over( Contribution) title("10 suggestion + donation") ///
bar(1, color(teal)) ytitle("Number of gifts") ylabel(0(5)15) ///
text(13 27 "<= Suggested" 13.5 32 "amount", orient(vertical) size(small))
graph save "../Output/10don.gph", replace
	
*** 20 & Donation ***
graph bar (sum) contrdum if tr10==1 & trdona==1 & Contribution>0,  over( Contribution) title("20 suggestion + donation") ///
bar(1, color(teal)) ytitle("Number of gifts") ylabel(0(5)15) ///
text(7.5 69 "<= Suggested" 8.2 74 "amount", orient(vertical) size(small))
graph save "../Output/20don.gph", replace

*** 10 & Contribution ***
graph bar (sum) contrdum if tr10==0 & trdona==0 & Contribution>0,  over( Contribution) title("10 suggestion + contribution") ///
bar(1, color(teal)) ytitle("") ylabel(0(5)15) ytitle("") ///
text(12 26 "<= Suggested" 12.5 31 "amount", orient(vertical) size(small))
graph save "../Output/10con.gph", replace

preserve
drop if Contribution==0
*** 20 & Contribution ***
graph bar (sum) contrdum if tr10==1 & trdona==0 & Contribution>0,  over( Contribution) title("20 suggestion + contribution") allc ///
bar(1, color(teal)) ytitle("") ylabel(0(5)15) ///
text(7.2 70 "<= Suggested" 7.7 75 "amount", orient(vertical) size(small))
graph save "../Output/20con.gph", replace
restore 


graph combine "../Output/10don.gph" "../Output/10con.gph " "../Output/20don.gph" "../Output/20con.gph", ycommon xcommon
graph export "../Output/summerparty_figure6_panelA.png", replace


//Panel B: including buffet pledges monetized at €10
*** 10 & Donation ***
graph bar (sum) contrdum if tr10==0 & trdona==1 & Contrmon>0,  over( Contrmon) title("10 suggestion + donation") ///
bar(1, color(teal)) ytitle("Number of gifts") ylabel(0(5)15) ///
text(12 27 "<= Suggested" 12.5 32 "amount", orient(vertical) size(small))
graph save "../Output/b10don.gph", replace
	
*** 20 & Donation ***
graph bar (sum) contrdum if tr10==1 & trdona==1 & Contrmon>0,  over( Contrmon) title("20 suggestion + donation") ///
bar(1, color(teal)) ytitle("Number of gifts") ylabel(0(5)15) ///
text(11.2 69 "<= Suggested" 11.7 74 "amount", orient(vertical) size(small))
graph save "../Output/b20don.gph", replace

*** 10 & Contribution ***
graph bar (sum) contrdum if tr10==0 & trdona==0 & Contrmon>0,  over( Contrmon) title("10 suggestion + contribution") ///
bar(1, color(teal)) ytitle("") ylabel(0(5)15) ///
text(12.8 27 "<= Suggested" 13.3 32 "amount", orient(vertical) size(small))
graph save "../Output/b10con.gph", replace

preserve
drop if Contribution==0
*** 20 & Contribution ***
graph bar (sum) contrdum if tr10==1 & trdona==0 & Contrmon>0,  over( Contrmon) title("20 suggestion + contribution") allc ///
bar(1, color(teal)) ytitle("") ylabel(0(5)15) ///
text(11 70 "<= Suggested" 11.5 75 "amount", orient(vertical) size(small))
graph save "../Output/b20con.gph", replace
restore 


graph combine "../Output/b10don.gph" "../Output/b10con.gph " "../Output/b20don.gph" "../Output/b20con.gph", ycommon xcommon
graph export "../Output/summerparty_figure6_panelB.png", replace
