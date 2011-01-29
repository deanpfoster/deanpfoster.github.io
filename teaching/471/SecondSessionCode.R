##NOTE: lines beginning with [1] are outputs from R on my machine

#Make sure you are in the same working directory as the data file
getwd(); #get the current directory
[1] "S:/Stat471"
 
dir(); #list contents of current directory
[1] "events.csv"

#read in the data file
#header=TRUE tells R to consider the first row of the data file
#to be the column names of the dataset
events.data = read.csv('events.csv',header=TRUE);

#sanity checks to make sure the data was read correctly 
class(events.data)
[1] "data.frame"

dim(events.data)
[1] 120   7

colnames(events.data)
[1] "DATE"   "GPU"    "MARK76" "RKFR76" "DOW"    "DUPONT" "CONOCO"

#access the second column in the data using column number
events.data[,2]
  [1]  0.05412 -0.01429  0.01449 -0.01886 -0.01493  0.01515  0.05493
  [8]  0.05797  0.04110 -0.01737  0.00685  0.06122  0.02154 -0.05769
 [15]  0.02041  0.02240  0.04000  0.02564  0.02824  0.02659  0.02424
 [22] -0.03243  0.04375  0.00000 -0.06874  0.01974  0.02581 -0.00931
 [29] -0.03247 -0.00671  0.04405 -0.04636  0.03472 -0.07651  0.04478
 [36]  0.00000  0.05429 -0.05556 -0.04412 -0.33077 -0.17241  0.15714
 [43] -0.01235  0.00000 -0.07692 -0.08333  0.00000  0.07813 -0.05797
 [50] -0.24615 -0.30612  0.38235  0.06383 -0.06000  0.08511 -0.19608
 [57]  0.02439 -0.09524 -0.05263  0.11111 -0.15000  0.05882 -0.08333
 [64]  0.15152  0.00000  0.10526 -0.07143 -0.05128  0.05405  0.10256
 [71]  0.18605  0.05882 -0.12963 -0.17021 -0.05128  0.13514 -0.04762
 [78] -0.02500  0.10256  0.09302 -0.02128  0.10870 -0.01961  0.08000
 [85]  0.18519 -0.03125  0.00000  0.16129  0.02778 -0.01351 -0.04110
 [92]  0.00000 -0.07143 -0.07692  0.06667 -0.03125 -0.01613  0.03279
 [99]  0.04762 -0.01515  0.07692  0.02857  0.08333  0.02564  0.01250
[106]  0.08642  0.02273  0.02222  0.00000  0.08696 -0.04000 -0.01042
[113]  0.17895  0.00893 -0.06195  0.08491 -0.04348  0.14545  0.03175
[120]  0.04615
 
 
#access the second column in the data using column name i.e. GPU
events.data[,"GPU"]
  [1]  0.05412 -0.01429  0.01449 -0.01886 -0.01493  0.01515  0.05493
  [8]  0.05797  0.04110 -0.01737  0.00685  0.06122  0.02154 -0.05769
 [15]  0.02041  0.02240  0.04000  0.02564  0.02824  0.02659  0.02424
 [22] -0.03243  0.04375  0.00000 -0.06874  0.01974  0.02581 -0.00931
 [29] -0.03247 -0.00671  0.04405 -0.04636  0.03472 -0.07651  0.04478
 [36]  0.00000  0.05429 -0.05556 -0.04412 -0.33077 -0.17241  0.15714
 [43] -0.01235  0.00000 -0.07692 -0.08333  0.00000  0.07813 -0.05797
 [50] -0.24615 -0.30612  0.38235  0.06383 -0.06000  0.08511 -0.19608
 [57]  0.02439 -0.09524 -0.05263  0.11111 -0.15000  0.05882 -0.08333
 [64]  0.15152  0.00000  0.10526 -0.07143 -0.05128  0.05405  0.10256
 [71]  0.18605  0.05882 -0.12963 -0.17021 -0.05128  0.13514 -0.04762
 [78] -0.02500  0.10256  0.09302 -0.02128  0.10870 -0.01961  0.08000
 [85]  0.18519 -0.03125  0.00000  0.16129  0.02778 -0.01351 -0.04110
 [92]  0.00000 -0.07143 -0.07692  0.06667 -0.03125 -0.01613  0.03279
 [99]  0.04762 -0.01515  0.07692  0.02857  0.08333  0.02564  0.01250
