% Cesar Higgins - Measures of Interaction in the Additive Scale Cystatin-C Models 

	use "/Users/cesarhiggins/Documents/Dementia project /NIH grant/Data/Model_Data_CysC_ForSTATA.dta", clear
	
	tab cysc_race
	recode cysc_race (1=3) (2=2) (3=1) (4=0), gen(int_final)
	tab int_final
	
	tab cysc_h
	recode cysc_h (1=3) (2=2) (3=1) (4=0), gen(int_final_h)
	tab int_final_h

# Poisson Models 

## Unadjusted AA Models 

	quietly xi: poisson demdx_ff i.int_final, irr vce(robust) cformat(%9.1f)
	
	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/, cformat(%9.1f)

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/, cformat(%9.1f)

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/, cformat(%9.1f)

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/, cformat(%9.1f)
	
## Model for CIND 

	xi: poisson cinddx_f i.int_final, irr vce(robust) cformat(%9.1f)
	
	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/
	

# Adjusted AA Models for Socio-Economic Factor 

## Model for Dementia 

	quietly xi: poisson demdx_ff i.int_final i.gender i.edu c.age, irr vce(robust) cformat(%9.1f)
	
	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/, cformat(%9.1f)

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/, cformat(%9.1f)

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/, cformat(%9.1f)

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/, cformat(%9.1f)
	

## Model for CIND

	xi: poisson cinddx_f i.int_final i.gender i.edu c.age, irr vce(robust) cformat(%9.2f)
	
	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/
	

# Adjusted AA Models for Socio-Economic Factors + Behavioral 

## Model for Dementia 

	xi: poisson demdx_ff i.int_final i.gender i.edu c.age c.alcohol i.smoke c.bmi, irr vce(robust) cformat(%9.1f)
	
	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/, cformat(%9.1f)

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/, cformat(%9.1f)

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/, cformat(%9.1f)

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/, cformat(%9.1f)
	

## Model for CIND

	xi: poisson cinddx_f i.int_final i.gender i.edu c.age c.alcohol i.smoke c.bmi, irr vce(robust) cformat(%9.2f)
	
	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/
	
	
# Adjusted AA Models for Socio-Economic Factors + Behavioral + biomarkers 
	

## Model for Dementia 

	xi: poisson demdx_ff i.int_final i.gender i.edu c.age c.alcohol i.smoke c.bmi i.hbpf c.baseline_tc_hdl c.baseline_a1c, irr vce(robust) cformat(%9.1f)

	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/, cformat(%9.1f)

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/, cformat(%9.1f)

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/, cformat(%9.1f)

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/, cformat(%9.1f)
	

## Model for CIND

	xi: poisson cinddx_f i.int_final i.gender i.edu c.age c.alcohol i.smoke c.bmi i.hbpf c.baseline_tc_hdl c.baseline_a1c, irr vce(robust) cformat(%9.2f)
	
	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/
	
	
## Exporting models to Word 


Models for AA Dementia to word 
		
	xi: poisson demdx_ff i.int_final, irr vce(robust) cformat(%9.2f)
	eststo model1_aa
	
	xi: poisson demdx_ff i.int_final i.gender i.edu c.age, irr vce(robust) cformat(%9.2f)
	eststo model2_aa 
	
	xi: poisson demdx_ff i.int_final i.gender i.edu c.age c.alcohol i.smoke c.bmi, irr vce(robust) cformat(%9.2f)
	eststo model3_aa
	
	xi: poisson demdx_ff i.int_final i.gender i.edu c.age c.alcohol i.smoke c.bmi i.hbpf c.baseline_tc_hdl c.baseline_a1c, irr vce(robust) cformat(%9.2f)
	eststo model4_aa
	

	lab var _Iint_final_1 "White-NH & High CysC" 
	lab var _Iint_final_2 "Black-NH & Low CysC"
	lab var _Iint_final_3 "Black-NH & High CysC"
	lab var _Igender_2 "Male"
	lab var _Iedu_2 "College/Some" 
	lab var _Iedu_3 "HS or <" 
	lab var _Ismoke_2 "Former"
	lab var _Ismoke_3 "Never"
	lab var _Ihbpf_2 "Yes HBP"
	lab var demdx_ff "Dementia"
	
	esttab model1_aa model2_aa model3_aa model4_aa using dementia_aa.rtf, replace eform ci obslast scalar(F) b(%9.1f) t(%9.2f) wide ///
	label nonumber title("Models for Dementia") mtitle("Unadjusted" "Demographic" "Behavioral" "Biomarker")
	
	eststo clear 
	
