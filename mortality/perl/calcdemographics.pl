#!/usr/local/bin/perl

sub calcdemographics

{

local(@YourRisks) = @_;



for ($i = 0; $i < 120; $i++) { 
    $AllScale[$i] = 1;
    $CancerScale[$i] = 1;
};


#Height Variable

if($YourProfile{'YourHeight'} != -1) {
    if($YourProfile{'YourSex'} == 0) {
	$RelativeRisks{'Height_Male_Stroke'} = 0.0305904398238499**($YourProfile{'YourHeight'}-$Constants{'Mean_Height_Male'});
	$RelativeRisks{'Height_Male_Heart_Diseases'} = 0.0188919613181312**($YourProfile{'YourHeight'}-$Constants{'Mean_Height_Male'});
 	$RelativeRisks{'Height_Male_Cancer'} = 0.234238873662591**($YourProfile{'YourHeight'}-$Constants{'Mean_Height_Male'});   
    for ($i = 0; $i < 120; $i++) { 
		$YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Height_Male_Stroke'};
            $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Height_Male_Heart_Diseases'};
            $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Height_Male_Cancer'};
        }
    }

    if($YourProfile{'YourSex'} == 1) {
	$RelativeRisks{'Height_Female_Stroke'} = 0.00184695877721351**($YourProfile{'YourHeight'}-$Constants{'Mean_Height_Female'});
        for ($i = 0; $i < 120; $i++) { 
            $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Height_Female_Stroke'};
            $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Height_Female_Heart_Diseases'};
            $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Height_Female_Cancer'};
        }
    }
}


#Weight Variable

if($YourProfile{'YourSex'} == 0) {
for ($i = 0; $i < 66; $i++) { 
        if(($YourProfile{'YourBMI'} >= 0) and ($YourProfile{'YourBMI'} <= $Constants{'Men_s_BMI_Quartile_1___2_Divider'})) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Weight_Male_Heart_Diseases___65_1'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Weight_Male_Cancer_1'}; }
        elsif(($YourProfile{'YourBMI'} > $Constants{'Men_s_BMI_Quartile_1___2_Divider'}) and ($YourProfile{'YourBMI'} <= $Constants{'Men_s_BMI_Quartile_2___3_Divider'})) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Weight_Male_Heart_Diseases___65_2'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Weight_Male_Cancer_2'}; }
        elsif(($YourProfile{'YourBMI '} > $Constants{'Men_s_BMI_Quartile_2___3_Divider'}) and ($YourProfile{'YourBMI'} <= $Constants{'Men_s_BMI_Quartile_3___4_Divider'})) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Weight_Male_Heart_Diseases___65_3'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Weight_Male_Cancer_3'}; }
        elsif($YourProfile{'YourBMI'} > $Constants{'Men_s_BMI_Quartile_3___4_Divider'}) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Weight_Male_Heart_Diseases___65_4'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Weight_Male_Cancer_4'}; }
 }
 for ($i = 66; $i < 120; $i++) { 
        if(($YourProfile{'YourBMI'} >= 0) and ($YourProfile{'YourBMI'} <= $Constants{'Men_s_BMI_Quartile_1___2_Divider'})) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Weight_Male_Heart_Diseases__65_1'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Weight_Male_Cancer_1'}; }
        elsif(($YourProfile{'YourBMI'} > $Constants{'Men_s_BMI_Quartile_1___2_Divider'}) and ($YourProfile{'YourBMI'} <= $Constants{'Men_s_BMI_Quartile_2___3_Divider'})) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Weight_Male_Heart_Diseases__65_2'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Weight_Male_Cancer_2'}; }
        elsif(($YourProfile{'YourBMI '} > $Constants{'Men_s_BMI_Quartile_2___3_Divider'}) and ($YourProfile{'YourBMI'} <= $Constants{'Men_s_BMI_Quartile_3___4_Divider'})) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Weight_Male_Heart_Diseases__65_3'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Weight_Male_Cancer_3'}; }
        elsif($YourProfile{'YourBMI'} > $Constants{'Men_s_BMI_Quartile_3___4_Divider'}) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Weight_Male_Heart_Diseases__65_4'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Weight_Male_Cancer_4'}; }
}
}

