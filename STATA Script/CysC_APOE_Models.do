% Cesar Higgins - Measures of Interaction in the Additive Scale Cystatin-C Models 

	use "/Users/cesarhiggins/Documents/Dementia project /NIH grant/Data/Model_Data_CysC_APOE_ForSTATA.dta", clear
	
	tab cysc_race
	recode cysc_race (1=3) (2=2) (3=1) (4=0), gen(int_final)
	tab int_final
	
	tab cysc_h
	recode cysc_h (1=3) (2=2) (3=1) (4=0), gen(int_final_h)
	tab int_final_h

# Poisson Models 
	
# Adjusted AA Models for Socio-Economic Factors + APOE-e4
	

	## Model for Dementia AAs

	xi: poisson demdx_ff i.int_final i.gender i.edu c.age  i.APOE2010_bin, irr vce(robust) cformat(%9.1f)

	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/, cformat(%9.1f)

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/, cformat(%9.1f)

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/, cformat(%9.1f)

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/, cformat(%9.1f)
		

## Model for Dementia Hispanics 

	xi: poisson demdx_ff i.int_final_h i.gender i.edu c.age i.APOE2010_bin, irr vce(robust) cformat(%9.1f)
	
	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/, cformat(%9.1f)

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/, cformat(%9.1f)

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/, cformat(%9.1f)

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/, cformat(%9.1f)
	


## Exporting models to Word 


Models for AA Dementia to word 
	
	
	xi: poisson demdx_ff i.int_final i.gender i.edu c.age i.APOE2010_bin, irr vce(robust) cformat(%9.1f)
	
	eststo model_aa_apoe4

	lab var _Iint_final_1 "White-NH & High CysC" 
	lab var _Iint_final_2 "Black-NH & Low CysC"
	lab var _Iint_final_3 "Black-NH & High CysC"
	lab var _Igender_2 "Male"
	lab var _Iedu_2 "College/Some" 
	lab var _Iedu_3 "HS or <" 
	lab var demdx_ff "Dementia"
	lab var APOE2010_bin "Any APOE-e4"
	
	esttab model_aa_apoe4 using cysc_apoe.rtf, replace eform ci obslast b(%9.1f) t(%9.2f) wide ///
	label nonumber title("Models for Dementia") mtitle("Biomarker Blacks-NH Model")

# Adjusted Hispanic Models for Socio-Economic Factors + Behavioral + biomarkers 
	
Models for Hispanics Dementia to word 
		
	xi: poisson demdx_ff i.int_final_h i.gender i.edu c.age i.APOE2010_bin, irr vce(robust) cformat(%9.1f) 
	eststo model_h_apoe4
	
	lab var _Iint_final_1 "White-NH & High CysC" 
	lab var _Iint_final_2 "Hispanic & Low CysC"
	lab var _Iint_final_3 "Hispanic & High CysC"
	lab var _Igender_2 "Male"
	lab var _Iedu_2 "College/Some" 
	lab var _Iedu_3 "HS or <" 
	lab var demdx_ff "Dementia"
	lab var APOE2010_bin "Any APOE-e4"
	
	esttab model_h_apoe4 using cysc_apoe.rtf, append eform ci obslast b(%9.1f) t(%9.2f) wide ///
	label nonumber title("Models for Dementia") mtitle("Biomarker Hispanics Model")

	eststo clear 
	

	
# MEDIATION DECOMPOSITION for African Americans 

	xi: poisson demdx_ff i.int_final i.gender i.edu c.age i.APOE2010_bin, irr vce(robust) cformat(%9.1f)

	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/, cformat(%9.1f)

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/, cformat(%9.1f)

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/, cformat(%9.1f)

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/, cformat(%9.1f)

	
*med4way demfinal dicho_race_f cysc_high_2 gender_2 educ age , yreg(poisson) mreg(logistic) a0(0) a1(1) m(0) fulloutput


Need to estimate the probability of the mediator given the exposure  $Pr(M=1|S=0)$ in our case the exposure (A) is race 

	tab gender 
	recode gender (2=0) (1=1), gen(gender_2)
	tab gender_2
	
	tab cysc_cat_75, nolabel 
	recode cysc_cat_75 (2=1) (1=0), gen(cysc_75)
	tab cysc_75
	
	summarize age if demdx_ff!=.
	
	logit cysc_75 i.dicho_race gender_2 ib(3).edu age i.APOE2010_bin if demdx_ff!=., or vce(robust) cformat(%9.2f)
	
	margins dicho_race, at(gender_2=1 edu=3 age=67.3 APOE2010_bin=0) 
	
	gen pm=.183499
	
	gen med=.2253077-.183499 

	
	xi: poisson demdx_ff i.int_final i.gender ib(3).edu c.age i.APOE2010_bin, irr cformat(%9.2f)
	
	
## CDE 

	nlcom exp(_b[_Iint_final_2]) - 1, cformat(%9.2f)
	