Models for AA CIND to word 
	

	
	xi: poisson cinddx_f i.int_final, irr vce(robust) cformat(%9.2f)
	eststo model1_cind_aa
	
	xi: poisson cinddx_f i.int_final i.gender i.edu c.age, irr vce(robust) cformat(%9.2f)
	eststo model2_cind_aa
	
	xi: poisson cinddx_f i.int_final i.gender i.edu c.age c.alcohol i.smoke c.bmi, irr vce(robust) cformat(%9.2f)
	eststo model3_cind_aa
	
	xi: poisson cinddx_f i.int_final i.gender i.edu c.age c.alcohol i.smoke c.bmi i.hbpf c.baseline_tc_hdl c.baseline_a1c, irr vce(robust) cformat(%9.2f)
	eststo model4_cind_aa

	lab var cinddx_f "CIND"
	lab var _Iint_final_1 "White-NH & High CysC" 
	lab var _Iint_final_2 "Black-NH & Low CysC"
	lab var _Iint_final_3 "Black-NH & High CysC"
	lab var _Igender_2 "Male"
	lab var _Iedu_2 "College/Some" 
	lab var _Iedu_3 "HS or <" 
	lab var _Ismoke_2 "Former"
	lab var _Ismoke_3 "Never"
	lab var _Ihbpf_2 "Yes HBP"
	
	
	esttab model1_cind_aa model2_cind_aa model3_cind_aa model4_cind_aa using cind_aa.rtf, replace eform ci obslast scalar(F) b(%9.1f) t(%9.2f) wide ///
	label nonumber title("Models for CIND") mtitle("Unadjusted" "Demographic" "Behavioral" "Biomarker")
	
	eststo clear 
	
	
# Unadjusted Models for Hispanics 

## Model for Dementia 

	xi: poisson demdx_ff i.int_final_h, irr vce(robust) cformat(%9.1f)
	
	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/, cformat(%9.1f)

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/, cformat(%9.1f)

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/, cformat(%9.1f)

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/, cformat(%9.1f)
	

## Model for CIND 

	xi: poisson cinddx_f i.int_final_h, irr vce(robust) cformat(%9.2f)
	
	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/
	

# Adjusted Hispanic Models for Socio-Economic Factor 

## Model for Dementia 

	xi: poisson demdx_ff i.int_final_h i.gender i.edu c.age, irr vce(robust) cformat(%9.1f)
	
	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/, cformat(%9.1f)

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/, cformat(%9.1f)

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/, cformat(%9.1f)

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/, cformat(%9.1f)
	

## Model for CIND

	xi: poisson cinddx_f i.int_final_h i.gender i.edu c.age, irr vce(robust) cformat(%9.2f)
	
	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/
	

# Adjusted Hispanic Models for Socio-Economic Factors + Behavioral 

## Model for Dementia 

	xi: poisson demdx_ff i.int_final_h i.gender i.edu c.age c.alcohol i.smoke c.bmi, irr vce(robust) cformat(%9.1f)
	
	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/, cformat(%9.1f)

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/, cformat(%9.1f)

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/, cformat(%9.1f)

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/, cformat(%9.1f)
	

## Model for CIND

	xi: poisson cinddx_f i.int_final_h i.gender i.edu c.age c.alcohol i.smoke c.bmi, irr vce(robust) cformat(%9.2f)
	
	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/
	


# Adjusted Hispanic Models for Socio-Economic Factors + Behavioral + biomarkers 
	

