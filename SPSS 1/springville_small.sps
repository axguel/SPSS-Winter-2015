* Encoding: UTF-8.
DATA LIST FILE='E:\Springvillesmall.dat'
/csid 1-4 Q1a 5-5 Q1b 6-8 Q2 9-10 Q3 11 Q4 12 Q5 13-14 Q6 15-16 Q7 17-18 Q8 19 Q9 20-21 Q10 22.

*   format statement (first two lines)

*  variable labels command

VARIABLE LABELS Q1a "Do you live in Springville or Mapleton?"
/Q1b "In total, how many years have you lived in Springville?"
/Q2 "Prior to moving to Springville, in what state did you live?"
/Q3 "In what type of home do you live? Is it:"
/Q4 "Do you own or rent your home?"
/Q5 "How many people, including yourself, live in your household?"
/Q6 "In total, how many children age 12 and over are living in your household?"
/Q7 "In total, how many children age 11 or younger are living in your household?"
/Q8 "The next few questions are about computers and your use of computers at home. Do you have a computer in your home?"
/Q9 "Not counting computers that don't work, how many computers are there in your home (apartment)?"
/Q10 "Do you have an internet connection for your computer?".

*   value labels command

VALUE LABELS  Q1a 1 "Springville" 2 "Mapleton" 3 "someplace else" 8 "don't know" 9 "refused" 
/Q1b 990 "all my life" 991 "don't live in Springville" 998 "don't know" 999 "refused"  /Q2 1 "Utah" 
2 "Arizona" 3 "California" 4 "Colorado" 5 "Idaho" 6 "Nevada" 7 "New Mexico" 8 "Wyoming" 9 "Other" 
98 "don't know" 99 "refused"/Q3 1 "a one-family house detached from any other houses," 
2 "a twin home, a condominium, or a townhouse" 3 "a building with two or more apartments" 
4 "a mobile home?" 8 "don't know" 9 "refused" /Q4 1 "own" 5 "rent" 8 "don't know" 9 "refused" 
/Q5 51 "51 or more" 98 "don't know" 99 "refused"/Q6 98 "don't know" 99 "refused" /Q7 98 "don't know" 
99 "refused" /Q8 1 "yes" 5 "no" 8 "don't know" 9 "refused" /Q9 11 "11 or more" 
97 "none-none of them work" 98 "don't know" 99 "refused"/Q10 1 "yes" 5 "no" 8 "don't know" 9 "refused".

* select if command   (selects only people living in Springville)

select if (q1a eq 1).

*  compute command  (creates a new variable, time)

compute time=q1b.
recode time (0 thru 2=0)(3 thru 9=1)(10 thru 24=2)(25 thru 900, 990=3).
variable labels time "Years lived in Springville".
value labels time 0 "2 years or less" 1 "3 to 9 years" 2 "10 to 24 years" 3 "25 years or more".
missing values time (998).

compute HHsize=q5.
recode hhsize (1=1)(2=2)(3 4=3)(5 6=5)(7 thru 51=6).
variable labels HHsize "household size".
value labels HHsize 1 "1" 2 "2" 3 "3 or 4" 5 "5,6" 6 "7 or more".
missing values hhsize (98).

missing values q5 (98 99).

missing values q4(8).

compute computer =q8.

*recoding computer 

recode computer (1=1) (5=0).

if (computer eq 1 and (Q9 ge 1 and Q9 le 11))computer=Q9.

if (q9 eq 97)computer=0.

recode computer (2 thru 11=2).
* variable labels is to write a label for question, value labels is the labels for the values

variable labels computer "How many computers are in your home?".

value labels computer 0 "none" 1 "One" 2 "Two or more".









