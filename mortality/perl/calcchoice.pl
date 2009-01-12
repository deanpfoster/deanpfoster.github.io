#!/usr/local/bin/perl

sub calcchoice

{

local (@YourRisks) = @_;





for ($i = 0; $i < 120; $i++) { 
    $AllScale[$i] = 1;
    $CancerScale[$i] = 1;

};



# Smoking Variable


if($YourProfile{'YourSex'} == 0) {
    for ($i = 0; $i < 120; $i++) { 
        if($YourProfile{'YourSmoking'} == 0) {
                $YourRisks[$i]{'Your_Table_Lung'} = $YourRisks[$i]{'Your_Table_Lung'} * $RelativeRisks{'Smoking_Self_Male_Lung_Cancer_0'}; 
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Smoking_Self_Male_Heart_Diseases_0'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Smoking_Self_Male_Stroke_0'}; 
                	  if($YourProfile{'YourSpouseSmoking'} == 0) {
                        $YourRisks[$i]{'Your_Table_Lung'} = $YourRisks[$i]{'Your_Table_Lung'} * $RelativeRisks{'Smoking_Spouse_Male_Lung_Cancer_0'}; }
                    elsif(($YourProfile{'YourSpouseSmoking'} >= 1) and ($YourProfile{'YourSpouseSmoking'} <= 19)) {
                        $YourRisks[$i]{'Your_Table_Lung'} = $YourRisks[$i]{'Your_Table_Lung'} * $RelativeRisks{'Smoking_Spouse_Male_Lung_Cancer_1_19'}; }
                    elsif($YourProfile{'YourSpouseSmoking'} >= 20) {
                        $YourRisks[$i]{'Your_Table_Lung'} = $YourRisks[$i]{'Your_Table_Lung'} * $RelativeRisks{'Smoking_Spouse_Male_Lung_Cancer___20'}; }
         }
	   elsif(($YourProfile{'YourSmoking'} >= 1) and ($YourProfile{'YourSmoking'} <= 14)) {
                $YourRisks[$i]{'Your_Table_Lung'} = $YourRisks[$i]{'Your_Table_Lung'} * $RelativeRisks{'Smoking_Self_Male_Lung_Cancer_1_14'}; 
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Smoking_Self_Male_Heart_Diseases_1_14'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Smoking_Self_Male_Stroke_1_14'}; }
	   elsif($YourProfile{'YourSmoking'} >= 15) {
                $YourRisks[$i]{'Your_Table_Lung'} = $YourRisks[$i]{'Your_Table_Lung'} * $RelativeRisks{'Smoking_Self_Male_Lung_Cancer___15'}; 
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Smoking_Self_Male_Heart_Diseases___15'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Smoking_Self_Male_Stroke___15'}; }
     }
}


if($YourProfile{'YourSex'} == 1) {
    for ($i = 0; $i < 120; $i++) { 
        if($YourProfile{'YourSmoking'} == 0) {
                $YourRisks[$i]{'Your_Table_Lung'} = $YourRisks[$i]{'Your_Table_Lung'} * $RelativeRisks{'Smoking_Self_Female_Lung_Cancer_0'}; 
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Smoking_Self_Female_Heart_Diseases_0'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Smoking_Self_Female_Stroke_0'}; 
                	  if($YourProfile{'YourSpouseSmoking'} == 0) {
                        $YourRisks[$i]{'Your_Table_Lung'} = $YourRisks[$i]{'Your_Table_Lung'} * $RelativeRisks{'Smoking_Spouse_Female_Lung_Cancer_0'}; }
                    elsif(($YourProfile{'YourSpouseSmoking'} >= 1) and ($YourProfile{'YourSpouseSmoking'} <= 19)) {
                        $YourRisks[$i]{'Your_Table_Lung'} = $YourRisks[$i]{'Your_Table_Lung'} * $RelativeRisks{'Smoking_Spouse_Female_Lung_Cancer_1_19'}; }
                    elsif($YourProfile{'YourSpouseSmoking'} >= 20) {
                        $YourRisks[$i]{'Your_Table_Lung'} = $YourRisks[$i]{'Your_Table_Lung'} * $RelativeRisks{'Smoking_Spouse_Female_Lung_Cancer___20'}; }
         }
         elsif(($YourProfile{'YourSmoking'} >= 1) and ($YourProfile{'YourSmoking'} <= 14)) {
                $YourRisks[$i]{'Your_Table_Lung'} = $YourRisks[$i]{'Your_Table_Lung'} * $RelativeRisks{'Smoking_Self_Female_Lung_Cancer_1_14'}; 
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Smoking_Self_Female_Heart_Diseases_1_14'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Smoking_Self_Female_Stroke_1_14'}; }
	   elsif($YourProfile{'YourSmoking'} >= 15) {
                $YourRisks[$i]{'Your_Table_Lung'} = $YourRisks[$i]{'Your_Table_Lung'} * $RelativeRisks{'Smoking_Self_Female_Lung_Cancer___15'}; 
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Smoking_Self_Female_Heart_Diseases___15'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Smoking_Self_Female_Stroke___15'}; }
        
    }
}




