family(person( john, cohen, date(17,may,1990), unemployed),
 person( lily, cohen, date(9,may,1990), unemployed),
[ ] ).
family(person( john, armstrong, date(7,may,1988), unemployed),
 person( lily, armstrong, date(29,may,1961), unemployed),
 [ ] ).
family(person( eric, baily, date(7,may,1963), works( bbc, 2200)),
 person( grace, baily, date(9,may,1965), works( ntu, 1000)),
 [person( louie, baily, date(25,may,1983), unemployed) ] ).
family(person( eric, baily, date(7,may,1963), works( acc, 21200)),
 person( grace, baily, date(9,may,1965), works( ntnu, 12000)),
 [person( louie, baily, date(25,may,1983), unemployed) ] ).
family(person( eric, fox, date(27,may,1970), works( bbc, 25200)),
 person( grace, fox, date(9,may,1971), works( ntbu, 13000)),
 [person( louie, fox, date(5,may,1993), unemployed) ] ).
family(person( tom, cohen, date(7,may,1960), works( bcd, 15200)),
 person( ann, cohen, date(29,may,1961), unemployed),
 [person( pat, cohen, date(5,may,1983), works( bcd, 15200)),
 person( jim, cohen, date(5,may,1983), works( bcd, 15200)) ] ).
family(person( bob, armstrong, date(12,oct,1977), works( ntnu, 12000)),
 person( liz,armstrong, date(6,oct,1975), unemployed),
 [person( bob, armstrong, date(6,oct,1999), unemployed),
 person( sam,armstrong, date(8,oct,1998), unemployed) ] ).
family(person( tony, oliver, date(7,may,1960), works( bbc, 35200)),
 person( anny, oliver, date(9,may,1961), unemployed),
 [person( patty, oliver, date(8,may,1984), unemployed),
 person( jimey, oliver, date(5,may,1983), unemployed) ] ).
family(person( jack, fox, date(27,may,1940), unemployed),
 person( jane, fox, date(9,aug,1941), works( ntu, 13050)),
 [person( andy, fox, date(5,aug,1967), works( com, 12000)),
 person( kai, fox, date(5,jul,1969), unemployed) ] ).
husband(X) :- family( X, _, _).
wife(X) :- family( _, X, _).
child(X) :- family( _, _, Children), member(X, Children).
exists(Persons) :- husband( Persons); wife( Persons); child( Persons).
dateofbirth(person(_, _, Date, _), Date).
salary(person(_, _, _, works(_, S)), S).
salary(person(_, _, _, unemployed), 0). 
totalIncome(family(X,Y,[]),W):-
    salary(X,A),
    salary(Y,B),
    W is (A+B).
totalIncome(family(X,Y,[H|T]),W):-
    salary(H,C),
    totalIncome(family(X,Y,T),D),
    W is (D+C).

numberOfPeople(family(_,_,[]),Number):-
    Number is 2.
numberOfPeople(family(_,_,[_|T]),Number):-
	numberOfPeople(family(_,_,T),N),
	Number is (N+1).

averageIncome(family(X,Y,Z),Average):-
    totalIncome(family(X,Y,Z),W),
    numberOfPeople(family(X,Y,Z),Number),
    Average is (W/Number).

parentsIncome(family(X,Y,_),Parents):-
    salary(X,A),
    salary(Y,B),
    Parents is (A+B).

childrensIncome(family(_,_,[]),Children):-
    Children is 0.

childrensIncome(family(X,Y,[H|T]),Children):-
    salary(H,A),
    childrensIncome(family(X,Y,T),C1),
    Children is (A+C1).
               
               