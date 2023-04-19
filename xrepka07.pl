:- use_module(cube_rotations).

:- dynamic(cube/1).
:- dynamic(maxLevel/1).

dec(0, _) :- !.
dec(X, R) :- R is X-1.

eatChar :- get_char(_).

loadRow(Row) :-  loadRowC(Row, 3).
loadRowC([], 0) :- !.
loadRowC([C|Row], Count) :- get_char(C),  dec(Count,NCount), loadRowC(Row, NCount).

loadRowOfFour([R1,R2,R3,R4]) :-  loadRow(R1), eatChar, loadRow(R2), eatChar, loadRow(R3), eatChar, loadRow(R4), eatChar.
loadSides(Front, Right, Back, Left):- loadRowOfFour(T), loadRowOfFour(M), loadRowOfFour(B), transformLoadedSides(T,M,B,Front, Right, Back, Left).
transformLoadedSides([T1, T2, T3, T4],[M1, M2, M3, M4],[B1, B2, B3, B4], [T1, M1, B1], [T2, M2, B2], [T3, M3, B3], [T4, M4, B4]).

loadSideStandalone([R1,R2,R3]) :- loadRow(R1), eatChar, loadRow(R2), eatChar, loadRow(R3), eatChar.

loadCube([Top, Front, Right, Back, Left, Bottom]) :- loadSideStandalone(Top), loadSides(Front, Right, Back, Left), loadSideStandalone(Bottom).

doMove(X,R) :- 
    rotateHorizontal(X,R); 
    rotateVerticalFront(X,R); 
    rotateVerticalSide(X,R);
    rotateHorizontal(R,X); 
    rotateVerticalFront(R,X); 
    rotateVerticalSide(R,X).

inc(X,Y) :- Y is X+1.

solve(X, [X], _) :- isSolved(X). 
solve(X, [X|Result], Level) :-
    maxLevel(MaxLevel),
    Next is Level + 1,
    not(isSolved(X)),
    not(cube(X)),
    assertz(cube(X)),
    doMove(X,R),
    Next =< MaxLevel, 
    solve(R, Result, Next). 

isComplete(Side) :- flatten(Side, [H|Flattened]), maplist(=(H), Flattened).
isSolved([Top, Front, Right, Back, Left, Bottom]) :- isComplete(Top),isComplete(Front),isComplete(Right),isComplete(Back),isComplete(Left),isComplete(Bottom). 


printRow([A,B,C]) :- put_char(A), put_char(B), put_char(C).
printSideStandalone([A,B,C]) :- printRow(A), put_char("\n"), printRow(B), put_char("\n"), printRow(C), put_char("\n").
printRowOfFour([R1,R2,R3,R4]) :- printRow(R1), put_char(" "), printRow(R2), put_char(" "), printRow(R3), put_char(" "), printRow(R4), put_char("\n"). 
printSides(A,B,C,D) :- 
    transformLoadedSides(T1,T2,T3,A,B,C,D),
    printRowOfFour(T1),
    printRowOfFour(T2),
    printRowOfFour(T3).

doIDS(X,R) :- maxLevel(Lvl), Lvl =< 20, solve(X,R,0).
doIDS(X,R) :- maxLevel(Lvl),  Lvl =< 20, retractall(cube(_)), retract(maxLevel(Lvl)), inc(Lvl,NLvl), assertz(maxLevel(NLvl)), doIDS(X,R).


printCube([Top, Front, Right, Back, Left, Bottom]) :- printSideStandalone(Top), printSides(Front, Right, Back, Left), printSideStandalone(Bottom).
printPathC([]).
printPathC([H|T]) :- put_char("\n"), printCube(H), printPathC(T).
printPath([H|T]) :- printCube(H), printPathC(T).

main :- loadCube(X), assertz(maxLevel(3)), doIDS(X,R), printPath(R).
% main :- loadCube(X), doMove(X, R), printCube(R).
