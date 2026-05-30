-module(sum).
-export([do_sum/1, rev/1, fac/1]).

do_sum(N) ->
  do_sum(N, 0).

do_sum(0, Total) ->
  Total;

do_sum(N, Total) ->
  do_sum(N - 1, Total + N).

%%% Public Interface
rev(L) ->
  rev(L, []).

%%% Base Case
rev([], Acc) ->
  Acc;

%%% Recursive Case
rev([H|T], Acc) ->
  rev(T, [H|Acc]).

%%% Public Interface
fac(N) when N >= 0 ->
  fac(N, 1).

%%% Base Case.
fac(0, Acc) ->
  Acc;

%%% Recursive Case.
fac(N, Acc) when N > 0 ->
  fac(N - 1, N * Acc).
