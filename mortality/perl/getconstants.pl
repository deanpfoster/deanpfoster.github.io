#!/usr/bin/perl

sub getconstants

{

local(%Constants);

open(constant_table, "Constants.txt");

    local($constantline);
    
$constantline = <constant_table>;  #eat header line

		
$constantline = <constant_table>;
@constantwords = split (/\s+/, $constantline);
$Constants{'Mean_Height_Male'} = $constantwords[1];

$constantline = <constant_table>;
@constantwords = split (/\s+/, $constantline);
$Constants{'Mean_Height_Female'} = $constantwords[1];

$constantline = <constant_table>;
@constantwords = split (/\s+/, $constantline);
$Constants{'Male_Condom_Use'} = $constantwords[1];

$constantline = <constant_table>;
@constantwords = split (/\s+/, $constantline);
$Constants{'Female_Condom_Use'} = $constantwords[1];

$constantline = <constant_table>;
@constantwords = split (/\s+/, $constantline);
$Constants{'Condom_Effectiveness'} = $constantwords[1];

$constantline = <constant_table>;
@constantwords = split (/\s+/, $constantline);
$Constants{'Male_Mean_Sexual_Partner_in_past_Year'} = $constantwords[1];

$constantline = <constant_table>;
@constantwords = split (/\s+/, $constantline);
$Constants{'Female_Mean_Sexual_Partner_in_past_Year'} = $constantwords[1];

$constantline = <constant_table>;
@constantwords = split (/\s+/, $constantline);
$Constants{'Mean_AIDS_survival_time'} = $constantwords[1];

$constantline = <constant_table>;
@constantwords = split (/\s+/, $constantline);
$Constants{'Given_AIDS____die_of_AIDS'} = $constantwords[1];

$constantline = <constant_table>;
@constantwords = split (/\s+/, $constantline);
$Constants{'Mean_Income'} = $constantwords[1];

$constantline = <constant_table>;
@constantwords = split (/\s+/, $constantline);
$Constants{'Men_s_BMI_Quartile_1___2_Divider'} = $constantwords[1];

$constantline = <constant_table>;
@constantwords = split (/\s+/, $constantline);
$Constants{'Men_s_BMI_Quartile_2___3_Divider'} = $constantwords[1];

$constantline = <constant_table>;
@constantwords = split (/\s+/, $constantline);
$Constants{'Men_s_BMI_Quartile_3___4_Divider'} = $constantwords[1];

$constantline = <constant_table>;
@constantwords = split (/\s+/, $constantline);
$Constants{'Women_s_BMI_Quartile_1___2_Divider'} = $constantwords[1];

$constantline = <constant_table>;
@constantwords = split (/\s+/, $constantline);
$Constants{'Women_s_BMI_Quartile_2___3_Divider'} = $constantwords[1];

$constantline = <constant_table>;
@constantwords = split (/\s+/, $constantline);
$Constants{'Women_s_BMI_Quartile_3___4_Divider'} = $constantwords[1];

$constantline = <constant_table>;
@constantwords = split (/\s+/, $constantline);
$Constants{'Occupation_Class'} = $constantwords[1];




return(%Constants);

};
1