# Alcohol Variable


if($YourProfile{'YourSex'} == 0) {
    for ($i = 0; $i < 120; $i++) { 
        if($YourProfile{'YourAlcohol'} == 0) {
                $YourRisks[$i]{'Your_Table_Cirrhosis'} = $YourRisks[$i]{'Your_Table_Cirrhosis'} * $RelativeRisks{'Alcohol_Male_Cirrhosis_0'}; 
                $YourRisks[$i]{'Your_Table_Esophagus__Mouth__Pharynx'} = $YourRisks[$i]{'Your_Table_Esophagus__Mouth__Pharynx'} * $RelativeRisks{'Alcohol_Male_Alcohol_Related_Cancers_0'}; 
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Alcohol_Male_Heart_Diseases_0'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Alcohol_Male_Stroke_0'}; }
        elsif($YourProfile{'YourAlcohol'} == 1) {
                $YourRisks[$i]{'Your_Table_Cirrhosis'} = $YourRisks[$i]{'Your_Table_Cirrhosis'} * $RelativeRisks{'Alcohol_Male_Cirrhosis_1'}; 
                $YourRisks[$i]{'Your_Table_Esophagus__Mouth__Pharynx'} = $YourRisks[$i]{'Your_Table_Esophagus__Mouth__Pharynx'} * $RelativeRisks{'Alcohol_Male_Alcohol_Related_Cancers_1'}; 
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Alcohol_Male_Heart_Diseases_1'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Alcohol_Male_Stroke_1'}; }
 	  elsif($YourProfile{'YourAlcohol'} == 2) {
                $YourRisks[$i]{'Your_Table_Cirrhosis'} = $YourRisks[$i]{'Your_Table_Cirrhosis'} * $RelativeRisks{'Alcohol_Male_Cirrhosis_2'}; 
                $YourRisks[$i]{'Your_Table_Esophagus__Mouth__Pharynx'} = $YourRisks[$i]{'Your_Table_Esophagus__Mouth__Pharynx'} * $RelativeRisks{'Alcohol_Male_Alcohol_Related_Cancers_2'}; 
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Alcohol_Male_Heart_Diseases_2'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Alcohol_Male_Stroke_2'}; }
  elsif($YourProfile{'YourAlcohol'} == 3) {
                $YourRisks[$i]{'Your_Table_Cirrhosis'} = $YourRisks[$i]{'Your_Table_Cirrhosis'} * $RelativeRisks{'Alcohol_Male_Cirrhosis_3'}; 
                $YourRisks[$i]{'Your_Table_Esophagus__Mouth__Pharynx'} = $YourRisks[$i]{'Your_Table_Esophagus__Mouth__Pharynx'} * $RelativeRisks{'Alcohol_Male_Alcohol_Related_Cancers_3'}; 
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Alcohol_Male_Heart_Diseases_3'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Alcohol_Male_Stroke_3'}; }
  elsif($YourProfile{'YourAlcohol'} == 4) {
                $YourRisks[$i]{'Your_Table_Cirrhosis'} = $YourRisks[$i]{'Your_Table_Cirrhosis'} * $RelativeRisks{'Alcohol_Male_Cirrhosis_4'}; 
                $YourRisks[$i]{'Your_Table_Esophagus__Mouth__Pharynx'} = $YourRisks[$i]{'Your_Table_Esophagus__Mouth__Pharynx'} * $RelativeRisks{'Alcohol_Male_Alcohol_Related_Cancers_4'}; 
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Alcohol_Male_Heart_Diseases_4'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Alcohol_Male_Stroke_4'}; }
        
    }
}