## Model for Dementia 

	xi: poisson demdx_ff i.int_final_h i.gender i.edu c.age c.alcohol i.smoke c.bmi i.hbpf c.baseline_tc_hdl c.baseline_a1c, irr vce(robust) cformat(%9.1f)
	
	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/, cformat(%9.1f)

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/, cformat(%9.1f)

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/, cformat(%9.1f)

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/, cformat(%9.1f)
	

## Model for CIND

	xi: poisson cinddx_f i.int_final_h i.gender i.edu c.age c.alcohol i.smoke c.bmi i.hbpf c.baseline_tc_hdl c.baseline_a1c, irr vce(robust) cformat(%9.2f)
	
	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/
	
	
## Exporting models to Word 


Models for Hispanics Dementia to word 
		
	xi: poisson demdx_ff i.int_final_h, irr vce(robust) cformat(%9.2f)
	eststo model1_h
	
	xi: poisson demdx_ff i.int_final_h i.gender i.edu c.age, irr vce(robust) cformat(%9.2f)
	eststo model2_h 
	
	xi: poisson demdx_ff i.int_final_h i.gender i.edu c.age c.alcohol i.smoke c.bmi, irr vce(robust) cformat(%9.2f)
	eststo model3_h
	
	xi: poisson demdx_ff i.int_final_h i.gender i.edu c.age c.alcohol i.smoke c.bmi i.hbpf c.baseline_tc_hdl c.baseline_a1c, irr vce(robust) cformat(%9.2f)
	eststo model4_h
	

	lab var _Iint_final_1 "White-NH & High CysC" 
	lab var _Iint_final_2 "Hispanic & Low CysC"
	lab var _Iint_final_3 "Hispanic & High CysC"
	lab var _Igender_2 "Male"
	lab var _Iedu_2 "College/Some" 
	lab var _Iedu_3 "HS or <" 
	lab var _Ismoke_2 "Former"
	lab var _Ismoke_3 "Never"
	lab var _Ihbpf_2 "Yes HBP"
	lab var demdx_ff "Dementia"
	
	esttab model1_h model2_h model3_h model4_h using dementia_h.rtf, replace eform ci obslast scalar(F) b(%9.1f) t(%9.2f) wide ///
	label nonumber title("Models for Dementia") mtitle("Unadjusted" "Demographic" "Behavioral" "Biomarker")
	
	eststo clear 
	

Models for Hispanics CIND to word 
		
	xi: poisson cinddx_f i.int_final_h, irr vce(robust) cformat(%9.2f)
	eststo model1_cind_h
	
	xi: poisson cinddx_f i.int_final_h i.gender i.edu c.age, irr vce(robust) cformat(%9.2f)
	eststo model2_cind_h 
	
	xi: poisson cinddx_f i.int_final_h i.gender i.edu c.age c.alcohol i.smoke c.bmi, irr vce(robust) cformat(%9.2f)
	eststo model3_cind_h
	
	xi: poisson cinddx_f i.int_final_h i.gender i.edu c.age c.alcohol i.smoke c.bmi i.hbpf c.baseline_tc_hdl c.baseline_a1c, irr vce(robust) cformat(%9.2f)
	eststo model4_cind_h

	lab var _Iint_final_1 "White-NH & High CysC" 
	lab var _Iint_final_2 "Hispanic & Low CysC"
	lab var _Iint_final_3 "Hispanic & High CysC"
	lab var _Igender_2 "Male"
	lab var _Iedu_2 "College/Some" 
	lab var _Iedu_3 "HS or <" 
	lab var _Ismoke_2 "Former"
	lab var _Ismoke_3 "Never"
	lab var _Ihbpf_2 "Yes HBP"
	lab var cinddx_f "CIND"
	
	esttab model1_cind_h model2_cind_h model3_cind_h model4_cind_h using cind_h.rtf, replace eform ci obslast scalar(F) b(%9.1f) t(%9.2f) wide ///
	label nonumber title("Models for CIND") mtitle("Unadjusted" "Demographic" "Behavioral" "Biomarker")
	
	eststo clear 

	
	