## INT reference 

	nlcom ([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*pm, cformat(%9.2f)
	
## INT mediation
	
	nlcom ([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*med, cformat(%9.2f)
	
## PIE 

	nlcom (exp(_b[_Iint_final_1]) - 1)*med, cformat(%9.2f)

## TOTAL EFFECT 

	nlcom (exp(_b[_Iint_final_2]) - 1+([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*pm+([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*med+(exp(_b[_Iint_final_1]) - 1)*med), cformat(%9.2f)


# Calculating the proportion mediated 

## PA-CDE 

	nlcom (exp(_b[_Iint_final_2]) - 1)/(exp(_b[_Iint_final_2]) - 1+([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*pm+([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*med+(exp(_b[_Iint_final_1]) - 1)*med), cformat(%9.2f)

## PA-INT reference 

	nlcom ([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*pm / (([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*pm+(exp(_b[_Iint_final_2]) - 1)+([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*med+(exp(_b[_Iint_final_1]) - 1)*med), cformat(%9.2f)
	
## PA-INT med 

	nlcom ([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*med / (([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*med+(exp(_b[_Iint_final_2]) - 1)+([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*pm+(exp(_b[_Iint_final_1]) - 1)*med), cformat(%9.2f)


## PA-PIE 

	nlcom (exp(_b[_Iint_final_1]) - 1)*med / ((exp(_b[_Iint_final_1]) - 1)*med+([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*med+([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*pm+(exp(_b[_Iint_final_2]) - 1)), cformat(%9.2f)

## Portion-Mediated 

	nlcom ([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*med / (([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*med+(exp(_b[_Iint_final_2]) - 1)+([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*pm+(exp(_b[_Iint_final_1]) - 1)*med) + (exp(_b[_Iint_final_1]) - 1)*med / ((exp(_b[_Iint_final_1]) - 1)*med+([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*med+([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*pm+(exp(_b[_Iint_final_2]) - 1)), cformat(%9.2f)

## Portion-Due to Interaction 	
	
	nlcom (([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*med / (([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*med+(exp(_b[_Iint_final_2]) - 1)+([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*pm+(exp(_b[_Iint_final_1]) - 1)*med)) + ///
	(([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*pm / (([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*pm+(exp(_b[_Iint_final_2]) - 1)+([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*med+(exp(_b[_Iint_final_1]) - 1)*med)), cformat(%9.2f)



# Mediation Decomposition for Hispanics 

	xi: poisson demdx_ff i.int_final_h i.gender ib(3).edu c.age i.APOE2010_bin , irr vce(robust) cformat(%9.1f)
	
	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/
	
Need to estimate the probability of the mediator given the exposure  $Pr(M=1|S=0)$ in our case the exposure (A) is race hispanics 

	logit cysc_75 i.dicho_race_h gender_2 ib(3).edu age APOE2010_bin if demdx_ff!=., or
	
	margins dicho_race_h, at(gender_2=1 edu=3 age=67.43) 
	
	drop pm med
	gen pm=.1869775
	
	gen med=.1732966-.1869775

	xi: poisson demdx_ff i.int_final_h i.gender ib(3).edu c.age i.APOE2010_bin, irr cformat(%9.2f)
	
	
## CDE 

	nlcom exp(_b[_Iint_final_2]) - 1, cformat(%9.2f)
	
## INT reference 

	nlcom ([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*pm, cformat(%9.2f)
	
## INT mediation
	
	nlcom ([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*med, cformat(%9.2f)
	
## PIE 

	nlcom (exp(_b[_Iint_final_1]) - 1)*med, cformat(%9.2f)

## TOTAL EFFECT 

	nlcom (exp(_b[_Iint_final_2]) - 1+([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*pm+([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*med+(exp(_b[_Iint_final_1]) - 1)*med), cformat(%9.2f)


# Calculating the proportion mediated 

## PA-CDE 

	nlcom (exp(_b[_Iint_final_2]) - 1)/(exp(_b[_Iint_final_2]) - 1+([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*pm+([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*med+(exp(_b[_Iint_final_1]) - 1)*med), cformat(%9.2f)

## PA-INT reference 

	nlcom ([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*pm / (([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*pm+(exp(_b[_Iint_final_2]) - 1)+([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*med+(exp(_b[_Iint_final_1]) - 1)*med), cformat(%9.2f)
	
## PA-INT med 

	nlcom ([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*med / (([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*med+(exp(_b[_Iint_final_2]) - 1)+([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*pm+(exp(_b[_Iint_final_1]) - 1)*med), cformat(%9.2f)


## PA-PIE 

	nlcom (exp(_b[_Iint_final_1]) - 1)*med / ((exp(_b[_Iint_final_1]) - 1)*med+([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*med+([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*pm+(exp(_b[_Iint_final_2]) - 1)), cformat(%9.2f)

## Portion-Mediated 

	nlcom ([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*med / (([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*med+(exp(_b[_Iint_final_2]) - 1)+([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*pm+(exp(_b[_Iint_final_1]) - 1)*med) + (exp(_b[_Iint_final_1]) - 1)*med / ((exp(_b[_Iint_final_1]) - 1)*med+([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*med+([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*pm+(exp(_b[_Iint_final_2]) - 1)), cformat(%9.2f)

## Portion-Due to Interaction 	
	
	nlcom (([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*med / (([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*med+(exp(_b[_Iint_final_2]) - 1)+([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*pm+(exp(_b[_Iint_final_1]) - 1)*med)) + ///
	(([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*pm / (([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*pm+(exp(_b[_Iint_final_2]) - 1)+([exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1)*med+(exp(_b[_Iint_final_1]) - 1)*med)), cformat(%9.2f)


