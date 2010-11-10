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
    print &PrintHeader;
    print "<BODY bgcolor=\"\#AFECDB\">";

print &HtmlPrintHead;

local(%checkboxes);
local(%Results);


  &ReadParse(*checks);
%checkboxes = %checks;

$YourProfileOriginal{'YourAge'} = $checkboxes{'a01'}; 
$YourProfileOriginal{'YourSex'} = $checkboxes{'a02'}; 
$YourProfileOriginal{'YourRace'} = $checkboxes{'a03'};  
$YourProfileOriginal{'YourHeight'} = $checkboxes{'a04'}; 
$YourProfileOriginal{'YourWeight'} = $checkboxes{'a05'}; 
$YourProfileOriginal{'YourBMI'} = $checkboxes{'a06'}; 
$YourProfileOriginal{'YourEducation'} = $checkboxes{'a07'}; 
$YourProfileOriginal{'YourIncome'} = $checkboxes{'a08'}; 
$YourProfileOriginal{'YourMaritalStatus'} = $checkboxes{'a09'};  
$YourProfileOriginal{'YourFitness'} = $checkboxes{'a10'};  
$YourProfileOriginal{'FamilyHeartDiseases'} = $checkboxes{'a11'}; 
$YourProfileOriginal{'FamilyProstate'} = $checkboxes{'a12'}; 
$YourProfileOriginal{'FamilyBreast'} = $checkboxes{'a13'}; 
$YourProfileOriginal{'FamilyColorectal'} = $checkboxes{'a14'};  
$YourProfileOriginal{'FamilyStomach'} = $checkboxes{'a15'}; 
$YourProfileOriginal{'FamilyLung'} = $checkboxes{'a16'}; 
$YourProfileOriginal{'FamilyDiabetes'} = $checkboxes{'a17'}; 
$YourProfileOriginal{'FamilyStroke'} = $checkboxes{'a18'}; 
$YourProfileOriginal{'YourGeography'} = $checkboxes{'a19'}; 
$YourProfileOriginal{'YourAIDSDiagnosis'} = $checkboxes{'a20'}; 
$YourProfileOriginal{'YourAIDSAZT'} = $checkboxes{'a21'}; 
$YourProfileOriginal{'YourAIDSPCP'} = $checkboxes{'a22'}; 
$YourProfileOriginal{'YourAsthma'} = $checkboxes{'a23'};  
$YourProfileOriginal{'YourDiabetes'} = $checkboxes{'a24'}; 
$YourProfileOriginal{'YourBloodPressure'} = $checkboxes{'a25'}; 
$YourProfileOriginal{'YourSmoking'} = $checkboxes{'a26'};  
$YourProfileOriginal{'YourSpouseSmoking'} = $checkboxes{'a27'}; 
$YourProfileOriginal{'YourAlcohol'} = $checkboxes{'a28'}; 
$YourProfileOriginal{'YourDrivingDistance'} = $checkboxes{'a29'};  
$YourProfileOriginal{'YourDriverSex'} = $checkboxes{'a30'};  
$YourProfileOriginal{'YourDriverAge'} = $checkboxes{'a31'}; 
$YourProfileOriginal{'YourDriverBelt'} = $checkboxes{'a32'}; 
$YourProfileOriginal{'YourDriverSpeed'} = $checkboxes{'a33'};  
$YourProfileOriginal{'YourDriverAlcohol'} = $checkboxes{'a34'}; 
$YourProfileOriginal{'YourStress'} = $checkboxes{'a35'}; 
$YourProfileOriginal{'YourExercise'} = $checkboxes{'a36'}; 
$YourProfileOriginal{'YourOccupation'} = $checkboxes{'a37'}; 
$YourProfileOriginal{'YourOccupationFather'} = $checkboxes{'a38'}; 
$YourProfileOriginal{'YourOccupationFirst'} = $checkboxes{'a39'}; 
$YourProfileOriginal{'YourOccupationLast'} = $checkboxes{'a40'}; 
$YourProfileOriginal{'YourNutrition'} = $checkboxes{'a41'}; 
$YourProfileOriginal{'YourFatIntake'} = $checkboxes{'a42'}; 
$YourProfileOriginal{'YourDepression'} = $checkboxes{'a43'}; 
$YourProfileOriginal{'YourSexualPartner'} = $checkboxes{'a44'}; 
$YourProfileOriginal{'YourCondomUse'} = $checkboxes{'a45'}; 
$YourProfileOriginal{'YourSleep'} = $checkboxes{'a46'};  


