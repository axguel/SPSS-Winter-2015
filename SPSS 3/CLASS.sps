* Encoding: UTF-8.
DATA LIST FILE = 'E:\SPSS 3\class2013.dat'
/CASEID 1-5 M2BP01 6-7 M2CP01 8-8 M2DP01 9-9 M535 10-11 WEIGHT 12-16(4).

*  Write the weight variable in the format command like this:  WEIGHT 12-16(4)  then erase this line.

VARIABLE LABELS M2BP01 "Age of Respondent (in years)"
/M2CP01 "Marital status of respondent"
/M2DP01 "Sex of respondent"
/M535 "How many hours did you work last week? (number of hours)".

VALUE LABELS M2CP01 1 "married" 2"seperated due to marital problems" 3 "divorced" 4 "widowed" 5 "never married" 9 "no answer"
/M2DP01 1 "male" 2 "female".

compute M2BP01n = M2BP01.
VARIABLE LABELS  M2BP01n "Age of Respondent (in years)".
recode M2BP01n (0 thru 19=1) (20 thru 39=2) (40 thru 59=3) (60 thru 79=4)(80 thru 95=5).
VALUE LABELS M2BP01n 1 "0 through 19" 2 "20 through 39" 3 "40 through 59" 4 "60 through 79" 5 "80 or older".

* This is the new variable that I made that puts the ages into ordinal categories

compute M535n = M535.
VARIABLE LABELS M535n "How many hours did you work last week? (number of hours)".
recode M535n (0 thru 20=1) (21 thru 40=2) (41 thru 60=3) (61 thru 95=4) (96=5).
VALUE LABELS M535n 1 "0 through 20 hours" 2 "21 through 40 hours" 3 "41 through 60 hours" 4 "61 or more hours"  5 "Unemployed".

* This is the new variable that I made that puts the hours into ordinal categories

MISSING VALUES M2BP01n (97, 98).
MISSING VALUES M535n (98, 99).
MISSING VALUES M2CP01 (9).





*  leave these last two commands exactly as they are. NO

weight by weight.
execute.