# MEDIATION DECOMPOSITION for African Americans 

	xi: poisson demdx_ff i.int_final i.gender i.edu c.age, irr vce(robust) cformat(%9.1f)

	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/, cformat(%9.1f)

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/, cformat(%9.1f)

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/, cformat(%9.1f)

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/, cformat(%9.1f)

	
*med4way demdx_ff dicho_race cysc_75 gender_2 edu age , yreg(poisson) mreg(logistic) a0(0) a1(1) m(0) fulloutput /needs to specify levels of covariates/


Need to estimate the probability of the mediator given the exposure  $Pr(M=1|S=0)$ in our case the exposure (A) is race 

	tab gender 
	recode gender (2=0) (1=1), gen(gender_2)
	tab gender_2
	
	tab cysc_cat_75, nolabel 
	recode cysc_cat_75 (2=1) (1=0), gen(cysc_75)
	tab cysc_75
	
	
	logit cysc_75 i.dicho_race gender_2 ib(3).edu age if demdx_ff!=., or vce(robust) cformat(%9.2f)
	
	margins dicho_race, at(gender_2=1 edu=3 age=67.43) 
	
	gen pm=.1918064
	
	gen med=.2283186-.1918064 

	
	xi: poisson demdx_ff i.int_final i.gender ib(3).edu c.age, irr cformat(%9.2f)
	
	
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

	xi: poisson demdx_ff i.int_final_h i.gender ib(3).edu c.age, irr vce(robust) cformat(%9.2f)
	
	nlcom [exp(_b[_Iint_final_3]) - exp(_b[_Iint_final_2]) - exp(_b[_Iint_final_1])] + 1 /*REIR*/

	nlcom exp(_b[_Iint_final_3]*(-1)) - exp(_b[_Iint_final_2] - _b[_Iint_final_3]) - exp(_b[_Iint_final_1] - _b[_Iint_final_3]) + 1 /*AP*/

	nlcom [exp(_b[_Iint_final_3]) - 1]/[exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2] /*SI*/

	nlcom ln([exp(_b[_Iint_final_3]) - 1]) - ln([exp(_b[_Iint_final_2]) + exp(_b[_Iint_final_1]) - 2]) /*SI*/
	
Need to estimate the probability of the mediator given the exposure  $Pr(M=1|S=0)$ in our case the exposure (A) is race hispanics 

	logit cysc_75 i.dicho_race_h gender_2 ib(3).edu age if demdx_ff!=., or
	
	margins dicho_race_h, at(gender_2=1 edu=3 age=67.43) 
	
	drop pm med
	gen pm=.1901706
	
	gen med=.1803492-.1901706

	xi: poisson demdx_ff i.int_final_h i.gender ib(3).edu c.age, irr cformat(%9.2f)
	
	
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


* Create table for prevalence ratios for high Cystatin-C on cognitive status 

## Exporting models to Word 


Models for Overall Race and Dementia to word 
		
	xi: poisson demdx_ff i.cysc_cat_75 , irr vce(robust) cformat(%9.2f)
	eststo model1_over
	
	xi: poisson demdx_ff i.cysc_cat_75 ib(4).race i.gender i.edu c.age, irr vce(robust) cformat(%9.2f)
	eststo model2_over
	
	xi: poisson demdx_ff i.cysc_cat_75 ib(4).race i.gender i.edu c.age c.alcohol i.smoke c.bmi, irr vce(robust) cformat(%9.2f)
	eststo model3_over
	
	xi: poisson demdx_ff i.cysc_cat_75 ib(4).race i.gender i.edu c.age c.alcohol i.smoke c.bmi i.hbpf c.baseline_tc_hdl c.baseline_a1c, irr vce(robust)    cformat(%9.2f)
	eststo model4_over
	
	lab var _Icysc_cat__2 "High CysC"
	lab var _Igender_2 "Male"
	lab var _Iedu_2 "College/Some" 
	lab var _Iedu_3 "HS or <" 
	lab var _Ismoke_2 "Former"
	lab var _Ismoke_3 "Never"
	lab var _Ihbpf_2 "Yes HBP"
	lab var demdx_ff "Dementia"
	
	esttab model1_over model2_over model3_over model4_over using dementia_overall.rtf, replace eform ci obslast scalar(F) b(%9.1f) t(%9.2f) wide ///
	label nonumber title("Models for Dementia") mtitle("Unadjusted" "Demographic" "Behavioral" "Biomarker")
	
	eststo clear 
	
