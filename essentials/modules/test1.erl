-module(test1).

-export([demo/1, loop/1 ]).

demo(X) ->
    put(aa, worked),
    X = 1,
    X + 10.

loop(N) ->
  io:format("Hello Number: ~w~n", [N]),
  loop(N+1).