[106]  0.08642  0.02273  0.02222  0.00000  0.08696 -0.04000 -0.01042
[113]  0.17895  0.00893 -0.06195  0.08491 -0.04348  0.14545  0.03175
[120]  0.04615
 

#another way to access the second column using column name. Note: no quotes here
events.data$GPU
  [1]  0.05412 -0.01429  0.01449 -0.01886 -0.01493  0.01515  0.05493
  [8]  0.05797  0.04110 -0.01737  0.00685  0.06122  0.02154 -0.05769
 [15]  0.02041  0.02240  0.04000  0.02564  0.02824  0.02659  0.02424
 [22] -0.03243  0.04375  0.00000 -0.06874  0.01974  0.02581 -0.00931
 [29] -0.03247 -0.00671  0.04405 -0.04636  0.03472 -0.07651  0.04478
 [36]  0.00000  0.05429 -0.05556 -0.04412 -0.33077 -0.17241  0.15714
 [43] -0.01235  0.00000 -0.07692 -0.08333  0.00000  0.07813 -0.05797
 [50] -0.24615 -0.30612  0.38235  0.06383 -0.06000  0.08511 -0.19608
 [57]  0.02439 -0.09524 -0.05263  0.11111 -0.15000  0.05882 -0.08333
 [64]  0.15152  0.00000  0.10526 -0.07143 -0.05128  0.05405  0.10256
 [71]  0.18605  0.05882 -0.12963 -0.17021 -0.05128  0.13514 -0.04762
 [78] -0.02500  0.10256  0.09302 -0.02128  0.10870 -0.01961  0.08000
 [85]  0.18519 -0.03125  0.00000  0.16129  0.02778 -0.01351 -0.04110
 [92]  0.00000 -0.07143 -0.07692  0.06667 -0.03125 -0.01613  0.03279
 [99]  0.04762 -0.01515  0.07692  0.02857  0.08333  0.02564  0.01250
[106]  0.08642  0.02273  0.02222  0.00000  0.08696 -0.04000 -0.01042
[113]  0.17895  0.00893 -0.06195  0.08491 -0.04348  0.14545  0.03175
[120]  0.04615

#let's try to plot the returns for Dupont against those of the Dow
plot(DOW,DUPONT)
[1] Error in plot(DOW, DUPONT) : object 'DOW' not found
#What went wrong here?

#let's try another way
plot("DOW","DUPONT")
[1] Error in plot.window(...) : need finite 'xlim' values
In addition: Warning messages:
1: In xy.coords(x, y, xlabel, ylabel, log) : NAs introduced by coercion
2: In xy.coords(x, y, xlabel, ylabel, log) : NAs introduced by coercion
3: In min(x) : no non-missing arguments to min; returning Inf
4: In max(x) : no non-missing arguments to max; returning -Inf
5: In min(x) : no non-missing arguments to min; returning Inf
6: In max(x) : no non-missing arguments to max; returning -Inf
#What went wrong here?
 
#finally, third time's a charm 
plot(events.data[,"DOW"],events.data[,"DUPONT"])

#But the x and y axes are not labelled properly. Let's give them nice labels.
plot(events.data[,"DOW"],events.data[,"DUPONT"],xlab='DOW',ylab='DUPONT')
 
#regressing Dupont on Dow
lm(events.data[,'DUPONT']~events.data[,'DOW'])
Call:
lm(formula = events.data[, "DUPONT"] ~ events.data[, "DOW"])

