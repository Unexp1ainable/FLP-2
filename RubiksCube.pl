:- module(RubiksCube, [printCube/1]).

attribute( top    , [[5,5,5,5,5,5,5,5,5]], read).
attribute( front  , [[1,1,1,1,1,1,1,1,1]], read).
attribute( right  , [[2,2,2,2,2,2,2,2,2]], read).
attribute( back   , [[3,3,3,3,3,3,3,3,3]], read).
attribute( left   , [[4,4,4,4,4,4,4,4,4]], read).
attribute( bottom , [[6,6,6,6,6,6,6,6,6]], read).

method(printCube, printCube, public).

printCube(X) :- writeln("Pes").
