gen Contrmon=0
replace Contrmon=Contribution if Contribution!=.
replace Contrmon=Contribution+10 if Büffet==1

gen Contribution_d=(Contribution>0)

lab var trdona "Wording treatment"
label define l_trdona 0 "Donation" 1 "Contribution"
lab values trdona l_trdona 
lab var tr10 "Treatment with suggested amount"
label define l_tr10 0 "EUR10 suggestion" 1 "EUR20 suggestion"
lab values tr10  l_tr10
lab var frauen "Female"
lab var prof "Professor"
lab var postdocs "Postdoc"
lab var nawi "PhD student"
lab var studhk "Student research assistant"
lab var verw "Administration"
lab var SPI "Faculty I"
lab var SPII "Faculty II"
lab var SPIII "Faculty III"
lab var SPIV "Faculty IV"
lab var SPV "Faculty V"
lab var datm "IT"
lab var bib "Library"
lab var presse "Press unit"
lab var sek "Secretaries"
lab var frauen "Female"
lab var sumv "Administrative staff"