if($YourProfile{'YourSex'} == 1) {
    for ($i = 0; $i < 120; $i++) { 
        if($YourProfile{'YourAlcohol'} == 0) {
                $YourRisks[$i]{'Your_Table_Cirrhosis'} = $YourRisks[$i]{'Your_Table_Cirrhosis'} * $RelativeRisks{'Alcohol_Female_Cirrhosis_0'}; 
                $YourRisks[$i]{'Your_Table_Esophagus__Mouth__Pharynx'} = $YourRisks[$i]{'Your_Table_Esophagus__Mouth__Pharynx'} * $RelativeRisks{'Alcohol_Female_Alcohol_Related_Cancers_0'}; 
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Alcohol_Female_Heart_Diseases_0'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Alcohol_Female_Stroke_0'}; }
        elsif($YourProfile{'YourAlcohol'} == 1) {
                $YourRisks[$i]{'Your_Table_Cirrhosis'} = $YourRisks[$i]{'Your_Table_Cirrhosis'} * $RelativeRisks{'Alcohol_Female_Cirrhosis_1'}; 
                $YourRisks[$i]{'Your_Table_Esophagus__Mouth__Pharynx'} = $YourRisks[$i]{'Your_Table_Esophagus__Mouth__Pharynx'} * $RelativeRisks{'Alcohol_Female_Alcohol_Related_Cancers_1'}; 
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Alcohol_Female_Heart_Diseases_1'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Alcohol_Female_Stroke_1'}; }
 	  elsif($YourProfile{'YourAlcohol'} == 2) {
                $YourRisks[$i]{'Your_Table_Cirrhosis'} = $YourRisks[$i]{'Your_Table_Cirrhosis'} * $RelativeRisks{'Alcohol_Female_Cirrhosis_2'}; 
                $YourRisks[$i]{'Your_Table_Esophagus__Mouth__Pharynx'} = $YourRisks[$i]{'Your_Table_Esophagus__Mouth__Pharynx'} * $RelativeRisks{'Alcohol_Female_Alcohol_Related_Cancers_2'}; 
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Alcohol_Female_Heart_Diseases_2'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Alcohol_Female_Stroke_2'}; }
  elsif($YourProfile{'YourAlcohol'} == 3) {
                $YourRisks[$i]{'Your_Table_Cirrhosis'} = $YourRisks[$i]{'Your_Table_Cirrhosis'} * $RelativeRisks{'Alcohol_Female_Cirrhosis_3'}; 
                $YourRisks[$i]{'Your_Table_Esophagus__Mouth__Pharynx'} = $YourRisks[$i]{'Your_Table_Esophagus__Mouth__Pharynx'} * $RelativeRisks{'Alcohol_Female_Alcohol_Related_Cancers_3'}; 
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Alcohol_Female_Heart_Diseases_3'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Alcohol_Female_Stroke_3'}; }
  elsif($YourProfile{'YourAlcohol'} == 4) {
                $YourRisks[$i]{'Your_Table_Cirrhosis'} = $YourRisks[$i]{'Your_Table_Cirrhosis'} * $RelativeRisks{'Alcohol_Female_Cirrhosis_4'}; 
                $YourRisks[$i]{'Your_Table_Esophagus__Mouth__Pharynx'} = $YourRisks[$i]{'Your_Table_Esophagus__Mouth__Pharynx'} * $RelativeRisks{'Alcohol_Female_Alcohol_Related_Cancers_4'}; 
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Alcohol_Female_Heart_Diseases_4'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Alcohol_Female_Stroke_4'}; }
        
    }
}


# Driving Variable 


if($YourProfile{'YourDriverSex'} == 0) {
$RelativeRisks{'Driving_Male___19'} = -1*log(1-$YourProfile{'YourDrivingDistance'}*0.000121284);
$RelativeRisks{'Driving_Male_20_34'} = -1*log(1-$YourProfile{'YourDrivingDistance'}*0.000037934);
$RelativeRisks{'Driving_Male_35_54'} = -1*log(1-$YourProfile{'YourDrivingDistance'}*0.000021371);
$RelativeRisks{'Driving_Male_55_64'} = -1*log(1-$YourProfile{'YourDrivingDistance'}*0.000021436);
$RelativeRisks{'Driving_Male___65'} = -1*log(1-$YourProfile{'YourDrivingDistance'}*0.000041155);

    for ($i = 0; $i < 120; $i++) { 
        if(($YourProfile{'YourDriverAge'} >= 0) and ($YourProfile{'YourDriverAge'} <= 19)) {
                $YourRisks[$i]{'Your_Table_Motor_Accidents'} = $RelativeRisks{'Driving_Male___19'}; }
        elsif(($YourProfile{'YourDriverAge'} >= 20) and ($YourProfile{'YourDriverAge'} <= 34)) {
                $YourRisks[$i]{'Your_Table_Motor_Accidents'} = $RelativeRisks{'Driving_Male_20_34'}; }
        elsif(($YourProfile{'YourDriverAge'} >= 35) and ($YourProfile{'YourDriverAge'} <= 54)) {
                $YourRisks[$i]{'Your_Table_Motor_Accidents'} = $RelativeRisks{'Driving_Male_35_54'}; }
        elsif(($YourProfile{'YourDriverAge'} >= 55) and ($YourProfile{'YourDriverAge'} <= 64)) {
                $YourRisks[$i]{'Your_Table_Motor_Accidents'} = $RelativeRisks{'Driving_Male_55_64'}; }
        elsif($YourProfile{'YourDriverAge'} >= 65) {
                $YourRisks[$i]{'Your_Table_Motor_Accidents'} = $RelativeRisks{'Driving_Male___65'}; }
        
    }
}

