%% tut6.erl
%%
%% Small example module that finds the maximum element of a non-empty list.
%%
%% The public API is `list_max/1`. It delegates to a helper, `list_max/2`,
%% which carries the current maximum (an accumulator) while traversing the list.
%%
%% Note: this implementation expects a *non-empty* list. Calling `list_max([])`
%% will fail with a function_clause error (because there is no sensible maximum
%% without picking a default).

-module(tut6).
-export([list_max/1]).

%% @doc Return the maximum element of a non-empty list.
%%
%% We seed the accumulator with the first element (`Head`), then scan the rest.
list_max([Head | Rest]) ->
  list_max(Rest, Head).

%% Helper: once the input list is exhausted, the accumulator is the answer.
list_max([], Res) ->
  Res;

%% Helper: if the next element beats the current maximum, update accumulator.
list_max([Head | Rest], Result_so_far) when Head > Result_so_far ->
  list_max(Rest, Head);

%% Helper: otherwise keep the current maximum and continue.
list_max([_Head | Rest], Result_so_far) ->
  list_max(Rest, Result_so_far).
