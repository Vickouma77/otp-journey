-module(list_recursions).
-export([start/0]).

%% Sum list
sum([]) -> 0;
sum([H | T]) -> H + sum(T).

sum_tail(L) -> sum_tail(L, 0).
sum_tail([], Acc) -> Acc;
sum_tail([H|T], Acc) -> sum_tail(T, H+Acc).

%% Reverse list
reverse([]) -> [];
reverse([H|T]) -> reverse(T) ++ [H]. %inefficient

reverse_tail(L) -> reverse_tail(L, []).
reverse_tail([], Acc) -> Acc;
reverse_tail([H|T], Acc) -> reverse_tail(T, [H|Acc]).

%% Map
my_map(_, []) -> [];
my_map(F, [H|T]) -> [F(H) | my_map(F, T)].

%% Filter
my_filter(_, []) -> [];
my_filter(F, [H|T]) -> 
    case F(H) of
        true -> [H | my_filter(F, T)];
        false -> my_filter(F, T)
    end.

%% Quicksort
qsort([]) -> [];
qsort([Pivot|T]) ->
    Smaller = [X || X <- T, X < Pivot],
    Bigger = [X || X <- T, X >= Pivot],
    qsort(Smaller) ++ [Pivot] ++ qsort(Bigger).


start() ->
    L = [1, 2, 3, 4, 5],
    F = fun(X) -> X rem 2 == 0 end,

    io:format("Sum ~p~n", [sum(L)]),
    io:format("Sum tail ~p~n", [sum_tail(L)]),
    io:format("Reverse ~p~n", [reverse(L)]),
    io:format("Reverse tail ~p~n", [reverse_tail(L)]),
    io:format("Map * 2 ~p~n", [my_map(F, L)]),
    io:format("Filter even ~p~n", [my_filter(F, L)]),
    io:format("Quicksort: ~p~n", [qsort(L)]).