%YourProfile = %YourProfileOriginal;



if ($checkboxes{'smokingcheck'} eq 'ON') {
%YourProfile = %YourProfileOriginal;
$YourProfile{'YourSmoking'} = 0;
local(@YourRisks) = gettable();
local(%Constants) = getconstants();
local(%RelativeRisks) = getchoicerisk(%RelativeRisks);
local(%RelativeRisks) = getdemographicsrisk(%RelativeRisks);	
local(@YourRisks) = calcchoice(@YourRisks);
local(@YourRisks) = calcdemographics(@YourRisks);
local(%Results) = calclife(%Results);
$difference1 = $Results{'YourLifeExpectancy'} - $checkboxes{'originallife'};
if ($YourProfileOriginal{'YourSmoking'} ne 0) {
print 'If you do not smoke, your life expectancy would be ';
print sprintf("%.2f", $difference1);
print ' years longer';
}
else {
print 'Not smoking is a great choice! Your life expectancy is maximized by not smoking';
}
print &HtmlPrintLine;
%YourProfile = %YourProfileOriginal;
}


if ($checkboxes{'alcoholcheck'} eq 'ON') {
%YourProfile = %YourProfileOriginal;
$YourProfile{'YourAlcohol'} = 3;
local(@YourRisks) = gettable();
local(%Constants) = getconstants();
local(%RelativeRisks) = getchoicerisk(%RelativeRisks);
local(%RelativeRisks) = getdemographicsrisk(%RelativeRisks);	
local(@YourRisks) = calcchoice(@YourRisks);
local(@YourRisks) = calcdemographics(@YourRisks);
local(%Results) = calclife(%Results);
$difference2 = $Results{'YourLifeExpectancy'} - $checkboxes{'originallife'};
if ($YourProfileOriginal{'YourAlcohol'} ne 3) {
print 'If you have 2-3 drinks per day, your life expectancy would be ';
print sprintf("%.2f", $difference2);
print ' years longer';
}
else {
print 'Having 2-3 drinks a day has maximized your life expectancy';
}
print &HtmlPrintLine;
%YourProfile = %YourProfileOriginal;
}



if ($checkboxes{'drivingcheck'} eq 'ON') {
%YourProfile = %YourProfileOriginal;
$YourProfile{'YourDrivingDistance'} = 0;
$YourProfile{'YourDriverSex'} = 0;
$YourProfile{'YourDriverAge'} = 10;
local(@YourRisks) = gettable();
local(%Constants) = getconstants();
local(%RelativeRisks) = getchoicerisk(%RelativeRisks);
local(%RelativeRisks) = getdemographicsrisk(%RelativeRisks);	
local(@YourRisks) = calcchoice(@YourRisks);
local(@YourRisks) = calcdemographics(@YourRisks);
local(%Results) = calclife(%Results);
$difference3 = $Results{'YourLifeExpectancy'} - $checkboxes{'originallife'};
if ($YourProfileOriginal{'YourDrivingDistance'} ne 0) {
print 'If you do not drive, your life expectancy would be ';
print sprintf("%.2f", $difference3);
print ' years longer';
}
else {
print 'Not driving has maximized your life expectancy';
}
print &HtmlPrintLine;
%YourProfile = %YourProfileOriginal;
}