if($YourProfile{'YourSex'} == 1) {
for ($i = 0; $i < 120; $i++) { 
 	if(($YourProfile{'YourBMI'} >= 0) and ($YourProfile{'YourBMI'} <= $Constants{'Women_s_BMI_Quartile_1___2_Divider'})) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Weight_Female_Heart_Diseases_1'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Weight_Female_Cancer_1'}; }
      elsif(($YourProfile{'YourBMI'} > $Constants{'Women_s_BMI_Quartile_1___2_Divider'}) and ($YourProfile{'YourBMI'} <= $Constants{'Women_s_BMI_Quartile_2___3_Divider'})) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Weight_Female_Heart_Diseases_2'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Weight_Female_Cancer_2'}; }
      elsif(($YourProfile{'YourBMI '} > $Constants{'Women_s_BMI_Quartile_2___3_Divider'}) and ($YourProfile{'YourBMI'} <= $Constants{'Women_s_BMI_Quartile_3___4_Divider'})) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Weight_Female_Heart_Diseases_3'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Weight_Female_Cancer_3'}; }
      elsif($YourProfile{'YourBMI'} > $Constants{'Women_s_BMI_Quartile_3___4_Divider'}) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Weight_Female_Heart_Diseases_4'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Weight_Female_Cancer_4'}; }
}
}








#Education Variable

if($YourProfile{'YourSex'} == 0) {
    if($YourProfile{'YourEducation'} == 0) {
            for ($i = 0; $i < 120; $i++) { 
                $AllScale[$i] = $AllScale[$i] * $RelativeRisks{'Education_Male_0'};
            }
    }	
    elsif($YourProfile{'YourEducation'} == 1) {
            for ($i = 0; $i < 120; $i++) { 
                $AllScale[$i] = $AllScale[$i] * $RelativeRisks{'Education_Male_1'};
            }
    }
    elsif($YourProfile{'YourEducation'} == 2) {
            for ($i = 0; $i < 120; $i++) { 
                $AllScale[$i] = $AllScale[$i] * $RelativeRisks{'Education_Male_2'};
            }
    }
}


if($YourProfile{'YourSex'} == 1) {
 if($YourProfile{'YourEducation'} == 0) {
            for ($i = 0; $i < 120; $i++) { 
                $AllScale[$i] = $AllScale[$i] * $RelativeRisks{'Education_Female_0'};
            }
 } 
  elsif($YourProfile{'YourEducation'} == 1) {
            for ($i = 0; $i < 120; $i++) { 
                $AllScale[$i] = $AllScale[$i] * $RelativeRisks{'Education_Female_1'};
            }
  }
  elsif($YourProfile{'YourEducation'} == 2) {
            for ($i = 0; $i < 120; $i++) { 
                $AllScale[$i] = $AllScale[$i] * $RelativeRisks{'Education_Female_2'};
            }
    }

}





#Marital Status Variable

if($YourProfile{'YourSex'} == 0) {
 for ($i = 0; $i < 55; $i++) { 
        if($YourProfile{'YourIncome'} > $Constants{'Mean_Income'}) {
            if($YourProfile{'YourMaritalStatus'} == 0) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Marital_Status_Male_Rich__55_Heart_Diseases_0'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Marital_Status_Male_Rich__55_Cancer_0'};
            }
            if($YourProfile{'YourMaritalStatus'} == 1) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Marital_Status_Male_Rich__55_Heart_Diseases_1'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Marital_Status_Male_Rich__55_Cancer_1'};
            }
        }
        if($YourProfile{'YourIncome'} < $Constants{'Mean_Income'}) {
            if($YourProfile{'YourMaritalStatus'} == 0) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Marital_Status_Male_Poor__55_Heart_Diseases_0'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Marital_Status_Male_Poor__55_Cancer_0'};
            }
            if($YourProfile{'YourMaritalStatus'} == 1) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Marital_Status_Male_Poor__55_Heart_Diseases_1'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Marital_Status_Male_Poor__55_Cancer_1'};
            }
        }
    }
  for ($i = 55; $i < 120; $i++) { 
        if($YourProfile{'YourIncome'} > $Constants{'Mean_Income'}) {
            if($YourProfile{'YourMaritalStatus'} == 0) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Marital_Status_Male_Rich___55_Heart_Diseases_0'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Marital_Status_Male_Rich___55_Cancer_0'};
            }
            if($YourProfile{'YourMaritalStatus'} == 1) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Marital_Status_Male_Rich___55_Heart_Diseases_1'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Marital_Status_Male_Rich___55_Cancer_1'};
            }
        }
        if($YourProfile{'YourIncome'} < $Constants{'Mean_Income'}) {
            if($YourProfile{'YourMaritalStatus'} == 0) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Marital_Status_Male_Poor___55_Heart_Diseases_0'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Marital_Status_Male_Poor___55_Cancer_0'};
            }
            if($YourProfile{'YourMaritalStatus'} == 1) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Marital_Status_Male_Poor___55_Heart_Diseases_1'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Marital_Status_Male_Poor___55_Cancer_1'};
            }
        }
    }
}