if($YourProfile{'YourDriverSex'} == 1) {
$RelativeRisks{'Driving_Female___19'} = -1*log(1-$YourProfile{'YourDrivingDistance'}*0.000054325);
$RelativeRisks{'Driving_Female_20_34'} = -1*log(1-$YourProfile{'YourDrivingDistance'}*0.00001754);
$RelativeRisks{'Driving_Female_35_54'} = -1*log(1-$YourProfile{'YourDrivingDistance'}*0.00001253);
$RelativeRisks{'Driving_Female_55_64'} = -1*log(1-$YourProfile{'YourDrivingDistance'}*0.000016021);
$RelativeRisks{'Driving_Female___65'} = -1*log(1-$YourProfile{'YourDrivingDistance'}*0.000037586);

    for ($i = 0; $i < 120; $i++) { 
        if(($YourProfile{'YourDriverAge'} >= 0) and ($YourProfile{'YourDriverAge'} <= 19)) {                 
			$YourRisks[$i]{'Your_Table_Motor_Accidents'} = $RelativeRisks{'Driving_Female___19'}; }
        elsif(($YourProfile{'YourDriverAge'} >= 20) and ($YourProfile{'YourDriverAge'} <= 34)) {
                $YourRisks[$i]{'Your_Table_Motor_Accidents'} = $RelativeRisks{'Driving_Female_20_34'}; }
        elsif(($YourProfile{'YourDriverAge'} >= 35) and ($YourProfile{'YourDriverAge'} <= 54)) {
                $YourRisks[$i]{'Your_Table_Motor_Accidents'} = $RelativeRisks{'Driving_Female_35_54'}; }
        elsif(($YourProfile{'YourDriverAge'} >= 55) and ($YourProfile{'YourDriverAge'} <= 64)) {
                $YourRisks[$i]{'Your_Table_Motor_Accidents'} = $RelativeRisks{'Driving_Female_55_64'}; }
        elsif($YourProfile{'YourDriverAge'} >= 65) {
                $YourRisks[$i]{'Your_Table_Motor_Accidents'} = $RelativeRisks{'Driving_Female___65'}; }
        
    }
}




for ($i = 0; $i < 120; $i++) { 
    if ($YourProfile{'YourDriverBelt'} == 0) {
        $YourRisks[$i]{'Your_Table_Motor_Accidents'} = $YourRisks[$i]{'Your_Table_Motor_Accidents'} * $RelativeRisks{'Driving_Belt_0'}; }
    if ($YourProfile{'YourDriverBelt'} == 1) {
        $YourRisks[$i]{'Your_Table_Motor_Accidents'} = $YourRisks[$i]{'Your_Table_Motor_Accidents'} * $RelativeRisks{'Driving_Belt_1'}; }
    if ($YourProfile{'YourDriverSpeed'} == 0) {
        $YourRisks[$i]{'Your_Table_Motor_Accidents'} = $YourRisks[$i]{'Your_Table_Motor_Accidents'} * $RelativeRisks{'Driving_Speed_0'}; }
    if ($YourProfile{'YourDriverSpeed'} == 1) {
        $YourRisks[$i]{'Your_Table_Motor_Accidents'} = $YourRisks[$i]{'Your_Table_Motor_Accidents'} * $RelativeRisks{'Driving_Speed_1'}; }
    if ($YourProfile{'YourDriverAlcohol'} == 0) {
        $YourRisks[$i]{'Your_Table_Motor_Accidents'} = $YourRisks[$i]{'Your_Table_Motor_Accidents'} * $RelativeRisks{'Driving_Alcohol_0'}; }
    if ($YourProfile{'YourDriverAlcohol'} == 1) {
        $YourRisks[$i]{'Your_Table_Motor_Accidents'} = $YourRisks[$i]{'Your_Table_Motor_Accidents'} * $RelativeRisks{'Driving_Alcohol_1'}; }
}


# Stress Variable

for ($i = 0; $i < 7; $i++) { 
    if($YourProfile{'YourStress'} == 0) {
            $AllScale[$YourProfile{'YourAge'} + $i] = $AllScale[$YourProfile{'YourAge'} + $i] * $RelativeRisks{'Stress_0'}; }
    elsif($YourProfile{'YourStress'} == 1) {
		$AllScale[$YourProfile{'YourAge'} + $i] = $AllScale[$YourProfile{'YourAge'} + $i] * $RelativeRisks{'Stress_1'}; }
    elsif($YourProfile{'YourStress'} == 2) {
            $AllScale[$YourProfile{'YourAge'} + $i] = $AllScale[$YourProfile{'YourAge'} + $i] * $RelativeRisks{'Stress_2'}; }
    elsif($YourProfile{'YourStress'} >= 3) {
            $AllScale[$YourProfile{'YourAge'} + $i] = $AllScale[$YourProfile{'YourAge'} + $i] * $RelativeRisks{'Stress___3'}; }
}







# Exercise Variable

for ($i = 0; $i < 120; $i++) { 
    if($YourProfile{'YourExercise'} == 0) {
            $AllScale[$i] = $AllScale[$i] * $RelativeRisks{'Exercise_0'}; }
    elsif($YourProfile{'YourExercise'} == 1) {
            $AllScale[$i] = $AllScale[$i] * $RelativeRisks{'Exercise_1'}; }
    elsif($YourProfile{'YourExercise'} == 2) {
            $AllScale[$i] = $AllScale[$i] * $RelativeRisks{'Exercise_2'}; }
}



# Occupation Variable




for ($i = 0; $i < 120; $i++) { 
    if($YourProfile{'YourOccupation'} != -1) {
            $YourRisks[$i]{'Your_Table_Other_Accidents'} = $YourRisks[$i]{'Your_Table_Other_Accidents'} * $RelativeRisks{'Occupation_Accidents'}[$YourProfile{'YourOccupation'}]; }
}




$YourProfile{'YourOccupationClass'} = ($YourProfile{'YourOccupationFather'} + $YourProfile{'YourOccupationFirst'} + $YourProfile{'YourOccupationLast'});



