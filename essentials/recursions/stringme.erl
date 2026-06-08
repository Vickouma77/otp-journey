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

%% Palindrome check
is_palindrome(Str) ->
    S = [C || C <- string:to_lower(Str), C >= $a, C =< $z],
    S =:= reverse(S).

reverse(L) -> reverse_tail(L, []).
reverse_tail([], Acc) -> Acc;
reverse_tail([H|T], Acc) -> reverse_tail(T, [H|Acc]).

% Run-length encoding (simple version)
rle([]) -> [];
rle([H|T]) -> rle(T, H, 1, []).

rle([], Char, Count, Acc) -> lists:reverse([{Char, Count} | Acc]);
rle([H|T], Char, Count, Acc) when H =:= Char ->
    rle(T, Char, Count+1, Acc);
rle([H|T], Char, Count, Acc) ->
    rle(T, H, 1, [{Char, Count} | Acc]).

start() ->
    io:format("Vowels in Erlang is great: ~p~n", [count_vowels("Erlang is great")]),
    io:format("Is 'radar' palindrome? ~p~n", [is_palindrome("radar")]),
    io:format("RLE of 'aaabbccc': ~p~n", [rle("aaabbccc")]).