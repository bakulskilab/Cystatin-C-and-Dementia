% Cesar Higgins - Measures of Interaction in the Additive Scale Cystatin-C Models Expert Classification 

	
	use "/Users/cesarhiggins/Documents/Dementia project /NIH grant/Data/Model_Data_CysC_Expert_ForSTATA.dta", clear 
		
	tab cysc_race
	recode cysc_race (1=3) (2=2) (3=1) (4=0), gen(int_final)
	tab int_final
	
	tab cysc_h
	recode cysc_h (1=3) (2=2) (3=1) (4=0), gen(int_final_h)
	tab int_final_h

# Poisson Models 

## Unadjusted AA Models 

	xi: poisson expert_dem i.int_final, irr vce(robust) cformat(%9.1f)
	
	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/, cformat(%9.1f)

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/, cformat(%9.1f)

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/, cformat(%9.1f)

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/, cformat(%9.1f)

# Adjusted AA Models for Socio-Economic Factor 

## Model for Dementia 

	xi: poisson expert_dem i.int_final i.gender i.edu c.age, irr vce(robust) cformat(%9.1f)
	
	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/, cformat(%9.1f)

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/, cformat(%9.1f)

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/, cformat(%9.1f)

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/, cformat(%9.1f)


# Adjusted AA Models for Socio-Economic Factors + Behavioral 

## Model for Dementia 

	xi: poisson expert_dem i.int_final i.gender i.edu c.age c.alcohol i.smoke c.bmi, irr vce(robust) cformat(%9.1f)
	
	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/, cformat(%9.1f)

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/, cformat(%9.1f)

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/, cformat(%9.1f)

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/, cformat(%9.1f)



# Adjusted AA Models for Socio-Economic Factors + Behavioral + biomarkers 

	
## Model for Dementia 
	
	xi: poisson expert_dem i.int_final i.gender i.edu c.age c.alcohol i.smoking c.bmi i.hbp c.baseline_tc_hdl c.baseline_a1c, irr vce(robust) cformat(%9.1f)

	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/, cformat(%9.1f)

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/, cformat(%9.1f)

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/, cformat(%9.1f)

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/, cformat(%9.1f)

	
# Poisson Models 

## Unadjusted Hispanics Models 

	xi: poisson expert_dem i.int_final_h, irr vce(robust) cformat(%9.1f)
	
	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/, cformat(%9.1f)

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/, cformat(%9.1f)

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/, cformat(%9.1f)

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/, cformat(%9.1f)

# Adjusted Hispanics Models for Socio-Economic Factor 

## Model for Dementia 

	xi: poisson expert_dem i.int_final_h i.gender i.edu c.age, irr vce(robust) cformat(%9.1f)
	
	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/, cformat(%9.1f)

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/, cformat(%9.1f)

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/, cformat(%9.1f)

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/, cformat(%9.1f)


# Adjusted Hispanics Models for Socio-Economic Factors + Behavioral 

## Model for Dementia 

	xi: poisson expert_dem i.int_final_h i.gender i.edu c.age c.alcohol i.smoking c.bmi, irr vce(robust) cformat(%9.1f)
	
	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/, cformat(%9.1f)

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/, cformat(%9.1f)

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/, cformat(%9.1f)

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/, cformat(%9.1f)

# Adjusted Hispanic Models for Socio-Economic Factors + Behavioral + biomarkers 

	
## Model for Dementia 
	
	xi: poisson expert_dem i.int_final_h i.gender i.edu c.age c.alcohol i.smoking c.bmi i.hbp c.baseline_tc_hdl c.baseline_a1c, irr vce(robust) cformat(%9.1f)

	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/, cformat(%9.1f)

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/, cformat(%9.1f)

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/, cformat(%9.1f)

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/, cformat(%9.1f)

	

# Models for AA Dementia to Word 
		
	xi: poisson expert_dem i.int_final, irr vce(robust) cformat(%9.1f)
	eststo model1_aa_expert
	
	xi: poisson expert_dem i.int_final i.gender i.edu c.age, irr vce(robust) cformat(%9.1f)
	eststo model2_aa_expert 
	
	xi: poisson expert_dem i.int_final i.gender i.edu c.age c.alcohol i.smoking c.bmi, irr vce(robust) cformat(%9.1f)
	eststo model3_aa_expert
	
	xi: poisson expert_dem i.int_final i.gender i.edu c.age c.alcohol i.smoking c.bmi i.hbp c.baseline_tc_hdl c.baseline_a1c, irr vce(robust) cformat(%9.1f)
	eststo model4_aa_expert
	
	lab var _Iint_final_1 "White-NH & High CysC" 
	lab var _Iint_final_2 "Black-NH & Low CysC"
	lab var _Iint_final_3 "Black-NH & High CysC"
	lab var _Igender_2 "Male"
	lab var _Iedu_2 "College/Some" 
	lab var _Iedu_3 "HS or <" 
	lab var _Ismoking_1 "Former"
	lab var _Ismoking_2 "Never"
	lab var _Ihbp_1 "Yes HBP"
	lab var expert_dem "Dementia"
	
	esttab model1_aa_expert model2_aa_expert model3_aa_expert model4_aa_expert using dementia_expert.rtf, replace eform ci obslast  b(%9.1f) t(%9.2f) wide ///
	label nonumber title("Expert Dementia Models") mtitle("Unadjusted" "Demographic" "Behavioral" "Biomarker")
	
	eststo clear 
	
# Models for Hispanics Dementia to Word 
		
	xi: poisson expert_dem i.int_final_h, irr vce(robust) cformat(%9.1f)
	eststo model1_h_expert
	
	xi: poisson expert_dem i.int_final_h i.gender i.edu c.age, irr vce(robust) cformat(%9.1f)
	eststo model2_h_expert 
	
	xi: poisson expert_dem i.int_final_h i.gender i.edu c.age c.alcohol i.smoking c.bmi, irr vce(robust) cformat(%9.1f)
	eststo model3_h_expert
	
	xi: poisson expert_dem i.int_final_h i.gender i.edu c.age c.alcohol i.smoking c.bmi i.hbp c.baseline_tc_hdl c.baseline_a1c, irr vce(robust) cformat(%9.1f)
	eststo model4_h_expert
	
	lab var _Iint_final_1 "White-NH & High CysC" 
	lab var _Iint_final_2 "Hispanic & Low CysC"
	lab var _Iint_final_3 "Hispanic & High CysC"
	lab var _Igender_2 "Male"
	lab var _Iedu_2 "College/Some" 
	lab var _Iedu_3 "HS or <" 
	lab var _Ismoking_1 "Former"
	lab var _Ismoking_2 "Never"
	lab var _Ihbp_1 "Yes HBP"
	lab var expert_dem "Dementia"
	
	esttab model1_h_expert model2_h_expert model3_h_expert model4_h_expert using dementia_expert.rtf, append eform ci obslast  b(%9.1f) t(%9.2f) wide ///
	label nonumber title("Expert Dementia Models") mtitle("Unadjusted" "Demographic" "Behavioral" "Biomarker")
	
	eststo clear 
	
	
	