if($YourProfile{'YourSex'} == 1) {
 for ($i = 0; $i < 55; $i++) { 
        if($YourProfile{'YourIncome'} > $Constants{'Mean_Income'}) {
            if($YourProfile{'YourMaritalStatus'} == 0) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Marital_Status_Female_Rich__55_Heart_Diseases_0'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Marital_Status_Female_Rich__55_Cancer_0'};
            }
            if($YourProfile{'YourMaritalStatus'} == 1) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Marital_Status_Female_Rich__55_Heart_Diseases_1'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Marital_Status_Female_Rich__55_Cancer_1'};
            }
        }
        if($YourProfile{'YourIncome'} < $Constants{'Mean_Income'}) {
            if($YourProfile{'YourMaritalStatus'} == 0) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Marital_Status_Female_Poor__55_Heart_Diseases_0'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Marital_Status_Female_Poor__55_Cancer_0'};
            }
            if($YourProfile{'YourMaritalStatus'} == 1) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Marital_Status_Female_Poor__55_Heart_Diseases_1'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Marital_Status_Female_Poor__55_Cancer_1'};
            }
        }
    }
for ($i = 55; $i < 120; $i++) { 
        if($YourProfile{'YourIncome'} > $Constants{'Mean_Income'}) {
            if($YourProfile{'YourMaritalStatus'} == 0) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Marital_Status_Female_Rich___55_Heart_Diseases_0'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Marital_Status_Female_Rich___55_Cancer_0'};
            }
            if($YourProfile{'YourMaritalStatus'} == 1) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Marital_Status_Female_Rich___55_Heart_Diseases_1'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Marital_Status_Female_Rich___55_Cancer_1'};
            }
        }
        if($YourProfile{'YourIncome'} < $Constants{'Mean_Income'}) {
            if($YourProfile{'YourMaritalStatus'} == 0) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Marital_Status_Female_Poor___55_Heart_Diseases_0'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Marital_Status_Female_Poor___55_Cancer_0'};
            }
            if($YourProfile{'YourMaritalStatus'} == 1) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Marital_Status_Female_Poor___55_Heart_Diseases_1'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Marital_Status_Female_Poor___55_Cancer_1'};
            }
        }
    }
}









#Fitness Variable

if($YourProfile{'YourSex'} == 0) {
    for ($i = 0; $i < 120; $i++) { 
        if($YourProfile{'YourFitness'} == 0) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Fitness_Male_Heart_Diseases_0'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Fitness_Male_Cancer_0'}; }
        elsif($YourProfile{'YourFitness'} == 1) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Fitness_Male_Heart_Diseases_1_2'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Fitness_Male_Cancer_1_2'}; }
        elsif($YourProfile{'YourFitness'} == 2) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Fitness_Male_Heart_Diseases_1_2'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Fitness_Male_Cancer_1_2'}; }
        elsif($YourProfile{'YourFitness'} == 3) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Fitness_Male_Heart_Diseases_3_4'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Fitness_Male_Cancer_3_4'}; }
        elsif($YourProfile{'YourFitness'} == 4) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Fitness_Male_Heart_Diseases_3_4'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Fitness_Male_Cancer_3_4'}; }
    }
}