for ($i = 0; $i < 120; $i++) { 
    if($YourProfile{'YourOccupationClass'} == 0) {
            $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Occupation_Class_Heart_Diseases_0'}; 
            $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Occupation_Class_Cancer_0'}; }
    elsif($YourProfile{'YourOccupationClass'} == 1) {
            $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Occupation_Class_Heart_Diseases_1'}; 
            $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Occupation_Class_Cancer_1'}; }
    elsif($YourProfile{'YourOccupationClass'} == 2) {
            $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Occupation_Class_Heart_Diseases_2'}; 
            $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Occupation_Class_Cancer_2'}; }
    elsif($YourProfile{'YourOccupationClass'} == 3) {
            $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Occupation_Class_Heart_Diseases_3'}; 
            $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Occupation_Class_Cancer_3'}; }
   
}




# Nutrition Variable

if($YourProfile{'YourSex'} == 0) {
    for ($i = 0; $i < 120; $i++) { 
        if(($YourProfile{'YourNutrition'} >= 0) and ($YourProfile{'YourNutrition'} <= 2)) {
                $AllScale[$i] = $AllScale[$i] * $RelativeRisks{'Nutrition_Male_0_2'}; }
        elsif($YourProfile{'YourNutrition'} == 3) {
                $AllScale[$i] = $AllScale[$i] * $RelativeRisks{'Nutrition_Male_3'}; }
        elsif($YourProfile{'YourNutrition'} == 4) {
                $AllScale[$i] = $AllScale[$i] * $RelativeRisks{'Nutrition_Male_4'}; }
        elsif($YourProfile{'YourNutrition'} == 5) {
                $AllScale[$i] = $AllScale[$i] * $RelativeRisks{'Nutrition_Male_5'}; }
    }
}

if($YourProfile{'YourSex'} == 1) {
    for ($i = 0; $i < 120; $i++) { 
        if(($YourProfile{'YourNutrition'} >= 0) and ($YourProfile{'YourNutrition'} <= 2)) {
                $AllScale[$i] = $AllScale[$i] * $RelativeRisks{'Nutrition_Female_0_2'}; }
        elsif($YourProfile{'YourNutrition'} == 3) {
                $AllScale[$i] = $AllScale[$i] * $RelativeRisks{'Nutrition_Female_3'}; }
        elsif($YourProfile{'YourNutrition'} == 4) {
                $AllScale[$i] = $AllScale[$i] * $RelativeRisks{'Nutrition_Female_4'}; }
        elsif($YourProfile{'YourNutrition'} == 5) {
                $AllScale[$i] = $AllScale[$i] * $RelativeRisks{'Nutrition_Female_5'}; }
    }
}





# Fat Intake Variable

for ($i = 0; $i < 120; $i++) { 
    if($YourProfile{'YourFatIntake'} == 0) {
        $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Fat_Intake_Cancer_0'}; 
        $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Fat_Intake_Heart_Diseases_0'}; }
    if($YourProfile{'YourFatIntake'} == 1) {
        $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Fat_Intake_Cancer_1'}; 
        $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Fat_Intake_Heart_Diseases_1'}; }
}





# Depression Variable

if($YourProfile{'YourSex'} == 0) {
   for ($i = 0; $i < 120; $i++) { 
        if($YourProfile{'YourDepression'} == 0) {
            $YourRisks[$i]{'Your_Table_Suicide'} = $YourRisks[$i]{'Your_Table_Suicide'} * $RelativeRisks{'Depression_Male_Suicide_0'}; }
        if($YourProfile{'YourDepression'} == 1) {
            $YourRisks[$i]{'Your_Table_Suicide'} = $YourRisks[$i]{'Your_Table_Suicide'} * $RelativeRisks{'Depression_Male_Suicide_1'}; }
   }
}

if($YourProfile{'YourSex'} == 1) {
   for ($i = 0; $i < 120; $i++) { 
        if($YourProfile{'YourDepression'} == 0) {
            $YourRisks[$i]{'Your_Table_Suicide'} = $YourRisks[$i]{'Your_Table_Suicide'} * $RelativeRisks{'Depression_Female_Suicide_0'}; }
        if($YourProfile{'YourDepression'} == 1) {
            $YourRisks[$i]{'Your_Table_Suicide'} = $YourRisks[$i]{'Your_Table_Suicide'} * $RelativeRisks{'Depression_Female_Suicide_1'}; }
   }
}

for ($i = 0; $i < 120; $i++) { 
if($YourProfile{'YourDepression'} == 0) {
            $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Depression_Heart_Diseases_0'}; 
            $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Depression_Stroke_0'}; }
if($YourProfile{'YourDepression'} == 1) {
            $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Depression_Heart_Diseases_1'}; 
            $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Depression_Stroke_1'}; }
}



# Sexual Practices Variable

if($YourProfile{'YourSex'} == 0) {
   for ($i = 0; $i < 120; $i++) { 
        $AIDS_Rate = 1 - exp(-1 * $YourRisks[$i]{'Your_Table_AIDS'});
        if($YourProfile{'YourCondomUse'} == 0) {
$RelativeRisks{'Sexual_Male_AIDS_0'} = -1*log((1-$AIDS_Rate)**($YourProfile{'YourSexualPartner'}/(($Constants{'Male_Condom_Use'}*(1-$Constants{'Condom_Effectiveness'})+(1-$Constants{'Male_Condom_Use'})))));
            $YourRisks[$i]{'Your_Table_AIDS'} = $RelativeRisks{'Sexual_Male_AIDS_0'}; }
       
        if($YourProfile{'YourCondomUse'} == 1) {
$RelativeRisks{'Sexual_Male_AIDS_1'} = -1*log((1-$AIDS_Rate)**($YourProfile{'YourSexualPartner'}*$Constants{'Condom_Effectiveness'}/($Constants{'Male_Mean_Sexual_Partner_in_past_Year'}*($Constants{'Male_Condom_Use'}*(1-$Constants{'Condom_Effectiveness'})+(1-$Constants{'Male_Condom_Use'})))));
            $YourRisks[$i]{'Your_Table_AIDS'} = $RelativeRisks{'Sexual_Male_AIDS_1'}; }
        
    }
}

if($YourProfile{'YourSex'} == 1) {
   for ($i = 0; $i < 120; $i++) { 
        $AIDS_Rate = 1 - exp(-1 * $YourRisks[$i]{'Your_Table_AIDS'});
        if($YourProfile{'YourCondomUse'} == 0) {
$RelativeRisks{'Sexual_Female_AIDS_0'} = -1*log((1-$AIDS_Rate)**($YourProfile{'YourSexualPartner'}/(($Constants{'Female_Condom_Use'}*(1-$Constants{'Condom_Effectiveness'})+(1-$Constants{'Female_Condom_Use'})))));
            $YourRisks[$i]{'Your_Table_AIDS'} = $RelativeRisks{'Sexual_Female_AIDS_0'}; }
       
        if($YourProfile{'YourCondomUse'} == 1) {
$RelativeRisks{'Sexual_Female_AIDS_1'} = -1*log((1-$AIDS_Rate)**($YourProfile{'YourSexualPartner'}*$Constants{'Condom_Effectiveness'}/($Constants{'Female_Mean_Sexual_Partner_in_past_Year'}*($Constants{'Female_Condom_Use'}*(1-$Constants{'Condom_Effectiveness'})+(1-$Constants{'Female_Condom_Use'})))));
            $YourRisks[$i]{'Your_Table_AIDS'} = $RelativeRisks{'Sexual_Female_AIDS_1'}; }
        
    }
}




# Sleep Variable

if($YourProfile{'YourSex'} == 0) {
    for ($i = 0; $i < 120; $i++) { 
        if(($YourProfile{'YourSleep'} >= 0) and ($YourProfile{'YourSleep'} < 4)) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Sleep_Male_Heart_Diseases__4'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Sleep_Male_Stroke__4'}; 
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Sleep_Male_Cancer__4'};
                $YourRisks[$i]{'Your_Table_Suicide'} = $YourRisks[$i]{'Your_Table_Suicide'} * $RelativeRisks{'Sleep_Male_Suicide__4'}; }
            elsif(($YourProfile{'YourSleep'} >= 4) and ($YourProfile{'YourSleep'} <= 4.999)) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Sleep_Male_Heart_Diseases_4_4_9'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Sleep_Male_Stroke_4_4_9'}; 
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Sleep_Male_Cancer_4_4_9'}; 
                $YourRisks[$i]{'Your_Table_Suicide'} = $YourRisks[$i]{'Your_Table_Suicide'} * $RelativeRisks{'Sleep_Male_Suicide_4_4_9'}; }
            elsif(($YourProfile{'YourSleep'} >= 5) and ($YourProfile{'YourSleep'} <= 5.999)) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Sleep_Male_Heart_Diseases_5_5_9'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Sleep_Male_Stroke_5_5_9'}; 
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Sleep_Male_Cancer_5_5_9'}; 
                $YourRisks[$i]{'Your_Table_Suicide'} = $YourRisks[$i]{'Your_Table_Suicide'} * $RelativeRisks{'Sleep_Male_Suicide_5_5_9'}; }
            elsif(($YourProfile{'YourSleep'} >= 6) and ($YourProfile{'YourSleep'} <= 6.999)) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Sleep_Male_Heart_Diseases_6_6_9'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Sleep_Male_Stroke_6_6_9'}; 
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Sleep_Male_Cancer_6_6_9'}; 
                $YourRisks[$i]{'Your_Table_Suicide'} = $YourRisks[$i]{'Your_Table_Suicide'} * $RelativeRisks{'Sleep_Male_Suicide_6_6_9'}; }
            elsif(($YourProfile{'YourSleep'} >= 7) and ($YourProfile{'YourSleep'} <= 7.999)) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Sleep_Male_Heart_Diseases_7_7_9'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Sleep_Male_Stroke_7_7_9'}; 
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Sleep_Male_Cancer_7_7_9'}; 
                $YourRisks[$i]{'Your_Table_Suicide'} = $YourRisks[$i]{'Your_Table_Suicide'} * $RelativeRisks{'Sleep_Male_Suicide_7_7_9'}; }
            elsif(($YourProfile{'YourSleep'} >= 8) and ($YourProfile{'YourSleep'} <= 8.999)) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Sleep_Male_Heart_Diseases_8_8_9'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Sleep_Male_Stroke_8_8_9'}; 
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Sleep_Male_Cancer_8_8_9'}; 
                $YourRisks[$i]{'Your_Table_Suicide'} = $YourRisks[$i]{'Your_Table_Suicide'} * $RelativeRisks{'Sleep_Male_Suicide_8_8_9'}; }
            elsif(($YourProfile{'YourSleep'} >= 9) and ($YourProfile{'YourSleep'} <= 9.999)) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Sleep_Male_Heart_Diseases_9_9_9'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Sleep_Male_Stroke_9_9_9'}; 
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Sleep_Male_Cancer_9_9_9'}; 
                $YourRisks[$i]{'Your_Table_Suicide'} = $YourRisks[$i]{'Your_Table_Suicide'} * $RelativeRisks{'Sleep_Male_Suicide_9_9_9'}; }
            elsif($YourProfile{'YourSleep'} >= 10) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Sleep_Male_Heart_Diseases___10'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Sleep_Male_Stroke___10'}; 
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Sleep_Male_Cancer___10'}; 
                $YourRisks[$i]{'Your_Table_Suicide'} = $YourRisks[$i]{'Your_Table_Suicide'} * $RelativeRisks{'Sleep_Male_Suicide___10'}; }
    }
}




