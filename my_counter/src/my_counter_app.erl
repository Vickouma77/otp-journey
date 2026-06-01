%%%-------------------------------------------------------------------
%% @doc my_counter public API
%% @end
%%%-------------------------------------------------------------------

-module(my_counter_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    my_counter_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