if($YourProfile{'YourSex'} == 1) {
 for ($i = 0; $i < 120; $i++) { 
        if($YourProfile{'YourFitness'} == 0) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Fitness_Female_Heart_Diseases_0'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Fitness_Female_Cancer_0'}; }
        elsif($YourProfile{'YourFitness'} == 1) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Fitness_Female_Heart_Diseases_1_2'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Fitness_Female_Cancer_1_2'}; }
        elsif($YourProfile{'YourFitness'} == 2) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Fitness_Female_Heart_Diseases_1_2'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Fitness_Female_Cancer_1_2'}; }
        elsif($YourProfile{'YourFitness'} == 3) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Fitness_Female_Heart_Diseases_3_4'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Fitness_Female_Cancer_3_4'}; }
        elsif($YourProfile{'YourFitness'} == 4) {
                $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Fitness_Female_Heart_Diseases_3_4'};
                $CancerScale[$i] = $CancerScale[$i] * $RelativeRisks{'Fitness_Female_Cancer_3_4'}; }
    }

}





#Family History of Heart Diseases Variable

if($YourProfile{'YourSex'} == 0) {
for ($i = 0; $i < 60; $i++) { 
       if($YourProfile{'FamilyHeartDiseases'} == 0) {
            $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Family_History_of_Heart_Diseases_Male__60_0'};
        }
       if($YourProfile{'FamilyHeartDiseases'} == 1) {
            $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Family_History_of_Heart_Diseases_Male__60_1'};
        }
    }
for ($i = 61; $i < 120; $i++) { 
       if($YourProfile{'FamilyHeartDiseases'} == 0) {
            $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Family_History_of_Heart_Diseases_Male___60_0'};
        }
       if($YourProfile{'FamilyHeartDiseases'} == 1) {
            $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Family_History_of_Heart_Diseases_Male___60_1'};
        }
    }
}



#Family History of Prostate Cancer Variable

if($YourProfile{'YourSex'} == 0) {
   for ($i = 0; $i < 120; $i++) { 
       if($YourProfile{'FamilyProstate'} == 0) {
            $YourRisks[$i]{'Your_Table_Prostate'} = $YourRisks[$i]{'Your_Table_Prostate'} * $RelativeRisks{'Family_History_of_Cancer_Male_Prostate_0'};
        }
       if($YourProfile{'FamilyProstate'} == 1) {
            $YourRisks[$i]{'Your_Table_Prostate'} = $YourRisks[$i]{'Your_Table_Prostate'} * $RelativeRisks{'Family_History_of_Cancer_Male_Prostate_1'};
        }
    }
}





#Family History of Breast Cancer Variable

if($YourProfile{'YourSex'} == 1) {
   for ($i = 0; $i < 120; $i++) { 
       if($YourProfile{'FamilyBreast'} == 0) {
            $YourRisks[$i]{'Your_Table_Breast'} = $YourRisks[$i]{'Your_Table_Breast'} * $RelativeRisks{'Family_History_of_Cancer_Female_Breast_0'};
            $YourRisks[$i]{'Your_Table_Ovary'} = $YourRisks[$i]{'Your_Table_Ovary'} * $RelativeRisks{'Family_History_of_Cancer_Female_Breast_0_Ovary'};
        }
       if($YourProfile{'FamilyBreast'} == 1) {
            $YourRisks[$i]{'Your_Table_Breast'} = $YourRisks[$i]{'Your_Table_Breast'} * $RelativeRisks{'Family_History_of_Cancer_Female_Breast_1'};
            $YourRisks[$i]{'Your_Table_Ovary'} = $YourRisks[$i]{'Your_Table_Ovary'} * $RelativeRisks{'Family_History_of_Cancer_Female_Breast_1_Ovary'};
        }
    }
}


#Family History of Colorectal Cancer Variable

if($YourProfile{'YourSex'} == 1) {
   for ($i = 0; $i < 120; $i++) { 
       if($YourProfile{'FamilyColorectal'} == 0) {
            $YourRisks[$i]{'Your_Table_Colorectal'} = $YourRisks[$i]{'Your_Table_Colorectal'} * $RelativeRisks{'Family_History_of_Cancer_Female_Colorectal_0'};
        }
       if($YourProfile{'FamilyColorectal'} == 1) {
            $YourRisks[$i]{'Your_Table_Colorectal'} = $YourRisks[$i]{'Your_Table_Colorectal'} * $RelativeRisks{'Family_History_of_Cancer_Female_Colorectal_1'};
        }
    }
}


#Family History of Stomach Cancer Variable

