-module(tree).
-export([start/0]).

% Tree representation: {node, Value, Left, Right} or nil
empty() -> nil.

insert(nil, Val) -> {node, Val, nil, nil};
insert({node, V, L, R}, Val) when Val < V ->
    {node, V, insert(L, Val), R};
insert({node, V, L, R}, Val) ->
    {node, V, L, insert(R, Val)}.

% Traversals
inorder(nil) -> [];
inorder({node, V, L, R}) ->
    inorder(L) ++ [V] ++ inorder(R).

sum_tree(nil) -> 0;
sum_tree({node, V, L, R}) ->
    V + sum_tree(L) + sum_tree(R).

% Height / depth
height(nil) -> 0;
height({node, _, L, R}) ->
    1 + max(height(L), height(R)).

start() ->
    T = insert(insert(insert(empty(), 5), 3), 7),
    T2 = insert(T, 2),
    
    io:format("Inorder: ~p~n", [inorder(T2)]),
    io:format("Sum: ~p~n", [sum_tree(T2)]),
    io:format("Height: ~p~n", [height(T2)]).