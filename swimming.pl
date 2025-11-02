:- dynamic(itRains/0).
:- dynamic(itIsSunday/0).
:- dynamic(itIsWeek/0).

iSwim :- itRains, iHaveTime.
iSwim :- theSunShines, iHaveTime.

iHaveTime :- iHaveNoWork.

iHaveNoWork :- itIsWeekend.

itIsWeekend :- itIsSaturday.
itIsWeekend :- itIsSunday.

iWork :- itIsWeek.
iHaveNoTime :- iWork.

theSunShines.
itIsSaturday.
itIsSunday.
itIsWeek.