if($YourProfile{'YourSex'} == 1) {
    for ($i = 0; $i < 120; $i++) { 
        if(($YourProfile{'YourSleep'} >= 0) and ($YourProfile{'YourSleep'} < 4)) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Sleep_Female_Heart_Diseases__4'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Sleep_Female_Stroke__4'}; 
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Sleep_Female_Cancer__4'}; 
                $YourRisks[$i]{'Your_Table_Suicide'} = $YourRisks[$i]{'Your_Table_Suicide'} * $RelativeRisks{'Sleep_Female_Suicide__4'}; }
            elsif(($YourProfile{'YourSleep'} >= 4) and ($YourProfile{'YourSleep'} <= 4.999)) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Sleep_Female_Heart_Diseases_4_4_9'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Sleep_Female_Stroke_4_4_9'}; 
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Sleep_Female_Cancer_4_4_9'}; 
                $YourRisks[$i]{'Your_Table_Suicide'} = $YourRisks[$i]{'Your_Table_Suicide'} * $RelativeRisks{'Sleep_Female_Suicide_4_4_9'}; }
            elsif(($YourProfile{'YourSleep'} >= 5) and ($YourProfile{'YourSleep'} <= 5.999)) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Sleep_Female_Heart_Diseases_5_5_9'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Sleep_Female_Stroke_5_5_9'}; 
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Sleep_Female_Cancer_5_5_9'}; 
                $YourRisks[$i]{'Your_Table_Suicide'} = $YourRisks[$i]{'Your_Table_Suicide'} * $RelativeRisks{'Sleep_Female_Suicide_5_5_9'}; }
            elsif(($YourProfile{'YourSleep'} >= 6) and ($YourProfile{'YourSleep'} <= 6.999)) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Sleep_Female_Heart_Diseases_6_6_9'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Sleep_Female_Stroke_6_6_9'}; 
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Sleep_Female_Cancer_6_6_9'}; 
                $YourRisks[$i]{'Your_Table_Suicide'} = $YourRisks[$i]{'Your_Table_Suicide'} * $RelativeRisks{'Sleep_Female_Suicide_6_6_9'}; }
            elsif(($YourProfile{'YourSleep'} >= 7) and ($YourProfile{'YourSleep'} <= 7.999)) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Sleep_Female_Heart_Diseases_7_7_9'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Sleep_Female_Stroke_7_7_9'}; 
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Sleep_Female_Cancer_7_7_9'}; 
                $YourRisks[$i]{'Your_Table_Suicide'} = $YourRisks[$i]{'Your_Table_Suicide'} * $RelativeRisks{'Sleep_Female_Suicide_7_7_9'}; }
            elsif(($YourProfile{'YourSleep'} >= 8) and ($YourProfile{'YourSleep'} <= 8.999)) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Sleep_Female_Heart_Diseases_8_8_9'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Sleep_Female_Stroke_8_8_9'}; 
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Sleep_Female_Cancer_8_8_9'}; 
                $YourRisks[$i]{'Your_Table_Suicide'} = $YourRisks[$i]{'Your_Table_Suicide'} * $RelativeRisks{'Sleep_Female_Suicide_8_8_9'}; }
            elsif(($YourProfile{'YourSleep'} >= 9) and ($YourProfile{'YourSleep'} <= 9.999)) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Sleep_Female_Heart_Diseases_9_9_9'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Sleep_Female_Stroke_9_9_9'}; 
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Sleep_Female_Cancer_9_9_9'}; 
                $YourRisks[$i]{'Your_Table_Suicide'} = $YourRisks[$i]{'Your_Table_Suicide'} * $RelativeRisks{'Sleep_Female_Suicide_9_9_9'}; }
            elsif($YourProfile{'YourSleep'} >= 10) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Sleep_Female_Heart_Diseases___10'}; 
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Sleep_Female_Stroke___10'}; 
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Sleep_Female_Cancer___10'}; 
                $YourRisks[$i]{'Your_Table_Suicide'} = $YourRisks[$i]{'Your_Table_Suicide'} * $RelativeRisks{'Sleep_Female_Suicide___10'}; }
    }
}





