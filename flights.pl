flightPath(lax,nrt,11,5439).
flightPath(cdg,lax,11,5656).
flightPath(jfk,lax,6,2469).
flightPath(cdg,jfk,8,3624).
flightPath(cdg,fgo,2,684).
flightPath(lju,cdg,2,587).
flightPath(lju,fco,1,313).
flightPath(jfk,nrt,14,6729).
flightPath(fco,jfk,10,4266).
flightPath(fco,sin,12,6245).
flightPath(sin,nrt,7,3329).
transferTime(lax,3).
transferTime(nrt,4).
transferTime(cdg,2).
transferTime(lju,2).
transferTime(jfk,3).
transferTime(fco,4).
transferTime(sin,3).

connection(Start,Destination):-
    flightPath(Start,Destination,_,_).
connection(Start,Destination):-
    flightPath(Start,Transfer,_,_),
    connection(Transfer,Destination).

flightTime(Start,Destination,Time,Path):-
    flightPath(Start,Destination,T1,_),
    transferTime(Destination,T2),
    Time is (T1+T2),
    append([Start],[Destination],P1),
    append([],[P1],Path).

flightTime(Start,Destination,Time,Path):-
    flightPath(Start,Transfer,T1,_),
    append([Start],[Transfer],P0),
    append([],[P0],P1),
    transferTime(Transfer,T3),
    flightTime(Transfer,Destination,T2,P2),
    append(P1,P2,Path),
    Time is (T1+T2+T3).

pathLength([],Length):-
    Length is 0.

pathLength([[A,B]|T],Length):-
    flightPath(A,B,_,L1),
	pathLength(T,L2),
    Length is (L1+L2).

flightLength(Start,Destination,Length):-
    flightTime(Start,Destination,_,Path),
    pathLength(Path,Length).

shortest([Min],Min).

shortest([A,B|C],Min):-
    pathLength(A,A1),
    pathLength(B,B1),
    ((A1>B1, shortest([B|C],Min));
    (A1=<B1, shortest([A|C],Min))).

shortestPath(Start,Destination,Min):-
    findall(P1,flightTime(Start,Destination,_,P1),Paths),
    shortest(Paths,Min).


