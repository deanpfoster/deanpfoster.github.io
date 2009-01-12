#!/usr/bin/perl

sub getdemographicsrisk

{

local(%RelativeRisks) = @_;

open(risk_table, "DemographicsRisks.txt");


    $riskline = <risk_table>;  #eat header line
    $riskline = <risk_table>;  #eat age
    $riskline = <risk_table>;  #eat sex
 

		
$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Height_Male_Stroke'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Height_Male_Heart_Diseases'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Height_Male_Cancer'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Height_Female_Stroke'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Height_Female_Heart_Diseases'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Height_Female_Cancer'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Weight_Male_Heart_Diseases___65_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Weight_Male_Heart_Diseases___65_2'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Weight_Male_Heart_Diseases___65_3'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Weight_Male_Heart_Diseases___65_4'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Weight_Male_Heart_Diseases__65_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Weight_Male_Heart_Diseases__65_2'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Weight_Male_Heart_Diseases__65_3'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Weight_Male_Heart_Diseases__65_4'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Weight_Male_Cancer_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Weight_Male_Cancer_2'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Weight_Male_Cancer_3'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Weight_Male_Cancer_4'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Weight_Female_Heart_Diseases_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Weight_Female_Heart_Diseases_2'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Weight_Female_Heart_Diseases_3'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Weight_Female_Heart_Diseases_4'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Weight_Female_Cancer_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Weight_Female_Cancer_2'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Weight_Female_Cancer_3'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Weight_Female_Cancer_4'} = $riskwords[1];

$riskline = <risk_table>;
# Race

$riskline = <risk_table>;
# Income


$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Education_Male_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Education_Male_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Education_Male_2'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Education_Female_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Education_Female_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Education_Female_2'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Male_Rich__55_Heart_Diseases_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Male_Rich__55_Heart_Diseases_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Male_Rich___55_Heart_Diseases_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Male_Rich___55_Heart_Diseases_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Male_Rich__55_Cancer_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Male_Rich__55_Cancer_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Male_Rich___55_Cancer_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Male_Rich___55_Cancer_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Male_Poor__55_Heart_Diseases_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Male_Poor__55_Heart_Diseases_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Male_Poor___55_Heart_Diseases_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Male_Poor___55_Heart_Diseases_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Male_Poor__55_Cancer_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Male_Poor__55_Cancer_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Male_Poor___55_Cancer_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Male_Poor___55_Cancer_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Female_Rich__55_Heart_Diseases_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Female_Rich__55_Heart_Diseases_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Female_Rich___55_Heart_Diseases_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Female_Rich___55_Heart_Diseases_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Female_Rich__55_Cancer_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Female_Rich__55_Cancer_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Female_Rich___55_Cancer_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Female_Rich___55_Cancer_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Female_Poor__55_Heart_Diseases_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Female_Poor__55_Heart_Diseases_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Female_Poor___55_Heart_Diseases_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Female_Poor___55_Heart_Diseases_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Female_Poor__55_Cancer_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Female_Poor__55_Cancer_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Female_Poor___55_Cancer_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Marital_Status_Female_Poor___55_Cancer_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Fitness_Male_Heart_Diseases_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Fitness_Male_Heart_Diseases_1_2'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Fitness_Male_Heart_Diseases_3_4'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Fitness_Male_Cancer_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Fitness_Male_Cancer_1_2'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Fitness_Male_Cancer_3_4'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Fitness_Female_Heart_Diseases_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Fitness_Female_Heart_Diseases_1_2'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Fitness_Female_Heart_Diseases_3_4'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Fitness_Female_Cancer_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Fitness_Female_Cancer_1_2'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Fitness_Female_Cancer_3_4'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Family_History_of_Heart_Diseases_Male__60_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Family_History_of_Heart_Diseases_Male__60_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Family_History_of_Heart_Diseases_Male___60_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Family_History_of_Heart_Diseases_Male___60_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Family_History_of_Cancer_Male_Prostate_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Family_History_of_Cancer_Male_Prostate_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Family_History_of_Cancer_Female_Breast_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Family_History_of_Cancer_Female_Breast_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Family_History_of_Cancer_Female_Breast_0_Ovary '} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Family_History_of_Cancer_Female_Breast_1_Ovary '} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Family_History_of_Cancer_Female_Colorectal_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Family_History_of_Cancer_Female_Colorectal_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Family_History_of_Cancer_Female_Stomach_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Family_History_of_Cancer_Female_Stomach_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Family_History_of_Cancer_Female_Stomach_0_Ovary '} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Family_History_of_Cancer_Female_Stomach_1_Ovary'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Family_History_of_Cancer_Female_Lung_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Family_History_of_Cancer_Female_Lung_1'} = $riskwords[1];

