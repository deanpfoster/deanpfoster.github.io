#!/usr/bin/perl

sub calclife

{



local (%Results) = @_;

$Results{'YourLifeExpectancy'} = 0;	
$TempProduct[$YourProfile{'YourAge'}] = 1;

    for ($i = $YourProfile{'YourAge'}; $i < 120; $i++) 
	{	

	$YourRisks[$i]{'Your_Table_Final_Lambda'} = ($YourRisks[$i]{'Your_Table_Heart_Diseases'} + $YourRisks[$i]{'Your_Table_Stroke'} + $YourRisks[$i]{'Your_Table_COPD'} + $YourRisks[$i]{'Your_Table_Motor_Accidents'} + $YourRisks[$i]{'Your_Table_Other_Accidents'} + $YourRisks[$i]{'Your_Table_Pneumonia_Influenza'} + $YourRisks[$i]{'Your_Table_Diabetes'} + $YourRisks[$i]{'Your_Table_AIDS'} + $YourRisks[$i]{'Your_Table_Suicide'} + $YourRisks[$i]{'Your_Table_Cirrhosis'} + $YourRisks[$i]{'Your_Table_Homicide'} + $YourRisks[$i]{'Your_Table_Residual'} + $YourRisks[$i]{'Your_Table_Esophagus__Mouth__Pharynx'} + $YourRisks[$i]{'Your_Table_Stomach'} + $YourRisks[$i]{'Your_Table_Colorectal'} + $YourRisks[$i]{'Your_Table_Lung'} + $YourRisks[$i]{'Your_Table_Ovary'} + $YourRisks[$i]{'Your_Table_Prostate'} + $YourRisks[$i]{'Your_Table_Breast'} + $YourRisks[$i]{'Your_Table_Pancreas'} + $YourRisks[$i]{'Your_Table_Other_Cancers'}) ;


 $Results{'YourLifeExpectancy'} = ($Results{'YourLifeExpectancy'} + ($TempProduct[$i] * (-1 * exp(-1*$YourRisks[$i]{'Your_Table_Final_Lambda'}) - ((exp(-1*$YourRisks[$i]{'Your_Table_Final_Lambda'}))/$YourRisks[$i]{'Your_Table_Final_Lambda'}) + 1/$YourRisks[$i]{'Your_Table_Final_Lambda'} + $i - $i* (exp(-1*$YourRisks[$i]{'Your_Table_Final_Lambda'}))))); 



$Probability[$i] = exp(-1 * $YourRisks[$i]{'Your_Table_Final_Lambda'});
$TempProduct[$i + 1] = $TempProduct[$i] * $Probability[$i];


if (($TempProduct[$i + 1] <= 0.75) and ($TempProduct[$i] > 0.75)) {
	$Results{'LowerQuartile'} = ((log($TempProduct[$i])-log(0.75))/$YourRisks[$i]{'Your_Table_Final_Lambda'} + $i); }
if (($TempProduct[$i + 1] <= 0.50) and ($TempProduct[$i] > 0.50)) {
	$Results{'Median'} = ((log($TempProduct[$i])-log(0.50))/$YourRisks[$i]{'Your_Table_Final_Lambda'} + $i); }
if (($TempProduct[$i + 1] <= 0.25) and ($TempProduct[$i] > 0.25)) {
	$Results{'UpperQuartile'} = ((log($TempProduct[$i])-log(0.25))/$YourRisks[$i]{'Your_Table_Final_Lambda'} + $i); }



	}

 

return (%Results);

};
1

