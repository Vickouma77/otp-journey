-module(tut4).

-export([sum/1, square_all/1 ]).

%%Sum the elements of a list
%%Base case: 
%%  The sum of an empty list is 0
sum([]) ->
  0;

%%Recursive case: 
%%  Head + sum of the tail
sum([Head | Tail]) ->
  Head + sum(Tail).

%%Square every element in a list
%%Base case: 
%%  Squaring an empty list returns an empty list
square_all([]) ->
  [];

%%Recursive case:
%%  [Square of Head | square_all of Tail]
square_all([H | T]) ->
  [H *H | square_all(T) ].

