#!/usr/local/bin/perl


require "cgi-lib.pl";

sub extractprofile
{
 



local(%YourProfile);
local(%profile);

#   READ IN ALL THE VARIABLES SET BY THE FORM
  &ReadParse(*input);
 %profile = %input;


$YourProfile{'YourAge'} = $profile{'age'};


if($profile{'sex'} eq 'male') { 	
    $YourProfile{'YourSex'} = 0;
}
else {
    $YourProfile{'YourSex'} = 1;
};



if($profile{'race'} eq 'white') {
	$YourProfile{'YourRace'} = 0;
	}
	else {
	$YourProfile{'YourRace'} = 1;
	};


if ($profile{'height'} eq '') { 
$YourProfile{'YourHeight'} = -1; }
else {
$YourProfile{'YourHeight'} = 0.0254 * $profile{'height'};
}


if ($profile{'weight'} eq '') { 
$YourProfile{'YourWeight'} = -1; }
else {
$YourProfile{'YourWeight'} = 0.45359237 * $profile{'weight'};
}

if ($YourProfile{'YourHeight'} > 0) {
$YourProfile{'YourBMI'} = ($YourProfile{'YourWeight'}) / ($YourProfile{'YourHeight'}**2);
}

if ($YourProfile{'YourWeight'} == -1) { 
$YourProfile{'YourBMI'} = -1; }



if($profile{'education'} eq 'less than 10') {
	$YourProfile{'YourEducation'} = 0;
	}
	elsif($profile{'education'} eq '10 to 11') {
	$YourProfile{'YourEducation'} = 1;
	}
	elsif($profile{'education'} eq 'more than 11') {
	$YourProfile{'YourEducation'} = 2;
	}
	else {
	$YourProfile{'YourEducation'} = -1;
	};



if ($profile{'income'} eq '') { 
$YourProfile{'YourIncome'} = -1; }
else {
$YourProfile{'YourIncome'} = $profile{'income'};
}

if($profile{'maritalstatus'} eq 'married') {
	$YourProfile{'YourMaritalStatus'} = 0;
	}
	elsif($profile{'maritalstatus'} eq 'not married') {
	$YourProfile{'YourMaritalStatus'} = 1;
	}
	else {
	$YourProfile{'YourMaritalStatus'} = -1;
	};


if($profile{'fitness'} eq '1st (least fit)') {
	$YourProfile{'YourFitness'} = 0;
	}
	elsif($profile{'fitness'} eq '2nd') {
	$YourProfile{'YourFitness'} = 1;
	}
	elsif($profile{'fitness'} eq '3rd') {
	$YourProfile{'YourFitness'} = 2;
	}
	elsif($profile{'fitness'} eq '4th') {
	$YourProfile{'YourFitness'} = 3; 
	}
	elsif($profile{'fitness'} eq '5th (fittest)') {
	$YourProfile{'YourFitness'} = 4;
	}
	else {
	$YourProfile{'YourFitness'} = -1;
	};







if($profile{'familyheartdiseases'} eq 'do not') {
	$YourProfile{'FamilyHeartDiseases'} = 0;
	}
	elsif($profile{'familyheartdiseases'} eq 'do') {
	$YourProfile{'FamilyHeartDiseases'} = 1;
	}
	else {
	$YourProfile{'FamilyHeartDiseases'} = -1;
	};



if($profile{'familyprostate'} eq 'do not') {
	$YourProfile{'FamilyProstate'} = 0;
	}
	elsif($profile{'familyprostate'} eq 'do') {
	$YourProfile{'FamilyProstate'} = 1;
	}
	else {
	$YourProfile{'FamilyProstate'} = -1;
	};





if($profile{'familybreast'} eq 'do not') {
	$YourProfile{'FamilyBreast'} = 0;
	}
	elsif($profile{'familybreast'} eq 'do') {
	$YourProfile{'FamilyBreast'} = 1;
	}
	else {
	$YourProfile{'FamilyBreast'} = -1;
	};


if($profile{'familycolorectal'} eq 'do not') {
	$YourProfile{'FamilyColorectal'} = 0;
	}
	elsif($profile{'familycolorectal'} eq 'do') {
	$YourProfile{'FamilyColorectal'} = 1;
	}
	else {
	$YourProfile{'FamilyColorectal'} = -1;
	};


if($profile{'familystomach'} eq 'do not') {
	$YourProfile{'FamilyStomach'} = 0;
	}
	elsif($profile{'familystomach'} eq 'do') {
	$YourProfile{'FamilyStomach'} = 1;
	}
	else {
	$YourProfile{'FamilyStomach'} = -1;
	};

if($profile{'familylung'} eq 'do not') {
	$YourProfile{'FamilyLung'} = 0;
	}
	elsif($profile{'familylung'} eq 'do') {
	$YourProfile{'FamilyLung'} = 1;
	}
	else {
	$YourProfile{'FamilyLung'} = -1;
	};


if($profile{'familydiabetes'} eq 'None') {
	$YourProfile{'FamilyDiabetes'} = 0;
	}
	elsif($profile{'familydiabetes'} eq 'One') {
	$YourProfile{'FamilyDiabetes'} = 1;
	}
	elsif($profile{'familydiabetes'} eq 'Two or more') {
	$YourProfile{'FamilyDiabetes'} = 2;
	}
	else {
	$YourProfile{'FamilyDiabetes'} = -1;
	};


if($profile{'familystroke'} eq 'do not') {
	$YourProfile{'FamilyStroke'} = 0;
	}
	elsif($profile{'familystroke'} eq 'do') {
	$YourProfile{'FamilyStroke'} = 1;
	}
	else {
	$YourProfile{'FamilyStroke'} = -1;
	};



if($profile{'geography'} eq 'Alabama') {
	$YourProfile{'YourGeography'} = 1;
	}
elsif($profile{'geography'} eq 'Alaska') {
	$YourProfile{'YourGeography'} = 2;
	}
elsif($profile{'geography'} eq 'Arizona') {
	$YourProfile{'YourGeography'} = 3;
	}
elsif($profile{'geography'} eq 'Arkansas') {
	$YourProfile{'YourGeography'} = 4;
	}
elsif($profile{'geography'} eq 'California') {
	$YourProfile{'YourGeography'} = 5;
	}
elsif($profile{'geography'} eq 'Colorado') {
	$YourProfile{'YourGeography'} = 6;
	}
elsif($profile{'geography'} eq 'Connecticut') {
	$YourProfile{'YourGeography'} = 7;
	}
elsif($profile{'geography'} eq 'Delaware') {
	$YourProfile{'YourGeography'} = 8;
	}
elsif($profile{'geography'} eq 'District of Columbia') {
	$YourProfile{'YourGeography'} = 9;
	}
elsif($profile{'geography'} eq 'Florida') {
	$YourProfile{'YourGeography'} = 10;
	}
elsif($profile{'geography'} eq 'Georgia') {
	$YourProfile{'YourGeography'} = 11;
	}
elsif($profile{'geography'} eq 'Hawaii') {
	$YourProfile{'YourGeography'} = 12;
	}
elsif($profile{'geography'} eq 'Idaho') {
	$YourProfile{'YourGeography'} = 13;
	}
elsif($profile{'geography'} eq 'Illnois') {
	$YourProfile{'YourGeography'} = 14;
	}
elsif($profile{'geography'} eq 'Indiana') {
	$YourProfile{'YourGeography'} = 15;
	}
elsif($profile{'geography'} eq 'Iowa') {
	$YourProfile{'YourGeography'} = 16;
	}
elsif($profile{'geography'} eq 'Kansas') {
	$YourProfile{'YourGeography'} = 17;
	}
elsif($profile{'geography'} eq 'Kentucky') {
	$YourProfile{'YourGeography'} = 18;
	}
elsif($profile{'geography'} eq 'Louisiana') {
	$YourProfile{'YourGeography'} = 19;
	}
elsif($profile{'geography'} eq 'Maine') {
	$YourProfile{'YourGeography'} = 20;
	}
elsif($profile{'geography'} eq 'Maryland') {
	$YourProfile{'YourGeography'} = 21;
	}
elsif($profile{'geography'} eq 'Massachusetts') {
	$YourProfile{'YourGeography'} = 22;
	}
elsif($profile{'geography'} eq 'Michigan') {
	$YourProfile{'YourGeography'} = 23;
	}
elsif($profile{'geography'} eq 'Minnesota') {
	$YourProfile{'YourGeography'} = 24;
	}
elsif($profile{'geography'} eq 'Mississippi') {
	$YourProfile{'YourGeography'} = 25;
	}
elsif($profile{'geography'} eq 'Missouri') {
	$YourProfile{'YourGeography'} = 26;
	}
elsif($profile{'geography'} eq 'Montana') {
	$YourProfile{'YourGeography'} = 27;
	}
elsif($profile{'geography'} eq 'Nebraska') {
	$YourProfile{'YourGeography'} = 28;
	}
elsif($profile{'geography'} eq 'Nevada') {
	$YourProfile{'YourGeography'} = 29;
	}
elsif($profile{'geography'} eq 'New Hampshire') {
	$YourProfile{'YourGeography'} = 30;
	}
elsif($profile{'geography'} eq 'New Jersey') {
	$YourProfile{'YourGeography'} = 31;
	} 
elsif($profile{'geography'} eq 'New Mexico') {
	$YourProfile{'YourGeography'} = 32;
	}
elsif($profile{'geography'} eq 'New York') {
	$YourProfile{'YourGeography'} = 33;
	}
elsif($profile{'geography'} eq 'North Carolina') {
	$YourProfile{'YourGeography'} = 34;
	}
elsif($profile{'geography'} eq 'North Dakota') {
	$YourProfile{'YourGeography'} = 35;
	}
elsif($profile{'geography'} eq 'Ohio') {
	$YourProfile{'YourGeography'} = 36;
	}
elsif($profile{'geography'} eq 'Oklahoma') {
	$YourProfile{'YourGeography'} = 37;
	}
elsif($profile{'geography'} eq 'Oregon') {
	$YourProfile{'YourGeography'} = 38;
	}
elsif($profile{'geography'} eq 'Pennsylvania') {
	$YourProfile{'YourGeography'} = 39;
	}
elsif($profile{'geography'} eq 'Rhode Island') {
	$YourProfile{'YourGeography'} = 40;
	}
elsif($profile{'geography'} eq 'South Carolina') {
	$YourProfile{'YourGeography'} = 41;
	}
elsif($profile{'geography'} eq 'South Dakota') {
	$YourProfile{'YourGeography'} = 42;
	}
elsif($profile{'geography'} eq 'Tennessee') {
	$YourProfile{'YourGeography'} = 43;
	}
elsif($profile{'geography'} eq 'Texas') {
	$YourProfile{'YourGeography'} = 44;
	}
elsif($profile{'geography'} eq 'Utah') {
	$YourProfile{'YourGeography'} = 45;
	}
elsif($profile{'geography'} eq 'Vermont') {
	$YourProfile{'YourGeography'} = 46;
	}
elsif($profile{'geography'} eq 'Virginia') {
	$YourProfile{'YourGeography'} = 47;
	}
elsif($profile{'geography'} eq 'Washington') {
	$YourProfile{'YourGeography'} = 48;
	}
elsif($profile{'geography'} eq 'West Virginia') {
	$YourProfile{'YourGeography'} = 49;
	}
elsif($profile{'geography'} eq 'Wisconsin') {
	$YourProfile{'YourGeography'} = 50;
	}
elsif($profile{'geography'} eq 'Wyoming') {
	$YourProfile{'YourGeography'} = 51;
	}
else {
	$YourProfile{'YourGeography'} = -1;
	}






if($profile{'aidsdiagnosis'} eq 'have not') {
	$YourProfile{'YourAIDSDiagnosis'} = 0;
	}
elsif($profile{'aidsdiagnosis'} eq 'have') {
	$YourProfile{'YourAIDSDiagnosis'} = 1;
	}
else {
	$YourProfile{'YourAIDSDiagnosis'} = -1;
	}



if($profile{'aidsazt'} eq 'do not') {
	$YourProfile{'YourAIDSAZT'} = 0;
	}
elsif($profile{'aidsazt'} eq 'do') {
	$YourProfile{'YourAIDSAZT'} = 1;
	}
else {
	$YourProfile{'YourAIDSAZT'} = -1;
	}


if($profile{'aidspcp'} eq 'do not') {
	$YourProfile{'YourAIDSPCP'} = 0;
	}
elsif($profile{'aidspcp'} eq 'do') {
	$YourProfile{'YourAIDSPCP'} = 1;
	}
else {
	$YourProfile{'YourAIDSPCP'} = -1;
	}

if($profile{'asthma'} eq 'have not') {
	$YourProfile{'YourAsthma'} = 0;
	}
elsif($profile{'asthma'} eq 'have') {
	$YourProfile{'YourAsthma'} = 1;
	}
else {
	$YourProfile{'YourAsthma'} = -1;
	}

if($profile{'diabetes'} eq 'have not') {
	$YourProfile{'YourDiabetes'} = 0;
	}
elsif($profile{'diabetes'} eq 'have') {
	$YourProfile{'YourDiabetes'} = 1;
	}
else {
	$YourProfile{'YourDiabetes'} = -1;
	}


if ($profile{'bloodpressure'} eq '') { 
$YourProfile{'YourBloodPressure'} = -1; }
else {
$YourProfile{'YourBloodPressure'} = $profile{'bloodpressure'};
}


if ($profile{'smoking'} eq '') { 
$YourProfile{'YourSmoking'} = -1; }
else {
$YourProfile{'YourSmoking'} = $profile{'smoking'};
}



if ($profile{'spousesmoking'} eq '') { 
$YourProfile{'YourSpouseSmoking'} = -1; }
else {
$YourProfile{'YourSpouseSmoking'} = $profile{'spousesmoking'};
}



if($profile{'alcohol'} eq '0 or negligible') {
	$YourProfile{'YourAlcohol'} = 0;
	}
elsif($profile{'alcohol'} eq 'less than 1') {
	$YourProfile{'YourAlcohol'} = 1;
	}
elsif($profile{'alcohol'} eq '1') {
	$YourProfile{'YourAlcohol'} = 2;
	}
elsif($profile{'alcohol'} eq '2 to 3') {
	$YourProfile{'YourAlcohol'} = 3;
	}
elsif($profile{'alcohol'} eq '4 or more') {
	$YourProfile{'YourAlcohol'} = 4;
	}
else {
	$YourProfile{'YourAlcohol'} = -1;
	};



if ($profile{'drivingdistance'} eq '') { 
$YourProfile{'YourDrivingDistance'} = -1; }
else {
$YourProfile{'YourDrivingDistance'} = $profile{'drivingdistance'};
}



if($profile{'driversex'} eq 'male') {
	$YourProfile{'YourDriverSex'} = 0;
	}
	elsif($profile{'driversex'} eq 'female') {
	$YourProfile{'YourDriverSex'} = 1;
	}
	else {
	$YourProfile{'YourDriverSex'} = -1;
	};



if ($profile{'driverage'} eq '') { 
$YourProfile{'YourDriverAge'} = -1; }
else {
$YourProfile{'YourDriverAge'} = $profile{'driverage'};
}




if($profile{'driverbelt'} eq 'do not') {
	$YourProfile{'YourDriverBelt'} = 0;
	}
elsif($profile{'driverbelt'} eq 'do') {
	$YourProfile{'YourDriverBelt'} = 1;
	}
else {
	$YourProfile{'YourDriverBelt'} = -1;
	}



if($profile{'driverspeed'} eq 'do not') {
	$YourProfile{'YourDriverSpeed'} = 0;
	}
elsif($profile{'driverspeed'} eq 'do') {
	$YourProfile{'YourDriverSpeed'} = 1;
	}
else {
	$YourProfile{'YourDriverSpeed'} = -1;
	}



if($profile{'driveralcohol'} eq 'sometimes') {
	$YourProfile{'YourDriverAlcohol'} = 0;
	}
elsif($profile{'driveralcohol'} eq 'never') {
	$YourProfile{'YourDriverAlcohol'} = 1;
	}
else {
	$YourProfile{'YourDriverAlcohol'} = -1;
	}


if ($profile{'stress'} eq '') { 
$YourProfile{'YourStress'} = -1; }
else {
$YourProfile{'YourStress'} = $profile{'stress'};
}


if($profile{'exercise'} eq 'sedentary person') {
	$YourProfile{'YourExercise'} = 0;
	}
	elsif($profile{'exercise'} eq 'occasional exercizer') {
	$YourProfile{'YourExercise'} = 1;
	}
	elsif($profile{'exercise'} eq 'conditioning exercizer') {
	$YourProfile{'YourExercise'} = 2;
	}
	else {
	$YourProfile{'YourExercise'} = -1;
	};




if($profile{'occupation'} eq 'mining') {
	$YourProfile{'YourOccupation'} = 1;
	}
elsif($profile{'occupation'} eq 'construction') {
	$YourProfile{'YourOccupation'} = 2;
	}
elsif($profile{'occupation'} eq 'transportation/public utilities') {
	$YourProfile{'YourOccupation'} = 3;
	}
elsif($profile{'occupation'} eq 'agriculture/forestry/fishing') {
	$YourProfile{'YourOccupation'} = 4;
	}
elsif($profile{'occupation'} eq 'public administration') {
	$YourProfile{'YourOccupation'} = 5;
	}
elsif($profile{'occupation'} eq 'manufacturing') {
	$YourProfile{'YourOccupation'} = 6;
	}
elsif($profile{'occupation'} eq 'retail trade') {
	$YourProfile{'YourOccupation'} = 7;
	}
elsif($profile{'occupation'} eq 'services') {
	$YourProfile{'YourOccupation'} = 8;
	}
elsif($profile{'occupation'} eq 'wholesale trade') {
	$YourProfile{'YourOccupation'} = 9;
	}
elsif($profile{'occupation'} eq 'finance/real estate') {
	$YourProfile{'YourOccupation'} = 10;
	}
elsif($profile{'occupation'} eq 'all others') {
	$YourProfile{'YourOccupation'} = 0;
	}
else {
	$YourProfile{'YourOccupation'} = -1;
	};





if($profile{'occupationfather'} eq 'non-manual') {
	$YourProfile{'YourOccupationFather'} = 0;
	}
elsif($profile{'occupationfather'} eq 'manual') {
	$YourProfile{'YourOccupationFather'} = 1;
	}
else {
	$YourProfile{'YourOccupationFather'} = -3;
	}


if($profile{'occupationfirst'} eq 'non-manual') {
	$YourProfile{'YourOccupationFirst'} = 0;
	}
elsif($profile{'occupationfirst'} eq 'manual') {
	$YourProfile{'YourOccupationFirst'} = 1;
	}
else {
	$YourProfile{'YourOccupationFirst'} = -3;
	}

if($profile{'occupationlast'} eq 'non-manual') {
	$YourProfile{'YourOccupationLast'} = 0;
	}
elsif($profile{'occupationlast'} eq 'manual') {
	$YourProfile{'YourOccupationLast'} = 1;
	}
else {
	$YourProfile{'YourOccupationLast'} = -3;
	}

if ($profile{'nutrition'} eq '') { 
$YourProfile{'YourNutrition'} = -1; }
else {
$YourProfile{'YourNutrition'} = $profile{'nutrition'};
}

if($profile{'fatintake'} eq 'more') {
	$YourProfile{'YourFatIntake'} = 0;
	}
elsif($profile{'fatintake'} eq 'less') {
	$YourProfile{'YourFatIntake'} = 1;
	}
else {
	$YourProfile{'YourFatIntake'} = -1;
	}

if($profile{'depression'} eq 'am not') {
    $YourProfile{'YourDepression'} = 0;
}
elsif($profile{'depression'} eq 'am') {
    $YourProfile{'YourDepression'} = 1;
}
else {
    $YourProfile{'YourDepression'} = -1;
}



if ($profile{'sexualpartner'} eq '') { 
    $YourProfile{'YourSexualPartner'} = -1; }
else {
    $YourProfile{'YourSexualPartner'} = $profile{'sexualpartner'};
}


if($profile{'condomuse'} eq 'do not') {
	$YourProfile{'YourCondomUse'} = 0;
	}
elsif($profile{'condomuse'} eq 'do') {
	$YourProfile{'YourCondomUse'} = 1;
	}
else {
	$YourProfile{'YourCondomUse'} = -1;
	}

if ($profile{'sleep'} eq '') { 
$YourProfile{'YourSleep'} = -1; }
else {
$YourProfile{'YourSleep'} = $profile{'sleep'};
}

    return %YourProfile;
}


1

