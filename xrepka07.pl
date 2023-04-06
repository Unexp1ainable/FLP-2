:- dynamic(cube/1).

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

rotateHorizontal([Top, [F1, F2, F3], [R1, R2, R3], [B1, B2, B3], [L1, L2, L3], Bottom], 
    [Top, [R1, F2, F3], [B1, R2, R3], [L1, B2, B3], [F1, L2, L3], Bottom], 1).
rotateHorizontal([Top, [F1, F2, F3], [R1, R2, R3], [B1, B2, B3], [L1, L2, L3], Bottom], 
    [Top, [F1, R2, F3], [R1, B2, R3], [B1, L2, B3], [L1, F2, L3], Bottom], 2).
rotateHorizontal([Top, [F1, F2, F3], [R1, R2, R3], [B1, B2, B3], [L1, L2, L3], Bottom], 
    [Top, [F1, F2, R3], [R1, R2, B3], [B1, B2, L3], [L1, L2, F3], Bottom], 3).

rotateVerticalFront([[T1,T2,T3], [F1,F2,F3], Right, [Ba1,Ba2,Ba3], Left, [Bo1,Bo2,Bo3]],
    [[F1,T2,T3], [Bo1,F2,F3], Right, [T1,Ba2,Ba3], Left, [Ba1,Bo2,Bo3]], 1).
rotateVerticalFront([[T1,T2,T3], [F1,F2,F3], Right, [Ba1,Ba2,Ba3], Left, [Bo1,Bo2,Bo3]],
    [[T1,F2,T3], [F1,Bo2,F3], Right, [Ba1,T2,Ba3], Left, [Bo1,Ba2,Bo3]], 2).
rotateVerticalFront([[T1,T2,T3], [F1,F2,F3], Right, [Ba1,Ba2,Ba3], Left, [Bo1,Bo2,Bo3]],
    [[T1,T2,F3], [F1,F2,Bo3], Right, [Ba1,Ba2,T3], Left, [Bo1,Bo2,Ba3]]).

rotateVerticalSide([[T1,T2,T3], Front, [R1,R2,R3], Back, [L1,L2,L3], [B1,B2,B3]],
    [[R1,T2,T3], Front, [B1,R2,R3], Back, [T1,L2,L3], [L1,B2,B3]], 1).
rotateVerticalSide([[T1,T2,T3], Front, [R1,R2,R3], Back, [L1,L2,L3], [B1,B2,B3]],
    [[T1,R2,T3], Front, [R1,B2,R3], Back, [L1,T2,L3], [B1,L2,B3]], 2).
rotateVerticalSide([[T1,T2,T3], Front, [R1,R2,R3], Back, [L1,L2,L3], [B1,B2,B3]],
    [[T1,T2,R3], Front, [R1,R2,B3], Back, [L1,L2,T3], [B1,B2,L3]], 1).

doMove(X,R) :- rotateHorizontal(X,R,_) ; rotateVerticalFront(X,R,_); rotateVerticalSide(X,R,_).

solve(X, [X]) :- isSolved(X). 
solve(X, [X|Result]) :- 
    not(isSolved(X)),
    not(cube(X)),
    assertz(cube(X)),
    doMove(X,R),
    solve(R, Result). 

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

printCube([Top, Front, Right, Back, Left, Bottom]) :- printSideStandalone(Top), printSides(Front, Right, Back, Left), printSideStandalone(Bottom).
printPath([]).
printPath([H|T]) :- printCube(H), printPath(T).

main :- writeln("Cube"), loadCube(X), solve(X,R), writeln("Cuuuube"), printPath(R).