Coefficients:
         (Intercept)  events.data[, "DOW"]  
            0.007234              0.589730  


#let's assign the regression to a variable called model. This will allow
#us to do nice things down the line.
model = lm(events.data[,'DUPONT']~events.data[,'DOW'])

#what information does model contain? 
names(model)
 [1] "coefficients"  "residuals"     "effects"       "rank"         
 [5] "fitted.values" "assign"        "qr"            "df.residual"  
 [9] "xlevels"       "call"          "terms"         "model"        
#some useful things: residuals, fitted.values, coefficients
 
#let's get the residuals as a vector
model$residuals
            1             2             3             4             5 
 0.1300173774 -0.0478190820 -0.0331279284  0.0277000866  0.0498800571 
            6             7             8             9            10 
-0.0737039774 -0.0044940850 -0.0384009705 -0.0214350995  0.0261000997 
           11            12            13            14            15 
 0.0195092205  0.0225198663  0.0198985481  0.0072068086 -0.0350174903 
           16            17            18            19            20 
-0.0003864832 -0.0212352219 -0.0176106731  0.0607580647 -0.0376837488 
           21            22            23            24            25 
-0.0399870999  0.0592876128  0.0955030940  0.0139649979 -0.0928658973 
           26            27            28            29            30 
-0.0104522144 -0.0067786256  0.0625789134  0.0201943620 -0.0214225651 
           31            32            33            34            35 
 0.0289838568  0.0048839960 -0.0005832184 -0.0235444770  0.0399470877 
           36            37            38            39            40 
 0.0443649729  0.0127884628 -0.0038178896  0.0176777252 -0.0271095554 
           41            42            43            44            45 
-0.0289434844 -0.0457400372 -0.0647585618  0.0078187705 -0.0765711754 
           46            47            48            49            50 
-0.0381069543  0.0126846860 -0.0075414773 -0.0346606180 -0.0775646892 
           51            52            53            54            55 
-0.0396109003  0.0233267816  0.0534790150  0.0601305282 -0.0307859534 
           56            57            58            59            60 
 0.0713507985  0.0049497606 -0.0962146726  0.0319439879  0.0377229578 
           61            62            63            64            65 
 0.0341153306  0.0351690583 -0.0210397603  0.0517763345  0.0346912071 
           66            67            68            69            70 
 0.0499539754 -0.1173852578 -0.0304263479 -0.0087276473  0.0155481624 
           71            72            73            74            75 
 0.0012692032 -0.0918639678  0.0108475615  0.0593643194 -0.1302486365 
           76            77            78            79            80 
 0.0653811010 -0.0038083131 -0.0212272611 -0.0763514971  0.0344461008 
           81            82            83            84            85 
 0.0207377000  0.0302895426 -0.0258265659 -0.0554306298  0.0422210500 
           86            87            88            89            90 
-0.0383863050  0.0914095773 -0.0017333623  0.0402359992 -0.0329317212 
           91            92            93            94            95 
-0.0086461601  0.0398247549 -0.0183378647  0.0178473301  0.0848171272 
           96            97            98            99           100 
-0.0636289538 -0.0195844338  0.0266909023 -0.0561135668  0.0065342069 
          101           102           103           104           105 
 0.0101771952 -0.0380508891 -0.0452704914  0.0799045110  0.0333880032 
          106           107           108           109           110 
-0.0783113439  0.0058494756  0.0736981974 -0.0098724719  0.0192686743 
          111           112           113           114           115 
-0.0107421366  0.0423120937  0.0154872396 -0.0826654576  0.0043171823 
          116           117           118           119           120 
-0.0142005112  0.0035374092  0.0412788634 -0.0154877605  0.0247122549 
 
#let's get the residuals and fitted values, and assign them to new variables 
res = model$residuals
fits = model$fitted.values
 
#plot of residuals vs. X
plot(events.data$DOW, res, xlab='X-variable', ylab='Residuals')

