-module(my_counter_server).
-behaviour(gen_server).

%% Client API.
-export([start_link/0, increament/0, decrement/0, get_count/0, reset/0]).

%% GenServe callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-define(SERVER, ?MODULE).

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).
increament() ->
    gen_server:cast(?SERVER, increament).
decrement() ->
    gen_server:cast(?SERVER, decreament).
get_count() ->
    gen_server:call(?SERVER, get_count).
reset() ->
    gen_server:call(?SERVER, reset).


init([]) ->
    {ok, 0}.

handle_call(get_count, _From, State) ->
    {reply, State, State};
handle_call(reset, _From, _State) ->
    {reply, ok, 0};
handle_call(_Request, _From, State) ->
    {reply, ok, State}.
handle_cast(increament, State) ->
    {noreply, State + 1};
handle_cast(decreament, State) ->
    {noreply, State - 1};
handle_cast(_Msg, State) ->
    {noreply, State}.
handle_info(_Info, State) ->
    {noreply, State}.
terminate(_Reason, _State) ->
    ok.
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.