if($YourProfile{'YourSex'} == 1) {
   for ($i = 0; $i < 120; $i++) { 
       if($YourProfile{'FamilyStomach'} == 0) {
            $YourRisks[$i]{'Your_Table_Stomach'} = $YourRisks[$i]{'Your_Table_Stomach'} * $RelativeRisks{'Family_History_of_Cancer_Female_Stomach_0'};
            $YourRisks[$i]{'Your_Table_Ovary'} = $YourRisks[$i]{'Your_Table_Ovary'} * $RelativeRisks{'Family_History_of_Cancer_Female_Stomach_0_Ovary'};
        }
       if($YourProfile{'FamilyStomach'} == 1) {
            $YourRisks[$i]{'Your_Table_Stomach'} = $YourRisks[$i]{'Your_Table_Stomach'} * $RelativeRisks{'Family_History_of_Cancer_Female_Stomach_1'};
            $YourRisks[$i]{'Your_Table_Ovary'} = $YourRisks[$i]{'Your_Table_Ovary'} * $RelativeRisks{'Family_History_of_Cancer_Female_Stomach_1_Ovary'};
        }
    }
}



#Family History of Lung Cancer Variable

if($YourProfile{'YourSex'} == 1) {
   for ($i = 0; $i < 120; $i++) { 
       if($YourProfile{'FamilyLung'} == 0) {
            $YourRisks[$i]{'Your_Table_Lung'} = $YourRisks[$i]{'Your_Table_Lung'} * $RelativeRisks{'Family_History_of_Cancer_Female_Lung_0'};
        }
       if($YourProfile{'FamilyLung'} == 1) {
            $YourRisks[$i]{'Your_Table_Lung'} = $YourRisks[$i]{'Your_Table_Lung'} * $RelativeRisks{'Family_History_of_Cancer_Female_Lung_1'};
        }
    }
}






#Family History of Diabetes Variable

if($YourProfile{'YourRace'} == 0) {
   for ($i = 0; $i < 120; $i++) { 
        if($YourProfile{'FamilyDiabetes'} == 0) {
                $YourRisks[$i]{'Your_Table_Diabetes'} = $YourRisks[$i]{'Your_Table_Diabetes'} * $RelativeRisks{'Family_History_of_Diabetes_White_0'}; }
        elsif($YourProfile{'FamilyDiabetes'} == 1) {
                $YourRisks[$i]{'Your_Table_Diabetes'} = $YourRisks[$i]{'Your_Table_Diabetes'} * $RelativeRisks{'Family_History_of_Diabetes_White_1'}; }
        elsif($YourProfile{'FamilyDiabetes'} >= 2) {
                $YourRisks[$i]{'Your_Table_Diabetes'} = $YourRisks[$i]{'Your_Table_Diabetes'} * $RelativeRisks{'Family_History_of_Diabetes_White___2'}; 
        }
    }
}

if($YourProfile{'YourRace'} == 1) {
 for ($i = 0; $i < 120; $i++) { 
        if($YourProfile{'FamilyDiabetes'} == 0) {
                $YourRisks[$i]{'Your_Table_Diabetes'} = $YourRisks[$i]{'Your_Table_Diabetes'} * $RelativeRisks{'Family_History_of_Diabetes_Non_White_0'}; }
        elsif($YourProfile{'FamilyDiabetes'} == 1) {
                $YourRisks[$i]{'Your_Table_Diabetes'} = $YourRisks[$i]{'Your_Table_Diabetes'} * $RelativeRisks{'Family_History_of_Diabetes_Non_White_1'}; }
        elsif($YourProfile{'FamilyDiabetes'} >= 2) {
                $YourRisks[$i]{'Your_Table_Diabetes'} = $YourRisks[$i]{'Your_Table_Diabetes'} * $RelativeRisks{'Family_History_of_Diabetes_Non_White___2'}; 
        }
    }

}


#Family History of Stroke Variable

if($YourProfile{'YourSex'} == 1) {
   for ($i = 0; $i < 120; $i++) { 
       if($YourProfile{'FamilyStroke'} == 0) {
            $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Family_History_of_Stroke_Female_0'};
        }
       if($YourProfile{'FamilyStroke'} == 1) {
            $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Family_History_of_Stroke_Female_1'};
        }
    }
}




#Geography Variable


for ($i = 0; $i < 120; $i++) { 
    if($YourProfile{'YourGeography'} != -1) {
            $YourRisks[$i]{'Your_Table_Homicide'} = $YourRisks[$i]{'Your_Table_Homicide'} * $RelativeRisks{'Geography_Homicide'}[$YourProfile{'YourGeography'}]; }
}