#plot of residuals vs. fitted values
plot(fits, res, xlab='Fitted Values', ylab='Residuals')
 
#adding the regression line to the scatter plot of Y vs. X
plot(events.data[,"DOW"],events.data[,"DUPONT"],xlab='DOW',ylab='DUPONT')
abline(model,col='red'); #this adds a red line. feel free to use your favorite color.
 
#going back: this was our function call to generate the regression model
model = lm(events.data[,'DUPONT']~events.data[,'DOW'])

#an alternative prettier way to generate the same model, i.e. give the column names
#in the formula and use the data= argument to tell R what data frame to use
model = lm(DUPONT~DOW,data=events.data)

summary(model)
Call:
lm(formula = DUPONT ~ DOW, data = events.data)

Residuals:
      Min        1Q    Median        3Q       Max 
-0.130249 -0.030516  0.003927  0.032305  0.130017 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 0.007234   0.004297   1.683    0.095 .  
DOW         0.589730   0.059316   9.942   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

Residual standard error: 0.04692 on 118 degrees of freedom
Multiple R-squared: 0.4558,     Adjusted R-squared: 0.4512 
F-statistic: 98.85 on 1 and 118 DF,  p-value: < 2.2e-16 



############ Creating Indicator Variables ###################

#first we need to know how long the indicator variable needs to be i.e.
#it needs to be equal to the number of data points we have
num.rows = nrow(events.data)
print(num.rows)
[1] 120

#begin by creating a vector of zeros
my.indicator = rep(0,num.rows)
my.indicator
  [1] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [35] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [69] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[103] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 
#let's expand the events.data data frame and add in this indicator variable
#we can give it a nice column name as well. 
expanded.data = data.frame(events.data,IND77=my.indicator)

class(expanded.data)
[1] "data.frame"

dim(expanded.data)
[1] 120   8
 
colnames(expanded.data)
[1] "DATE"   "GPU"    "MARK76" "RKFR76" "DOW"    "DUPONT" "CONOCO"
[8] "IND77" 
#so now, expanded.data has the same columns as events.data, plus the indicator variable

 
#let's look at the indicator variable, should be all zeros 
expanded.data$IND77
  [1] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [35] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [69] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[103] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 
#we want to create an indicator for the year 1977. let's look at the date column. 
expanded.data$DATE
  [1] 7601 7602 7603 7604 7605 7606 7607 7608 7609 7610 7611 7612 7701
 [14] 7702 7703 7704 7705 7706 7707 7708 7709 7710 7711 7712 7801 7802
 [27] 7803 7804 7805 7806 7807 7808 7809 7810 7811 7812 7901 7902 7903
 [40] 7904 7905 7906 7907 7908 7909 7910 7911 7912 8001 8002 8003 8004
 [53] 8005 8006 8007 8008 8009 8010 8011 8012 8101 8102 8103 8104 8105
 [66] 8106 8107 8108 8109 8110 8111 8112 8201 8202 8203 8204 8205 8206
 [79] 8207 8208 8209 8210 8211 8212 8301 8302 8303 8304 8305 8306 8307
 [92] 8308 8309 8310 8311 8312 8401 8402 8403 8404 8405 8406 8407 8408
[105] 8409 8410 8411 8412 8501 8502 8503 8504 8505 8506 8507 8508 8509
[118] 8510 8511 8512
 
#we can count that the years corresponding to 1977 are 13,14,15, .., 23,24
#so, we can set these rows in the indicator column to be 1 
expanded.data$IND77[13:24] = 1
expanded.data$IND77
  [1] 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
 [35] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [69] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[103] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0


 
####### using the which() function ######## 
#which() evaluates a mathematical statement. in particular, it can be used to 
#easily get the rows (and columns) that contain data that we're looking for

#so, if we want to find the row for the first month of 1977
####NOTE: we use == instead of a single = when searching for values
which(expanded.data$DATE==7701)
[1] 13