if ($checkboxes{'stresscheck'} eq 'ON') {
%YourProfile = %YourProfileOriginal;
$YourProfile{'YourStress'} = 0;
local(@YourRisks) = gettable();
local(%Constants) = getconstants();
local(%RelativeRisks) = getchoicerisk(%RelativeRisks);
local(%RelativeRisks) = getdemographicsrisk(%RelativeRisks);	
local(@YourRisks) = calcchoice(@YourRisks);
local(@YourRisks) = calcdemographics(@YourRisks);
local(%Results) = calclife(%Results);
$difference4 = $Results{'YourLifeExpectancy'} - $checkboxes{'originallife'};
if ($YourProfileOriginal{'YourStress'} ne 0) {
print 'If you do not have any stress listed in the table, your life expectancy would be ';
print sprintf("%.2f", $difference4);
print ' years longer';
}
else {
print 'Having a life free from major stress has maximized your life expectancy';
}
print &HtmlPrintLine;
%YourProfile = %YourProfileOriginal;
}



if ($checkboxes{'exercisecheck'} eq 'ON') {
%YourProfile = %YourProfileOriginal;
$YourProfile{'YourExercise'} = 2;
local(@YourRisks) = gettable();
local(%Constants) = getconstants();
local(%RelativeRisks) = getchoicerisk(%RelativeRisks);
local(%RelativeRisks) = getdemographicsrisk(%RelativeRisks);	
local(@YourRisks) = calcchoice(@YourRisks);
local(@YourRisks) = calcdemographics(@YourRisks);
local(%Results) = calclife(%Results);
$difference5 = $Results{'YourLifeExpectancy'} - $checkboxes{'originallife'};
if ($YourProfileOriginal{'YourExercise'} ne 2) {
print 'If you become a conditioning exercizer, your life expectancy would be ';
print sprintf("%.2f", $difference5);
print ' years longer';
}
else {
print 'Being a conditioning exercizer has maximized your life expectancy';
}
print &HtmlPrintLine;
%YourProfile = %YourProfileOriginal;
}




if ($checkboxes{'nutritioncheck'} eq 'ON') {
%YourProfile = %YourProfileOriginal;
$YourProfile{'YourNutrition'} = 5;
local(@YourRisks) = gettable();
local(%Constants) = getconstants();
local(%RelativeRisks) = getchoicerisk(%RelativeRisks);
local(%RelativeRisks) = getdemographicsrisk(%RelativeRisks);	
local(@YourRisks) = calcchoice(@YourRisks);
local(@YourRisks) = calcdemographics(@YourRisks);
local(%Results) = calclife(%Results);
$difference6 = $Results{'YourLifeExpectancy'} - $checkboxes{'originallife'};
if ($YourProfileOriginal{'YourNutrition'} ne 5) {
print 'If you consume all 5 types of food everyday, your life expectancy would be ';
print sprintf("%.2f", $difference6);
print ' years longer';
}
else {
print 'Consuming all 5 classes of food everyday has maximized your life expectancy';
}
print &HtmlPrintLine;
%YourProfile = %YourProfileOriginal;
}


    if ($checkboxes{'sexualcheck'} eq 'ON') {
	%YourProfile = %YourProfileOriginal;
	$YourProfile{'YourSexualPartner'} = 0;
	$YourProfile{'YourCondomUse'} = 0;
	local(@YourRisks) = gettable();
	local(%Constants) = getconstants();
	local(%RelativeRisks) = getchoicerisk(%RelativeRisks);
	local(%RelativeRisks) = getdemographicsrisk(%RelativeRisks);	
	local(@YourRisks) = calcchoice(@YourRisks);
	local(@YourRisks) = calcdemographics(@YourRisks);
	local(%Results) = calclife(%Results);
	$difference7 = $Results{'YourLifeExpectancy'} - $checkboxes{'originallife'};
	if ($YourProfileOriginal{'YourSexualPartner'} ne 0) {
	    print 'If you do not have any sexual partner, your life expectancy would be ';
	    print sprintf("%.2f", $difference7);
	    print ' years longer';
	}
	else {
	    print 'Not having any sexual partner has minimized your risk of AIDS';
	}
	print &HtmlPrintLine;
	%YourProfile = %YourProfileOriginal;
}


