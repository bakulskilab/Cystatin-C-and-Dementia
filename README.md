# Cystatin-C and Prevalent Dementia Mediation-Interaction Decomposition Analysis

## Title: Decomposing Interaction and Mediating Effects of Race/Ethnicity and Circulating Cystatin C on Cognitive Status in the United States Health and Retirement Study

## Citation Information


This Github repository contains the data management and analytic scripts to produce the following manuscript:[Decomposing Interaction and Mediating Effects of Race/Ethnicity and Circulating Cystatin C on Cognitive Status in the United States Health and Retirement Study](https://www.medrxiv.org/content/10.1101/2022.09.09.22279743v1)

## Abstract

Background and objectives: Elevated circulating cystatin C is associated with cognitive impairment in non-Hispanic Whites, but its role in racial disparities in dementia is understudied. In a nationally representative sample of older non-Hispanic White, non-Hispanic Black, and Hispanic adults in the United States, we use mediation-interaction analysis to understand how racial disparities in the cystatin C physiological pathway may contribute to racial disparities in prevalent dementia.

Methods: In a pooled cross-sectional sample of the Health and Retirement Study (n=9,921), we employed Poisson regression to estimate prevalence ratios and to test the relationship between elevated cystatin C (>1.24mg/L versus <1.24mg/L) and impaired cognition, adjusted for demographics, behavioral risk factors, and other biomarkers. Self-reported racialized social categories were a proxy measure for exposure to racism. We calculated additive interaction measures and conducted four-way mediation-interaction decomposition analysis to test the moderating effect of race/ethnicity and mediating effect of cystatin C on the racial disparity.

Results: Overall, elevated cystatin C was associated with dementia (prevalence ratio [PR] = 1.4; 95%CI: 1.2, 1.8). Among non-Hispanic Black relative to non-Hispanic White participants, the relative excess risk due to interaction was 1.7 (95% CI: -0.2, 3.7), the attributable proportion was 0.2 (95%CI: 0.0, 0.5), and the synergy index was 1.4 (95% CI: 1.0, 2.0) in a fully-adjusted model. Elevated cystatin C was estimated to account for 2% (95% CI: -0%, 4%) for the racial disparity in prevalent dementia, and the interaction accounted for 9% (95% CI: -4%, 23%). Analyses for Hispanic relative to non-White participants suggested moderation by race/ethnicity, but not mediation.

Discussion: Elevated cystatin C was associated with dementia prevalence. Our mediation-interaction decomposition analysis suggested that the effect of elevated cystatin C on the racial disparity might be moderated by race/ethnicity, which indicates that the racialization process affects not only the distribution of circulating cystatin C across minoritized racial groups, but also the strength of association between the biomarker and dementia prevalence. These results provide evidence that cystatin C is associated with adverse brain health and this effect is larger than expected for individuals racialized as minorities had they been racialized and treated as non-Hispanic White.

## Funding
This work was supported by the National Institutes of Health (grant numbers R01 AG055406, R01 AG067592, 3R01 AG067592-01S1, P30 AG072931). The Health and Retirement Study is sponsored by the National Institute on Aging (U01 AG009740) and is conducted at the Institute for Social Research, University of Michigan. CH was supported by 3R01 AG067592-01S1 and the University of Michigan Rackham Merit Fellowship program.

## Content

This repo contains the R script used for data management, and data analysis of the manuscript. We used STATA for our main models and analysis of measures of interaction in the additive scale, and mediation-interaction decomposition analysis. We built our own code in STATA to calculate measures of interaction in the additive scale and the mediation-interaction decomposition analysis. We decided not rely on existing packages (i.e., STATA med4way: https://pubmed.ncbi.nlm.nih.gov/30452641/) because this package does not accommodate for certain specification of our model. For example, the robust variance estimation option for poisson regression analysis. We do not provide the HRS data. But, Health and Retirement Study survey data are publicly available (https://hrs.isr.umich.edu/data-products), and genetic data are available through dbGaP (https://dbgap.ncbi.nlm.nih.gov; phs000428.v2.p2)
Original Article

A preprint version of this article can be found at medRxiv (https://medrxiv.org/cgi/content/short/2022.09.09.22279743v1)

## Script Files

