%%%-------------------------------------------------------------------
%% @doc my_counter top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(my_counter_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

-define(SERVER, ?MODULE).

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

init([]) ->
    SupFlags = #{
        strategy => one_for_one,
        intensity => 5,
        period => 10
    },

    ChildSpecs = [#{
        id => my_counter_server,
        start => {my_counter_server, start_link, []},
        restart => permanent,
        shutdown => 5000,
        type => worker,
        modules => [my_counter_server]
    }],
    
    {ok, {SupFlags, ChildSpecs}}.

%% internal functions