if ($checkboxes{'sleepcheck'} eq 'ON') {
%YourProfile = %YourProfileOriginal;
$YourProfile{'YourSleep'} = 7;
local(@YourRisks) = gettable();
local(%Constants) = getconstants();
local(%RelativeRisks) = getchoicerisk(%RelativeRisks);
local(%RelativeRisks) = getdemographicsrisk(%RelativeRisks);	
local(@YourRisks) = calcchoice(@YourRisks);
local(@YourRisks) = calcdemographics(@YourRisks);
local(%Results) = calclife(%Results);
$difference8 = $Results{'YourLifeExpectancy'} - $checkboxes{'originallife'};
if ($YourProfileOriginal{'YourSleep'} ne 7) {
print 'If you sleep 7 hours a day, your life expectancy would be ';
print sprintf("%.2f", $difference8);
print ' years longer';
}
else {
print 'Having between 7 and 8 hours of sleep a day has maximized your life expectancy';
}
print &HtmlPrintLine;
%YourProfile = %YourProfileOriginal;
}


print &HtmlPrintLine;


if ($checkboxes{'smokingcheck'} eq 'ON') {
$YourProfile{'YourSmoking'} = 0;
}
if ($checkboxes{'alcoholcheck'} eq 'ON') {
$YourProfile{'YourAlcohol'} = 3;
}
if ($checkboxes{'drivingcheck'} eq 'ON') {
$YourProfile{'YourDrivingDistance'} = 0;
$YourProfile{'YourDriverSex'} = 0;
$YourProfile{'YourDriverAge'} = 10;
}
if ($checkboxes{'stresscheck'} eq 'ON') {
$YourProfile{'YourStress'} = 0;
}
if ($checkboxes{'exercisecheck'} eq 'ON') {
$YourProfile{'YourExercise'} = 2;
}
if ($checkboxes{'nutritioncheck'} eq 'ON') {
$YourProfile{'YourNutrition'} = 5;
}
if ($checkboxes{'sexualcheck'} eq 'ON') {
$YourProfile{'YourSexualPartner'} = 0;
$YourProfile{'YourCondomUse'} = 0;
}
if ($checkboxes{'sleepcheck'} eq 'ON') {
$YourProfile{'YourSleep'} = 7;
}
local(@YourRisks) = gettable();
local(%Constants) = getconstants();
local(%RelativeRisks) = getchoicerisk(%RelativeRisks);
local(%RelativeRisks) = getdemographicsrisk(%RelativeRisks);	
local(@YourRisks) = calcchoice(@YourRisks);
local(@YourRisks) = calcdemographics(@YourRisks);
local(%Results) = calclife(%Results);
$difference9 = $Results{'YourLifeExpectancy'} - $checkboxes{'originallife'};
if ($Results{'YourLifeExpectancy'} ne $checkboxes{'originallife'}) {
print 'If all of the above choices are adopted, your life expectancy would be ';
print sprintf("%.2f", $difference9);
print ' years longer';
}
else {
print 'Congratulations! You have adopted the optimal lifestyle choices ';
print 'among all the variables that you have chosen to analyze';
}

print &HtmlPrintLine;
%YourProfile = %YourProfileOriginal;






sub HtmlPrintHead
{
  return <<END_OF_TEXT;
<html>
<head>
<title>Analysis Results</title>
</head>
<body>
<h3>Analysis Results</h3>
<h4>
END_OF_TEXT
}






sub HtmlPrintLine
{
  return <<END_OF_TEXT;
<br>
END_OF_TEXT
}




	

};
1
