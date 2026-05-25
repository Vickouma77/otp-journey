-module(some).

-export([start/0, say_something/2]).

%% Base case
say_something(_What, 0) ->
  done;

%% Recursive case
say_something(What, Times) ->
  io:format("~p~n", [What]),
  say_something(What, Times - 1).

start() ->
  spawn(some, say_something, [hello, 3] ),
  spawn(some, say_something, [goodbye, 3]).
