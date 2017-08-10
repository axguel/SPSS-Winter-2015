* Encoding: UTF-8.
DATA LIST FILE=' E:\LawFinal.dat'
/ID 1-17(A) AA1 19-19 A1 20-21 A1T 22-24 H1 25-25 H2 26-26 A2 27-27 A3 28-28 A4 29-32 A5 33-33 A6 34-39 A7 40-40.
* the format statement is the first two lines of this spss doc

* variable labels command

VARIABLE LABELS AA1 "What is your gender?"
/A1 "Which of the following best describes your current job position?"
/A1T "Which one of the following best describes your current job position?"
/H1 "Which of the following comes closest to describing your current job position?"
/H2 "Are you currently employed in a full-time or part-time job for pay?"
/A2 "Is your primary residence inside or outside the State of Utah?"
/A3 "Is your firm a(n): "
/A4 "In total, about how many attorneys does your firm currently employ? (range of frequency at all offices)"
/A5 "Which of the following categories comes closest to the total number of attorneys employed by your firm at all offices? (Your best guess)"
/A6 "In total, about how many attorneys employed by your firm are female? (range of frequencies at all offices)"
/A7 "Which of the following categories comes closest to the total number fo female attorneys employed by your firm at all offices? (Your best guess)".

* value labels command

VALUE LABELS AA1 1 "Male" 2 "Female"
/A1 1 "Law Firm [skip to A2]" 2 "Government [skip to B2]" 3 "Solo practitioner [skip to C2]" 4 "Company (in-house counsel) [skip to D2]"
5 "Non-profit organization [skip to E2]" 6 "Teaching/academic/university/school [skip to F2]" 7 "Non-legal profession [skip to G2]" 
8 "Not currently employed but looking for work [skip to I1]" 9 "Not currently employed and not looking for work [skip to I1]" 10 "Other (please specify[skip to AT1])"
/A1T 1 "researcher" 2 "consultant" 3 "public defender" 4 "judicial" 5 "government" 6 "in house/of counsel" 7 "solo practitioner"
8 "private firm employee/manager/owner" 9 "retired" 10 "not currently employed" 20 "other"
/H1 1 "Law firm" 2 "Government" 3 "Solo practitioner" 4 "Company (in-house counsel)" 5 "Non-profit organization" 6 "Teaching/academic/university/school"
7 "Non-legal profession" 8 "None of them"
/H2 1 "Yes" 2 "No" 3 "Don't know" 
/A2 1 "Inside Utah" 2 "Outside Utah" 3 "Not currently practicing as an attorney"
/A3 1 "national firm" 2 "regional firm" 3 "local firm" 4 "international firm"
/A5 1 "9 or less" 2 "10-19" 3 "20-29" 4 "30-39" 5 "40-49" 6 "50-74" 7 "75-99" 8 "100 or more"
/A7 1 "none [skip to A14]" 2 "9 or less" 3 "10-19" 4 "20-29" 5 "30-39" 6 "40-49" 7 "50-74" 8 "75-99" 9 "100 or more".

* here i compute two new variables, each equal to a pre-existing variable and recode the values

compute A5n=A5.
VARIABLE LABELS A5n "Which of the following categories comes closest to the total number of attorneys employed by your firm at all offices? (Your best guess)".

recode A5n (1=4.5)(2=14.5)(3=24.5)(4=34.5) (5=44.5)(6=62)(7=87)(8=265).
compute A7n=A7.
VARIABLE LABELS A7n "Which of the following categories comes closest to the total number fo female attorneys employed by your firm at all offices? (Your best guess)".
recode A7n (1=0)(2=4.5)(3=14.5)(4=24.5)(5=34.5)(6=44.5)(7=62)(8=87)(9=190).

* this is number 6

if (A5n ge 4.5 and A5n le 256)A4=A5n.
if(A7n ge 0 and A7n le 190)A6=A7n.

* creating two new categorical variables, for 100 or more you put 100 thru hi

compute A4c=A4.
VARIABLE LABELS A4c "In total, about how many attorneys does your firm currently employ? (range of frequency at all offices)".
recode A4c (1=1 thru 9)(2=10 thru 19)(3=20 thru 49)(4=50 thru 99)(5=100 thru hi).
compute A6c=A6.
VARIABLE LABELS A6c "In total, about how many attorneys employed by your firm are female? (range of frequencies at all offices)".
recode A6c (0=0)(1=1 thru 9)(2=10 thru 19)(3=20 thru 49)(4=50 thru 99)(5=100 thru hi).

if (AA1 eq 2 and A6c eq 0) A6c=1.






