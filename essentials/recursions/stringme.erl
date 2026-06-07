-module(stringme).
-export([start/0]).

%% Count vowels
count_vowels(Str) ->
    count_vowels(string:to_lower(Str), 0).

count_vowels([], Acc) -> Acc;
count_vowels([H|T], Acc) when H =:= $a; H =:= $e; H =:= $i; H =:= $o; H =:= $u ->
    count_vowels(T, Acc+1);
count_vowels([_ | T], Acc) ->
    count_vowels(T, Acc).

start() ->
    io:format("Vowels in Erlang is great: ~p~n", [count_vowels("Erlang is great")]).