Models for Overall CIND to word 
	
	xi: poisson cinddx_f i.cysc_cat_75, irr vce(robust) cformat(%9.2f)
	eststo model1_cind_over
	
	xi: poisson cinddx_f i.cysc_cat_75 ib(4).race i.gender i.edu c.age, irr vce(robust) cformat(%9.2f)
	eststo model2_cind_over
	
	xi: poisson cinddx_f i.cysc_cat_75 ib(4).race i.gender i.edu c.age c.alcohol i.smoke c.bmi, irr vce(robust) cformat(%9.2f)
	eststo model3_cind_over
	
	xi: poisson cinddx_f i.cysc_cat_75 ib(4).race i.gender i.edu c.age c.alcohol i.smoke c.bmi i.hbpf c.baseline_tc_hdl c.baseline_a1c, irr vce(robust) 	  cformat(%9.2f)
	eststo model4_cind_over

	lab var cinddx_f "CIND"
	lab var _Icysc_cat__2 "High CysC"
	lab var _Igender_2 "Male"
	lab var _Iedu_2 "College/Some" 
	lab var _Iedu_3 "HS or <" 
	lab var _Ismoke_2 "Former"
	lab var _Ismoke_3 "Never"
	lab var _Ihbpf_2 "Yes HBP"
	
	
	esttab model1_cind_over model2_cind_over model3_cind_over model4_cind_over using cind_overall.rtf, replace eform ci obslast scalar(F) b(%9.1f) t(%9.2f) wide ///
	label nonumber title("Models for CIND") mtitle("Unadjusted" "Demographic" "Behavioral" "Biomarker")
	
	eststo clear 
	
* Models for blacks only 

Models for black Race and Dementia to word 
		
	xi: poisson demdx_ff i.cysc_cat_75 if race==1, irr vce(robust) cformat(%9.2f)
	eststo model1_aa_over
	
	xi: poisson demdx_ff i.cysc_cat_75 i.gender i.edu c.age if race==1, irr vce(robust) cformat(%9.2f)
	eststo model2_aa_over
	
	xi: poisson demdx_ff i.cysc_cat_75 i.gender i.edu c.age c.alcohol i.smoke c.bmi if race==1, irr vce(robust) cformat(%9.2f)
	eststo model3_aa_over
	
	xi: poisson demdx_ff i.cysc_cat_75 i.gender i.edu c.age c.alcohol i.smoke c.bmi i.hbpf c.baseline_tc_hdl c.baseline_a1c if race==1, irr vce(robust)    cformat(%9.2f)
	eststo model4_aa_over
	
	lab var _Icysc_cat__2 "High CysC"
	lab var _Igender_2 "Male"
	lab var _Iedu_2 "College/Some" 
	lab var _Iedu_3 "HS or <" 
	lab var _Ismoke_2 "Former"
	lab var _Ismoke_3 "Never"
	lab var _Ihbpf_2 "Yes HBP"
	lab var demdx_ff "Dementia"
	
	esttab model1_aa_over model2_aa_over model3_aa_over model4_aa_over using dementia_aa_overall.rtf, replace eform ci obslast scalar(F) b(%9.1f) t(%9.2f) wide ///
	label nonumber title("Models for Dementia") mtitle("Unadjusted" "Demographic" "Behavioral" "Biomarker")
	
	eststo clear 
	