#AIDS Variable

if($YourProfile{'YourAIDSDiagnosis'} == 0) {
   for ($i = 0; $i < 120; $i++) { 
        if($YourProfile{'YourRace'} == 0) {
            $YourRisks[$i]{'Your_Table_Suicide'} = $YourRisks[$i]{'Your_Table_Suicide'} * $RelativeRisks{'AIDS_White_Suicide_0'};
        }
        if($YourProfile{'YourRace'} == 1) {
            $YourRisks[$i]{'Your_Table_Suicide'} = $YourRisks[$i]{'Your_Table_Suicide'} * $RelativeRisks{'AIDS_Black_Suicide_0'};
        }
   }
}

if($YourProfile{'YourAIDSDiagnosis'} == 1) {
   for ($i = 0; $i < 120; $i++) { 
        
        $YourRisks[$i]{'Your_Table_AIDS'} = $RelativeRisks{'AIDS_1'};
        
        if($YourProfile{'YourAIDSAZT'} == 0) {
            $YourRisks[$i]{'Your_Table_AIDS'} = $YourRisks[$i]{'Your_Table_AIDS'} * $RelativeRisks{'AIDS_Treatment_AZT_0'};
        }
        if($YourProfile{'YourAIDSAZT'} == 1) {
            $YourRisks[$i]{'Your_Table_AIDS'} = $YourRisks[$i]{'Your_Table_AIDS'} * $RelativeRisks{'AIDS_Treatment_AZT_1'};
        }
        
        if($YourProfile{'YourAIDSPCP'} == 0) {
            $YourRisks[$i]{'Your_Table_AIDS'} = $YourRisks[$i]{'Your_Table_AIDS'} * $RelativeRisks{'AIDS_Treatment_PCP_Prophylaxis_0'};
        }
        if($YourProfile{'YourAIDSPCP'} == 1) {
            $YourRisks[$i]{'Your_Table_AIDS'} = $YourRisks[$i]{'Your_Table_AIDS'} * $RelativeRisks{'AIDS_Treatment_PCP_Prophylaxis_1'};
        }
   
        if($YourProfile{'YourRace'} == 0) {
            $YourRisks[$i]{'Your_Table_Suicide'} = $YourRisks[$i]{'Your_Table_Suicide'} * $RelativeRisks{'AIDS_White_Suicide_1'};
        }
        if($YourProfile{'YourRace'} == 1) {
            $YourRisks[$i]{'Your_Table_Suicide'} = $YourRisks[$i]{'Your_Table_Suicide'} * $RelativeRisks{'AIDS_Black_Suicide_1'};
        }
   
   }
}






#Asthma Variable

for ($i = 0; $i < 120; $i++) { 
    if($YourProfile{'YourAsthma'} == 0) {
        $YourRisks[$i]{'Your_Table_COPD'} = $YourRisks[$i]{'Your_Table_COPD'} * $RelativeRisks{'Asthma_COPD_0'};
        $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Asthma_Heart_Diseases_0'};
        $YourRisks[$i]{'Your_Table_Lung'} = $YourRisks[$i]{'Your_Table_Lung'} * $RelativeRisks{'Asthma_Lung_Cancer_0'};
    }
    if($YourProfile{'YourAsthma'} == 1) {
        $YourRisks[$i]{'Your_Table_COPD'} = $YourRisks[$i]{'Your_Table_COPD'} * $RelativeRisks{'Asthma_COPD_1'};
        $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Asthma_Heart_Diseases_1'};
        $YourRisks[$i]{'Your_Table_Lung'} = $YourRisks[$i]{'Your_Table_Lung'} * $RelativeRisks{'Asthma_Lung_Cancer_1'};
    }
}



#Diabetes Variable


