#!/usr/bin/perl

sub gettable

{

local(@YourRisks);

if (($YourProfile{'YourSex'} == 0) and ($YourProfile{'YourRace'} == 0)) {
open(life_table, "WhiteMale.txt");
}
elsif (($YourProfile{'YourSex'} == 0) and ($YourProfile{'YourRace'} == 1)) {
open(life_table, "NonWhiteMale.txt");
}
elsif (($YourProfile{'YourSex'} == 1) and ($YourProfile{'YourRace'} == 0)) {
open(life_table, "WhiteFemale.txt");
}
elsif (($YourProfile{'YourSex'} == 1) and ($YourProfile{'YourRace'} == 1)) {
open(life_table, "NonWhiteFemale.txt");
}
else {
print "Are you an alien??????? \n";
die;
	}

    local($lifeline);
    
    $lifeline = <life_table>;  #eat header line

 
    for ($i = 0; $i < 120; $i++) 
	{	
	$lifeline = <life_table>;
	@words = split(' ', $lifeline);

	$YourRisks[$i]{'Your_Table_Rate'} = $words[3];
    	$YourRisks[$i]{'Your_Table_Lambda'} = $words[4];
    	$YourRisks[$i]{'Your_Table_Heart_Diseases'} = $words[5];
    	$YourRisks[$i]{'Your_Table_Stroke'} = $words[6];
    	$YourRisks[$i]{'Your_Table_COPD'} = $words[7];
    	$YourRisks[$i]{'Your_Table_Motor_Accidents'} = $words[8];
    	$YourRisks[$i]{'Your_Table_Other_Accidents'} = $words[9];
    	$YourRisks[$i]{'Your_Table_Pneumonia_Influenza'} = $words[10];
    	$YourRisks[$i]{'Your_Table_Diabetes'} = $words[11];
    	$YourRisks[$i]{'Your_Table_AIDS'} = $words[12];
    	$YourRisks[$i]{'Your_Table_Suicide'} = $words[13];
    	$YourRisks[$i]{'Your_Table_Cirrhosis'} = $words[14];
    	$YourRisks[$i]{'Your_Table_Homicide'} = $words[15];
    	$YourRisks[$i]{'Your_Table_Residual'} = $words[16];
    	$YourRisks[$i]{'Your_Table_Esophagus__Mouth__Pharynx'} = $words[17];
    	$YourRisks[$i]{'Your_Table_Stomach'} = $words[18];
    	$YourRisks[$i]{'Your_Table_Colorectal'} = $words[19];
    	$YourRisks[$i]{'Your_Table_Lung'} = $words[20];
    	$YourRisks[$i]{'Your_Table_Ovary'} = $words[21];
    	$YourRisks[$i]{'Your_Table_Prostate'} = $words[22];
    	$YourRisks[$i]{'Your_Table_Breast'} = $words[23];
    	$YourRisks[$i]{'Your_Table_Pancreas'} = $words[24];
    	$YourRisks[$i]{'Your_Table_Other_Cancers'} = $words[25];
	}


return @YourRisks;

};
1