Models for Black race CIND to word 
	
	xi: poisson cinddx_f i.cysc_cat_75 if race==1, irr vce(robust) cformat(%9.2f)
	eststo model1_cind_aa_over
	
	xi: poisson cinddx_f i.cysc_cat_75 i.gender i.edu c.age if race==1, irr vce(robust) cformat(%9.2f)
	eststo model2_cind_aa_over
	
	xi: poisson cinddx_f i.cysc_cat_75 i.gender i.edu c.age c.alcohol i.smoke c.bmi if race==1, irr vce(robust) cformat(%9.2f)
	eststo model3_cind_aa_over
	
	xi: poisson cinddx_f i.cysc_cat_75 i.gender i.edu c.age c.alcohol i.smoke c.bmi i.hbpf c.baseline_tc_hdl c.baseline_a1c if race==1, irr vce(robust) 	  cformat(%9.2f)
	eststo model4_cind_aa_over

	lab var _Icysc_cat__2 "High CysC"
	lab var _Igender_2 "Male"
	lab var _Iedu_2 "College/Some" 
	lab var _Iedu_3 "HS or <" 
	lab var _Ismoke_2 "Former"
	lab var _Ismoke_3 "Never"
	lab var _Ihbpf_2 "Yes HBP"
	lab var demdx_ff "Dementia"
	
	esttab model1_cind_aa_over model2_cind_aa_over model3_cind_aa_over model4_cind_aa_over using cind_aa_overall.rtf, replace eform ci obslast scalar(F) b(%9.1f) t(%9.2f) wide ///
	label nonumber title("Models for CIND") mtitle("Unadjusted" "Demographic" "Behavioral" "Biomarker")
	
	eststo clear 
	

* Models for Hispanic only 

Models for Hispanic Race and Dementia to word 
		
	xi: poisson demdx_ff i.cysc_cat_75 if race==2, irr vce(robust) cformat(%9.2f)
	eststo model1_h_over
	
	xi: poisson demdx_ff i.cysc_cat_75 i.gender i.edu c.age if race==2, irr vce(robust) cformat(%9.2f)
	eststo model2_h_over
	
	xi: poisson demdx_ff i.cysc_cat_75 i.gender i.edu c.age c.alcohol i.smoke c.bmi if race==2, irr vce(robust) cformat(%9.2f)
	eststo model3_h_over
	
	xi: poisson demdx_ff i.cysc_cat_75 i.gender i.edu c.age c.alcohol i.smoke c.bmi i.hbpf c.baseline_tc_hdl c.baseline_a1c if race==2, irr vce(robust)    cformat(%9.2f)
	eststo model4_h_over
	
	lab var _Icysc_cat__2 "High CysC"
	lab var _Igender_2 "Male"
	lab var _Iedu_2 "College/Some" 
	lab var _Iedu_3 "HS or <" 
	lab var _Ismoke_2 "Former"
	lab var _Ismoke_3 "Never"
	lab var _Ihbpf_2 "Yes HBP"
	lab var demdx_ff "Dementia"
	
	esttab model1_h_over model2_h_over model3_h_over model4_h_over using dementia_h_overall.rtf, replace eform ci obslast scalar(F) b(%9.1f) t(%9.2f) wide ///
	label nonumber title("Models for Dementia") mtitle("Unadjusted" "Demographic" "Behavioral" "Biomarker")
	
	eststo clear 
	
Models for Hispanic race CIND to word 
	
	xi: poisson cinddx_f i.cysc_cat_75 if race==2, irr vce(robust) cformat(%9.2f)
	eststo model1_cind_h_over
	
	xi: poisson cinddx_f i.cysc_cat_75 i.gender i.edu c.age if race==2, irr vce(robust) cformat(%9.2f)
	eststo model2_cind_h_over
	
	xi: poisson cinddx_f i.cysc_cat_75 i.gender i.edu c.age c.alcohol i.smoke c.bmi if race==2, irr vce(robust) cformat(%9.2f)
	eststo model3_cind_h_over
	
	xi: poisson cinddx_f i.cysc_cat_75 i.gender i.edu c.age c.alcohol i.smoke c.bmi i.hbpf c.baseline_tc_hdl c.baseline_a1c if race==2, irr vce(robust) 	  cformat(%9.2f)
	eststo model4_cind_h_over

	lab var _Icysc_cat__2 "High CysC"
	lab var _Igender_2 "Male"
	lab var _Iedu_2 "College/Some" 
	lab var _Iedu_3 "HS or <" 
	lab var _Ismoke_2 "Former"
	lab var _Ismoke_3 "Never"
	lab var _Ihbpf_2 "Yes HBP"
	lab var demdx_ff "Dementia"
	
	esttab model1_cind_h_over model2_cind_h_over model3_cind_h_over model4_cind_h_over using cind_h_overall.rtf, replace eform ci obslast scalar(F) b(%9.1f) t(%9.2f) wide ///
	label nonumber title("Models for CIND") mtitle("Unadjusted" "Demographic" "Behavioral" "Biomarker")
	
	eststo clear 
	