if($YourProfile{'YourSex'} == 0) {
   for ($i = 0; $i < 120; $i++) { 
        if($YourProfile{'YourDiabetes'} == 0) {
            $YourRisks[$i]{'Your_Table_Diabetes'} = $YourRisks[$i]{'Your_Table_Diabetes'} * $RelativeRisks{'Diabetes_Male_0'};
            $YourRisks[$i]{'Your_Table_Colorectal'} = $YourRisks[$i]{'Your_Table_Colorectal'} * $RelativeRisks{'Diabetes_Male_Colorectal_Cancer_0'};
            $YourRisks[$i]{'Your_Table_Pancreas'} = $YourRisks[$i]{'Your_Table_Pancreas'} * $RelativeRisks{'Diabetes_Male_Pancreas_Cancer_0'};
            $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Diabetes_Male_Heart_Diseases_0'};
            $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Diabetes_Male_Stroke_0'};
            $YourRisks[$i]{'Your_Table_Pneumonia_Influenza'} = $YourRisks[$i]{'Your_Table_Pneumonia_Influenza'} * $RelativeRisks{'Diabetes_Male_Influenza_0'};
        }
        if($YourProfile{'YourDiabetes'} == 1) {
            $YourRisks[$i]{'Your_Table_Diabetes'} = $YourRisks[$i]{'Your_Table_Diabetes'} * $RelativeRisks{'Diabetes_Male_1'};
            $YourRisks[$i]{'Your_Table_Colorectal'} = $YourRisks[$i]{'Your_Table_Colorectal'} * $RelativeRisks{'Diabetes_Male_Colorectal_Cancer_1'};
            $YourRisks[$i]{'Your_Table_Pancreas'} = $YourRisks[$i]{'Your_Table_Pancreas'} * $RelativeRisks{'Diabetes_Male_Pancreas_Cancer_1'};
            $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Diabetes_Male_Heart_Diseases_1'};
            $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Diabetes_Male_Stroke_1'};
            $YourRisks[$i]{'Your_Table_Pneumonia_Influenza'} = $YourRisks[$i]{'Your_Table_Pneumonia_Influenza'} * $RelativeRisks{'Diabetes_Male_Influenza_1'};
        }
    }
}


if($YourProfile{'YourSex'} == 1) {
   for ($i = 0; $i < 120; $i++) { 
        if($YourProfile{'YourDiabetes'} == 0) {
            $YourRisks[$i]{'Your_Table_Diabetes'} = $YourRisks[$i]{'Your_Table_Diabetes'} * $RelativeRisks{'Diabetes_Female_0'};
            $YourRisks[$i]{'Your_Table_Colorectal'} = $YourRisks[$i]{'Your_Table_Colorectal'} * $RelativeRisks{'Diabetes_Female_Colorectal_Cancer_0'};
            $YourRisks[$i]{'Your_Table_Pancreas'} = $YourRisks[$i]{'Your_Table_Pancreas'} * $RelativeRisks{'Diabetes_Female_Colorectal_Pancreas_0'};
            $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Diabetes_Female_Heart_Diseases_0'};
            $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Diabetes_Female_Stroke_0'};
            $YourRisks[$i]{'Your_Table_Pneumonia_Influenza'} = $YourRisks[$i]{'Your_Table_Pneumonia_Influenza'} * $RelativeRisks{'Diabetes_Female_Influenza_0'};
        }
        if($YourProfile{'YourDiabetes'} == 1) {
            $YourRisks[$i]{'Your_Table_Diabetes'} = $YourRisks[$i]{'Your_Table_Diabetes'} * $RelativeRisks{'Diabetes_Female_1'};
            $YourRisks[$i]{'Your_Table_Colorectal'} = $YourRisks[$i]{'Your_Table_Colorectal'} * $RelativeRisks{'Diabetes_Female_Colorectal_Cancer_1'};
            $YourRisks[$i]{'Your_Table_Pancreas'} = $YourRisks[$i]{'Your_Table_Pancreas'} * $RelativeRisks{'Diabetes_Female_Colorectal_Pancreas_1'};
            $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Diabetes_Female_Heart_Diseases_1'};
            $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Diabetes_Female_Stroke_1'};
            $YourRisks[$i]{'Your_Table_Pneumonia_Influenza'} = $YourRisks[$i]{'Your_Table_Pneumonia_Influenza'} * $RelativeRisks{'Diabetes_Female_Influenza_1'};
        }
    }
}







#Blood Pressure Variable

