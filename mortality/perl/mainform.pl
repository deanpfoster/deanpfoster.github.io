#!/usr/bin/perl

require "cgi-lib.pl";
require "extractprofile.pl";
require "gettable.pl";
require "getconstants.pl";
require "getchoicerisk.pl";
require "getdemographicsrisk.pl";
require "calcchoice.pl";
require "calcdemographics.pl";
require "calclife.pl";

MAIN:
{
   
# PRINT THE HEADER

      print &PrintHeader;
      print "<BODY bgcolor=\"\#AFECDB\">";
    # print &HtmlTop("Life expectancy results");    




  	local(%YourProfile) = extractprofile();
	local(@YourRisks) = gettable();
	local(%Constants) = getconstants();
   	local(%RelativeRisks) = getchoicerisk(%RelativeRisks);
	local(%RelativeRisks) = getdemographicsrisk(%RelativeRisks);	
	local(@YourRisks) = calcchoice(@YourRisks);
    	local(@YourRisks) = calcdemographics(@YourRisks);
	local(%Results) = calclife(%Results);


print &HtmlPrint1;
print 'Life Expectancy: ';
print sprintf("%.2f", $Results{'YourLifeExpectancy'});
print &HtmlPrint2;
print	'Lower Quartile : ';
print sprintf("%.2f", $Results{'LowerQuartile'});
print &HtmlPrint2;
print 'Median Lifetime: ';
print sprintf("%.2f", $Results{'Median'});
print &HtmlPrint2;
print 'Upper Quartile : ';
print sprintf("%.2f", $Results{'UpperQuartile'});


print '<FORM ACTION="analyze.pl" Method="get">';

print &HtmlAnalyze;



  print '<INPUT TYPE="submit" VALUE="Analyze health risks"></FORM>';










sub HtmlPrint1
{
  return <<END_OF_TEXT;
<html>
<head>
<title>Life Expectancy Results</title>
</head>
<body>
<h3>Life Expectancy Results</h3>
<h4>
END_OF_TEXT
}






sub HtmlPrint2
{
  return <<END_OF_TEXT;
<br>
END_OF_TEXT
}


sub HtmlAnalyze
{
  return <<END_OF_TEXT;
<hr>

Analyze Your Health Risks: Check the categories that you want to analyze
<br>

<input type="checkbox" name="smokingcheck" value="ON">Smoking<br>
<input type="checkbox" name="alcoholcheck" value="ON">Alcohol<br>
<input type="checkbox" name="drivingcheck" value="ON">Driving<br>
<input type="checkbox" name="stresscheck" value="ON">Stress<br>
<input type="checkbox" name="exercisecheck" value="ON">Exercise<br>
<input type="checkbox" name="nutritioncheck" value="ON">Nutrition<br>
<input type="checkbox" name="sexualcheck" value="ON">Sexual Partners<br>
<input type="checkbox" name="sleepcheck" value="ON">Sleep<br>

<input type="hidden" name="originallife" value=$Results{'YourLifeExpectancy'}>
<input type="hidden" name="a01" value=$YourProfile{'YourAge'}>
<input type="hidden" name="a02" value=$YourProfile{'YourSex'}> 
<input type="hidden" name="a03" value=$YourProfile{'YourRace'}> 
<input type="hidden" name="a04" value=$YourProfile{'YourHeight'}> 
<input type="hidden" name="a05" value=$YourProfile{'YourWeight'}>
<input type="hidden" name="a06" value=$YourProfile{'YourBMI'}> 
<input type="hidden" name="a07" value=$YourProfile{'YourEducation'}>
<input type="hidden" name="a08" value=$YourProfile{'YourIncome'}> 
<input type="hidden" name="a09" value=$YourProfile{'YourMaritalStatus'}> 
<input type="hidden" name="a10" value=$YourProfile{'YourFitness'}> 
<input type="hidden" name="a11" value=$YourProfile{'FamilyHeartDiseases'}> 
<input type="hidden" name="a12" value=$YourProfile{'FamilyProstate'}>
<input type="hidden" name="a13" value=$YourProfile{'FamilyBreast'}>
<input type="hidden" name="a14" value=$YourProfile{'FamilyColorectal'}> 
<input type="hidden" name="a15" value=$YourProfile{'FamilyStomach'}>
<input type="hidden" name="a16" value=$YourProfile{'FamilyLung'}> 
<input type="hidden" name="a17" value=$YourProfile{'FamilyDiabetes'}> 
<input type="hidden" name="a18" value=$YourProfile{'FamilyStroke'}>
<input type="hidden" name="a19" value=$YourProfile{'YourGeography'}> 
<input type="hidden" name="a20" value=$YourProfile{'YourAIDSDiagnosis'}> 
<input type="hidden" name="a21" value=$YourProfile{'YourAIDSAZT'}> 
<input type="hidden" name="a22" value=$YourProfile{'YourAIDSPCP'}>
<input type="hidden" name="a23" value=$YourProfile{'YourAsthma'}> 
<input type="hidden" name="a24" value=$YourProfile{'YourDiabetes'}> 
<input type="hidden" name="a25" value=$YourProfile{'YourBloodPressure'}> 
<input type="hidden" name="a26" value=$YourProfile{'YourSmoking'}> 
<input type="hidden" name="a27" value=$YourProfile{'YourSpouseSmoking'}> 
<input type="hidden" name="a28" value=$YourProfile{'YourAlcohol'}> 
<input type="hidden" name="a29" value=$YourProfile{'YourDrivingDistance'}> 
<input type="hidden" name="a30" value=$YourProfile{'YourDriverSex'}> 
<input type="hidden" name="a31" value=$YourProfile{'YourDriverAge'}> 
<input type="hidden" name="a32" value=$YourProfile{'YourDriverBelt'}>
<input type="hidden" name="a33" value=$YourProfile{'YourDriverSpeed'}> 
<input type="hidden" name="a34" value=$YourProfile{'YourDriverAlcohol'}>
<input type="hidden" name="a35" value=$YourProfile{'YourStress'}> 
<input type="hidden" name="a36" value=$YourProfile{'YourExercise'}>
<input type="hidden" name="a37" value=$YourProfile{'YourOccupation'}> 
<input type="hidden" name="a38" value=$YourProfile{'YourOccupationFather'}> 
<input type="hidden" name="a39" value=$YourProfile{'YourOccupationFirst'}>
<input type="hidden" name="a40" value=$YourProfile{'YourOccupationLast'}>
<input type="hidden" name="a41" value=$YourProfile{'YourNutrition'}> 
<input type="hidden" name="a42" value=$YourProfile{'YourFatIntake'}> 
<input type="hidden" name="a43" value=$YourProfile{'YourDepression'}> 
<input type="hidden" name="a44" value=$YourProfile{'YourSexualPartner'}> 
<input type="hidden" name="a45" value=$YourProfile{'YourCondomUse'}> 
<input type="hidden" name="a46" value=$YourProfile{'YourSleep'}> 


END_OF_TEXT
}







};
1