#what happens if the value we're looking for does not exist in the column? 
which(expanded.data$DATE==1000)
[1] integer(0)
 
#we can search for multiple values as well. let's search for all 12 months of 1977. 
which(expanded.data$DATE==7701:7712)
[1] 13 14 15 16 17 18 19 20 21 22 23 24
 
#let's create another indicator variable
my.indicator2 = rep(0,num.rows)

#adding the new indicator to the data frame, but we don't want to create a new 
#variable. so, we add the column to expanded.data and assign it back to itself.
expanded.data = data.frame(expanded.data,IND80=my.indicator2)
colnames(expanded.data)
[1] "DATE"   "GPU"    "MARK76" "RKFR76" "DOW"    "DUPONT" "CONOCO"
[8] "IND77"  "IND80" 
 
#again, the new column should be all zeros
expanded.data$IND80
  [1] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [35] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [69] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[103] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 
#say, we want to remove the first indicator column from the data frame.
#since, we know that it's the 8th column, we can say ... 
expanded.data = expanded.data[,-8]
colnames(expanded.data)
[1] "DATE"   "GPU"    "MARK76" "RKFR76" "DOW"    "DUPONT" "CONOCO"
[8] "IND80" 
 
#how use the which() function to search for rows corresponding to 1980 and assign them 
#to 1. first, create a new variable called 'a' that contains the relevant row numbers
a = which(expanded.data$DATE==8001:8012)
#let's look at what 'a' is
a
[1] 49 50 51 52 53 54 55 56 57 58 59 60
#set these rows to 1
expanded.data$IND80[a] = 1
expanded.data$IND80
  [1] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [35] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0
 [69] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[103] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 
#we can combine the above statements into one concise statement. let's search for 1979
#and set those rows to 2. 
expanded.data$IND80[which(expanded.data$DATE==7901:7912)] = 2
expanded.data$IND80
  [1] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [35] 0 0 2 2 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0
 [69] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[103] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 
#let's look at the column names of expanded.data again 
colnames(expanded.data)
[1] "DATE"   "GPU"    "MARK76" "RKFR76" "DOW"    "DUPONT" "CONOCO"
[8] "IND80" 

#the which() function can be used to search for column names as well. this 
#will give the column number  
which(colnames(expanded.data)=="DOW")
[1] 5

#Let's create a vector x of numbers from 1 to 100, and create an indicator for x>17
x = 1:100
x
  [1]   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17
 [18]  18  19  20  21  22  23  24  25  26  27  28  29  30  31  32  33  34
 [35]  35  36  37  38  39  40  41  42  43  44  45  46  47  48  49  50  51
 [52]  52  53  54  55  56  57  58  59  60  61  62  63  64  65  66  67  68
 [69]  69  70  71  72  73  74  75  76  77  78  79  80  81  82  83  84  85
 [86]  86  87  88  89  90  91  92  93  94  95  96  97  98  99 100
 
my.ind = rep(0,length(x))
my.ind
  [1] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [35] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [69] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
my.ind[which(x>17)] = 1
my.ind
  [1] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
 [35] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
 [69] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1


#let's create a new regression model with the indicator thrown in
model1 = lm(DUPONT~DOW+IND80,data=expanded.data)
summary(model1)

Call:
lm(formula = DUPONT ~ DOW + IND80, data = expanded.data)

Residuals:
      Min        1Q    Median        3Q       Max 
-0.133943 -0.026427  0.002326  0.030792  0.125603 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept)  0.010133   0.004710   2.152   0.0335 *  
DOW          0.598017   0.059295  10.085   <2e-16 ***
IND80       -0.009828   0.006687  -1.470   0.1443    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

Residual standard error: 0.04669 on 117 degrees of freedom
Multiple R-squared: 0.4657,     Adjusted R-squared: 0.4566 
F-statistic: 50.99 on 2 and 117 DF,  p-value: < 2.2e-16 

#now, you can pull out the residuals, fitted values, etc. from model1
#and create the desired plots.