for ($i = 0; $i < 120; $i++) { 
    if(($YourProfile{'YourBloodPressure'} >= 0) and ($YourProfile{'YourBloodPressure'} < 80)) {
            $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Blood_Pressure_Heart_Diseases__80'}; }
        elsif(($YourProfile{'YourBloodPressure'} >= 80) and ($YourProfile{'YourBloodPressure'} <= 89)) {
            $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Blood_Pressure_Heart_Diseases_80_89'}; }
        elsif(($YourProfile{'YourBloodPressure'} >= 90) and ($YourProfile{'YourBloodPressure'} <= 94)) {
            $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Blood_Pressure_Heart_Diseases_90_94'}; }
        elsif(($YourProfile{'YourBloodPressure'} >= 95) and ($YourProfile{'YourBloodPressure'} <= 104)) {
            $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Blood_Pressure_Heart_Diseases_95_104'}; }
        elsif($YourProfile{'YourBloodPressure'} >= 105) {
            $YourRisks[$i]{'Your_Table_Heart_Diseases'} = $YourRisks[$i]{'Your_Table_Heart_Diseases'} * $RelativeRisks{'Blood_Pressure_Heart_Diseases___105'};
    }
}
    
if($YourProfile{'YourSex'} == 0) {
    for ($i = 0; $i < 120; $i++) { 
        if(($YourProfile{'YourBloodPressure'} >= 0) and ($YourProfile{'YourBloodPressure'} < 80)) {
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Blood_Pressure_Male_Stroke__80'}; }
            elsif(($YourProfile{'YourBloodPressure'} >= 80) and ($YourProfile{'YourBloodPressure'} <= 84)) {
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Blood_Pressure_Male_Stroke_80_84'}; }
            elsif(($YourProfile{'YourBloodPressure'} >= 85) and ($YourProfile{'YourBloodPressure'} <= 89)) {
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Blood_Pressure_Male_Stroke_85_89'}; }
            elsif(($YourProfile{'YourBloodPressure'} >= 90) and ($YourProfile{'YourBloodPressure'} <= 94)) {
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Blood_Pressure_Male_Stroke_90_94'}; }
            elsif(($YourProfile{'YourBloodPressure'} >= 95) and ($YourProfile{'YourBloodPressure'} <= 99)) {
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Blood_Pressure_Male_Stroke_95_99'}; }
            elsif(($YourProfile{'YourBloodPressure'} >= 100) and ($YourProfile{'YourBloodPressure'} <= 104)) {
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Blood_Pressure_Male_Stroke_100_104'}; }
            elsif(($YourProfile{'YourBloodPressure'} >= 105) and ($YourProfile{'YourBloodPressure'} <= 109)) {
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Blood_Pressure_Male_Stroke_105_109'}; }
            elsif($YourProfile{'YourBloodPressure'} >= 110) {
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Blood_Pressure_Male_Stroke___110'}; }
    }
}

if($YourProfile{'YourSex'} == 1) {
    for ($i = 0; $i < 120; $i++) { 
        if(($YourProfile{'YourBloodPressure'} >= 0) and ($YourProfile{'YourBloodPressure'} < 80)) {
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Blood_Pressure_Female_Stroke__80'}; }
            elsif(($YourProfile{'YourBloodPressure'} >= 80) and ($YourProfile{'YourBloodPressure'} <= 84)) {
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Blood_Pressure_Female_Stroke_80_84'}; }
            elsif(($YourProfile{'YourBloodPressure'} >= 85) and ($YourProfile{'YourBloodPressure'} <= 89)) {
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Blood_Pressure_Female_Stroke_85_89'}; }
            elsif(($YourProfile{'YourBloodPressure'} >= 90) and ($YourProfile{'YourBloodPressure'} <= 94)) {
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Blood_Pressure_Female_Stroke_90_94'}; }
            elsif(($YourProfile{'YourBloodPressure'} >= 95) and ($YourProfile{'YourBloodPressure'} <= 99)) {
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Blood_Pressure_Female_Stroke_95_99'}; }
            elsif(($YourProfile{'YourBloodPressure'} >= 100) and ($YourProfile{'YourBloodPressure'} <= 104)) {
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Blood_Pressure_Female_Stroke_100_104'}; }
            elsif(($YourProfile{'YourBloodPressure'} >= 105) and ($YourProfile{'YourBloodPressure'} <= 109)) {
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Blood_Pressure_Female_Stroke_105_109'}; }
            elsif($YourProfile{'YourBloodPressure'} >= 110) {
                $YourRisks[$i]{'Your_Table_Stroke'} = $YourRisks[$i]{'Your_Table_Stroke'} * $RelativeRisks{'Blood_Pressure_Female_Stroke___110'}; }
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