for ($i = 0; $i < 120; $i++) { 

    $YourRisks[$i]{'Your_Table_Cancer_Scale'} = $YourRisks[$i]{'Your_Table_Cancer_Scale'} * $CancerScale[$i];
    $YourRisks[$i]{'Your_Table_All_Scale'} = $YourRisks[$i]{'Your_Table_All_Scale'} * $AllScale[$i];

    $YourRisks[$i]{'Your_Table_Esophagus__Mouth__Pharynx'} = $YourRisks[$i]{'Your_Table_Esophagus__Mouth__Pharynx'} * $CancerScale[$i];
    $YourRisks[$i]{'Your_Table_Stomach'} = $YourRisks[$i]{'Your_Table_Stomach'} * $CancerScale[$i];
    $YourRisks[$i]{'Your_Table_Colorectal'} = $YourRisks[$i]{'Your_Table_Colorectal'} * $CancerScale[$i];
    $YourRisks[$i]{'Your_Table_Lung'} = $YourRisks[$i]{'Your_Table_Lung'} * $CancerScale[$i];
    $YourRisks[$i]{'Your_Table_Ovary'} = $YourRisks[$i]{'Your_Table_Ovary'} * $CancerScale[$i];
    $YourRisks[$i]{'Your_Table_Prostate'} = $YourRisks[$i]{'Your_Table_Prostate'} * $CancerScale[$i];
    $YourRisks[$i]{'Your_Table_Breast'} = $YourRisks[$i]{'Your_Table_Breast'} * $CancerScale[$i];
    $YourRisks[$i]{'Your_Table_Other_Cancers'} = $YourRisks[$i]{'Your_Table_Other_Cancers'} * $CancerScale[$i];


    $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $AllScale[$i];
    $YourRisks[$i]{'Your_Table_Cancer'} = $YourRisks[$i]{'Your_Table_Cancer'} * $AllScale[$i];
    $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $AllScale[$i];
    $YourRisks[$i]{'Your_Table_COPD'} = $YourRisks[$i]{'Your_Table_COPD'} * $AllScale[$i];
    $YourRisks[$i]{'Your_Table_Motor_Accidents'} = $YourRisks[$i]{'Your_Table_Motor_Accidents'} * $AllScale[$i];
    $YourRisks[$i]{'Your_Table_Other_Accidents'} = $YourRisks[$i]{'Your_Table_Other_Accidents'} * $AllScale[$i];
    $YourRisks[$i]{'Your_Table_Pneumonia_Influenza'} = $YourRisks[$i]{'Your_Table_Pneumonia_Influenza'} * $AllScale[$i];
    $YourRisks[$i]{'Your_Table_Diabetes'} = $YourRisks[$i]{'Your_Table_Diabetes'} * $AllScale[$i];
    $YourRisks[$i]{'Your_Table_AIDS'} = $YourRisks[$i]{'Your_Table_AIDS'} * $AllScale[$i];
    $YourRisks[$i]{'Your_Table_Suicide'} = $YourRisks[$i]{'Your_Table_Suicide'} * $AllScale[$i];
    $YourRisks[$i]{'Your_Table_Cirrhosis'} = $YourRisks[$i]{'Your_Table_Cirrhosis'} * $AllScale[$i];
    $YourRisks[$i]{'Your_Table_Residual'} = $YourRisks[$i]{'Your_Table_Residual'} * $AllScale[$i];
        
    $YourRisks[$i]{'Your_Table_Esophagus__Mouth__Pharynx'} = $YourRisks[$i]{'Your_Table_Esophagus__Mouth__Pharynx'} * $AllScale[$i];
    $YourRisks[$i]{'Your_Table_Stomach'} = $YourRisks[$i]{'Your_Table_Stomach'} * $AllScale[$i];
    $YourRisks[$i]{'Your_Table_Colorectal'} = $YourRisks[$i]{'Your_Table_Colorectal'} * $AllScale[$i];
    $YourRisks[$i]{'Your_Table_Lung'} = $YourRisks[$i]{'Your_Table_Lung'} * $AllScale[$i];
    $YourRisks[$i]{'Your_Table_Ovary'} = $YourRisks[$i]{'Your_Table_Ovary'} * $AllScale[$i];
    $YourRisks[$i]{'Your_Table_Prostate'} = $YourRisks[$i]{'Your_Table_Prostate'} * $AllScale[$i];
    $YourRisks[$i]{'Your_Table_Breast'} = $YourRisks[$i]{'Your_Table_Breast'} * $AllScale[$i];
    $YourRisks[$i]{'Your_Table_Other_Cancers'} = $YourRisks[$i]{'Your_Table_Other_Cancers'} * $AllScale[$i];
      
}






return (@YourRisks);

};

1
