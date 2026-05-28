-module(sum).
-export([do_sum/1]).

do_sum(N) ->
  do_sum(N, 0).

do_sum(0, Total) ->
  Total;

do_sum(N, Total) ->
  do_sum(N - 1, Total + N).