$riskline = <risk_table>;
# Family_History_of_$RelativeRisks{'Asthma

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Family_History_of_Diabetes_White_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Family_History_of_Diabetes_White_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Family_History_of_Diabetes_White___2'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Family_History_of_Diabetes_Non_White_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Family_History_of_Diabetes_Non_White_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Family_History_of_Diabetes_Non_White___2'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Family_History_of_Stroke_Female_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Family_History_of_Stroke_Female_1'} = $riskwords[1];


for ($i = 1; $i < 52; $i++) {
$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Geography_Homicide'}[$i] = $riskwords[1];
}

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'AIDS_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'AIDS_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'AIDS_White_suicide_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'AIDS_White_suicide_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'AIDS_Black_suicide_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'AIDS_Black_suicide_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'AIDS_Treatment_AZT_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'AIDS_Treatment_AZT_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'AIDS_Treatment_PCP_Prophylaxis_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'AIDS_Treatment_PCP_Prophylaxis_1'} = $riskwords[1];

$riskline = <risk_table>;
# Cancer


$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Asthma_COPD_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Asthma_COPD_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Asthma_Heart_Diseases_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Asthma_Heart_Diseases_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Asthma_Lung_Cancer_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Asthma_Lung_Cancer_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Diabetes_Male_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Diabetes_Male_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Diabetes_Female_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Diabetes_Female_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Diabetes_Male_Colorectal_Cancer_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Diabetes_Male_Colorectal_Cancer_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Diabetes_Female_Colorectal_Cancer_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Diabetes_Female_Colorectal_Cancer_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Diabetes_Male_Pancreas_Cancer_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Diabetes_Male_Pancreas_Cancer_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Diabetes_Female_Pancreas_Cancer_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Diabetes_Female_Pancreas_Cancer_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Diabetes_Male_Heart_Diseases_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Diabetes_Male_Heart_Diseases_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Diabetes_Female_Heart_Diseases_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Diabetes_Female_Heart_Diseases_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Diabetes_Male_Stroke_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Diabetes_Male_Stroke_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Diabetes_Female_Stroke_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Diabetes_Female_Stroke_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Diabetes_Male_Influenza_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Diabetes_Male_Influenza_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Diabetes_Female_Influenza_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Diabetes_Female_Influenza_1'} = $riskwords[1];

$riskline = <risk_table>;
# Heart_Diseases

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Blood_Pressure_Heart_Diseases__80'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Blood_Pressure_Heart_Diseases_80_89'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Blood_Pressure_Heart_Diseases_90_94'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline); 
$RelativeRisks{'Blood_Pressure_Heart_Diseases_95_104'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Blood_Pressure_Heart_Diseases___105'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Blood_Pressure_Male_Stroke__80'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Blood_Pressure_Male_Stroke_80_84'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Blood_Pressure_Male_Stroke_85_89'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Blood_Pressure_Male_Stroke_90_94'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Blood_Pressure_Male_Stroke_95_99'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Blood_Pressure_Male_Stroke_100_104'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Blood_Pressure_Male_Stroke_105_109'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Blood_Pressure_Male_Stroke___110'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Blood_Pressure_Female_Stroke__80'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Blood_Pressure_Female_Stroke_80_84'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Blood_Pressure_Female_Stroke_85_89'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Blood_Pressure_Female_Stroke_90_94'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Blood_Pressure_Female_Stroke_95_99'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Blood_Pressure_Female_Stroke_100_104'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Blood_Pressure_Female_Stroke_105_109'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Blood_Pressure_Female_Stroke___110'} = $riskwords[1];



return (%RelativeRisks);

};
1