* Models for Whites 

Models for Whites Race and Dementia to word 
		
	xi: poisson demdx_ff i.cysc_cat_75 if race==4, irr vce(robust) cformat(%9.2f)
	eststo model1_w_over
	
	xi: poisson demdx_ff i.cysc_cat_75 i.gender i.edu c.age if race==4, irr vce(robust) cformat(%9.2f)
	eststo model2_w_over
	
	xi: poisson demdx_ff i.cysc_cat_75 i.gender i.edu c.age c.alcohol i.smoke c.bmi if race==4, irr vce(robust) cformat(%9.2f)
	eststo model3_w_over
	
	xi: poisson demdx_ff i.cysc_cat_75 i.gender i.edu c.age c.alcohol i.smoke c.bmi i.hbpf c.baseline_tc_hdl c.baseline_a1c if race==4, irr vce(robust)    cformat(%9.2f)
	eststo model4_w_over
	
	lab var _Icysc_cat__2 "High CysC"
	lab var _Igender_2 "Male"
	lab var _Iedu_2 "College/Some" 
	lab var _Iedu_3 "HS or <" 
	lab var _Ismoke_2 "Former"
	lab var _Ismoke_3 "Never"
	lab var _Ihbpf_2 "Yes HBP"
	lab var demdx_ff "Dementia"
	
	esttab model1_w_over model2_w_over model3_w_over model4_w_over using dementia_w_overall.rtf, replace eform ci obslast scalar(F) b(%9.1f) t(%9.2f) wide ///
	label nonumber title("Models for Dementia") mtitle("Unadjusted" "Demographic" "Behavioral" "Biomarker")
	
	eststo clear 
	
Models for Whites race CIND to word 
	
	xi: poisson cinddx_f i.cysc_cat_75 if race==4, irr vce(robust) cformat(%9.2f)
	eststo model1_cind_w_over
	
	xi: poisson cinddx_f i.cysc_cat_75 i.gender i.edu c.age if race==4, irr vce(robust) cformat(%9.2f)
	eststo model2_cind_w_over
	
	xi: poisson cinddx_f i.cysc_cat_75 i.gender i.edu c.age c.alcohol i.smoke c.bmi if race==4, irr vce(robust) cformat(%9.2f)
	eststo model3_cind_w_over
	
	xi: poisson cinddx_f i.cysc_cat_75 i.gender i.edu c.age c.alcohol i.smoke c.bmi i.hbpf c.baseline_tc_hdl c.baseline_a1c if race==4, irr vce(robust) 	  cformat(%9.2f)
	eststo model4_cind_w_over

	lab var _Icysc_cat__2 "High CysC"
	lab var _Igender_2 "Male"
	lab var _Iedu_2 "College/Some" 
	lab var _Iedu_3 "HS or <" 
	lab var _Ismoke_2 "Former"
	lab var _Ismoke_3 "Never"
	lab var _Ihbpf_2 "Yes HBP"
	lab var demdx_ff "Dementia"
	
	esttab model1_cind_w_over model2_cind_w_over model3_cind_w_over model4_cind_w_over using cind_w_overall.rtf, replace eform ci obslast scalar(F) b(%9.1f) t(%9.2f) wide ///
	label nonumber title("Models for CIND") mtitle("Unadjusted" "Demographic" "Behavioral" "Biomarker")
	
	eststo clear 
	