#!/usr/bin/perl

sub getchoicerisk

{

local(%RelativeRisks) = @_;

open(risk_table, "ChoiceRisks.txt");


    
    $riskline = <risk_table>;  #eat header line

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Smoking_Self_Male_Lung_Cancer_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Smoking_Self_Male_Lung_Cancer_1_14'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Smoking_Self_Male_Lung_Cancer___15'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Smoking_Self_Male_Heart_Diseases_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Smoking_Self_Male_Heart_Diseases_1_14'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Smoking_Self_Male_Heart_Diseases___15'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Smoking_Self_Male_Stroke_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Smoking_Self_Male_Stroke_1_14'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Smoking_Self_Male_Stroke___15'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Smoking_Self_Female_Lung_Cancer_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Smoking_Self_Female_Lung_Cancer_1_14'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Smoking_Self_Female_Lung_Cancer___15'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Smoking_Self_Female_Heart_Diseases_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Smoking_Self_Female_Heart_Diseases_1_14'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Smoking_Self_Female_Heart_Diseases___15'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Smoking_Self_Female_Stroke_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Smoking_Self_Female_Stroke_1_14'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Smoking_Self_Female_Stroke___15'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Smoking_Spouse_Male_Lung_Cancer_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Smoking_Spouse_Male_Lung_Cancer_1_19'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Smoking_Spouse_Male_Lung_Cancer___20'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Smoking_Spouse_Female_Lung_Cancer_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Smoking_Spouse_Female_Lung_Cancer_1_14'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Smoking_Spouse_Female_Lung_Cancer_15_19'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Smoking_Spouse_Female_Lung_Cancer___20'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Male_Cirrhosis_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Male_Cirrhosis_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Male_Cirrhosis_2'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Male_Cirrhosis_3'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Male_Cirrhosis_4'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Male_Alcohol_Related_Cancers_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Male_Alcohol_Related_Cancers_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Male_Alcohol_Related_Cancers_2'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Male_Alcohol_Related_Cancers_3'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Male_Alcohol_Related_Cancers_4'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Male_Heart_Diseases_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Male_Heart_Diseases_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Male_Heart_Diseases_2'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Male_Heart_Diseases_3'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Male_Heart_Diseases_4'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Male_Stroke_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Male_Stroke_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Male_Stroke_2'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Male_Stroke_3'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Male_Stroke_4'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Female_Cirrhosis_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Female_Cirrhosis_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Female_Cirrhosis_2'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Female_Cirrhosis_3'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Female_Cirrhosis_4'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Female_Alcohol_Related_Cancers_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Female_Alcohol_Related_Cancers_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Female_Alcohol_Related_Cancers_2'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Female_Alcohol_Related_Cancers_3'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Female_Alcohol_Related_Cancers_4'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Female_Heart_Diseases_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Female_Heart_Diseases_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Female_Heart_Diseases_2'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Female_Heart_Diseases_3'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Female_Heart_Diseases_4'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Female_Stroke_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Female_Stroke_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Female_Stroke_2'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Female_Stroke_3'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Alcohol_Female_Stroke_4'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Driving_Male___19'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Driving_Male_20_34'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Driving_Male_35_54'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Driving_Male_55_64'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Driving_Male___65'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Driving_Female___19'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Driving_Female_20_34'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Driving_Female_35_54'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Driving_Female_55_64'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Driving_Female___65'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Driving_Belt_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Driving_Belt_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Driving_Speed_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Driving_Speed_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Driving_Alcohol_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Driving_Alcohol_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Stress_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Stress_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Stress_2'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Stress___3'} = $riskwords[1];

$riskline = <risk_table>;
# Gun Possession

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Exercise_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Exercise_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Exercise_2'} = $riskwords[1];

for ($i = 0; $i < 11; $i++) {
$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Occupation_Accidents'}[$i] = $riskwords[1];
}

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Occupation_Class_Heart_Diseases_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Occupation_Class_Heart_Diseases_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Occupation_Class_Heart_Diseases_2'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Occupation_Class_Heart_Diseases_3'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Occupation_Class_Cancer_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Occupation_Class_Cancer_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Occupation_Class_Cancer_2'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Occupation_Class_Cancer_3'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Nutrition_Male_0_2'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Nutrition_Male_3'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Nutrition_Male_4'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Nutrition_Male_5'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Nutrition_Female_0_2'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Nutrition_Female_3'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Nutrition_Female_4'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Nutrition_Female_5'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Fat_Intake_Cancer_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Fat_Intake_Cancer_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Fat_Intake_Heart_Diseases_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Fat_Intake_Heart_Diseases_1'} = $riskwords[1];

$riskline = <risk_table>;
# Salt Intake


$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Depression_Male_Suicide_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Depression_Male_Suicide_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Depression_Female_Suicide_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Depression_Female_Suicide_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Depression_Heart_Diseases_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Depression_Heart_Diseases_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Depression_Stroke_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Depression_Stroke_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sexual_Male_AIDS_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sexual_Male_AIDS_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sexual_Female_AIDS_0'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sexual_Female_AIDS_1'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Heart_Diseases__4'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Heart_Diseases_4_4_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Heart_Diseases_5_5_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Heart_Diseases_6_6_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Heart_Diseases_7_7_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Heart_Diseases_8_8_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Heart_Diseases_9_9_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Heart_Diseases___10'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Stroke__4'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Stroke_4_4_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Stroke_5_5_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Stroke_6_6_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Stroke_7_7_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Stroke_8_8_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Stroke_9_9_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Stroke___10'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Cancer__4'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Cancer_4_4_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Cancer_5_5_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Cancer_6_6_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Cancer_7_7_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Cancer_8_8_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Cancer_9_9_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Cancer___10'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Suicide__4'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Suicide_4_4_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Suicide_5_5_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Suicide_6_6_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Suicide_7_7_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Suicide_8_8_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Suicide_9_9_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Male_Suicide___10'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Heart_Diseases__4'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Heart_Diseases_4_4_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Heart_Diseases_5_5_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Heart_Diseases_6_6_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Heart_Diseases_7_7_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Heart_Diseases_8_8_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Heart_Diseases_9_9_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Heart_Diseases___10'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Stroke__4'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Stroke_4_4_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Stroke_5_5_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Stroke_6_6_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Stroke_7_7_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Stroke_8_8_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Stroke_9_9_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Stroke___10'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Cancer__4'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Cancer_4_4_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Cancer_5_5_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Cancer_6_6_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Cancer_7_7_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Cancer_8_8_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Cancer_9_9_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Cancer___10'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Suicide__4'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Suicide_4_4_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Suicide_5_5_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Suicide_6_6_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Suicide_7_7_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Suicide_8_8_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Suicide_9_9_9'} = $riskwords[1];

$riskline = <risk_table>;
@riskwords = split (/\s+/, $riskline);
$RelativeRisks{'Sleep_Female_Suicide___10'} = $riskwords[1];



return %RelativeRisks;

};
1

