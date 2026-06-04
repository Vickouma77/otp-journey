-module(my_counter_server).
-behaviour(gen_server).

%% Client API.
-export([start_link/0, increment/0, decrement/0, get_count/0, reset/0]).
-export([increament/0, decreament/0]).

%% GenServe callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-define(SERVER, ?MODULE).

-type count() :: integer.

-spec start_link() -> {ok, pid()} | {error, term()}.
-spec increment() -> ok.
-spec decrement() -> ok.
-spec get_count() -> count().
-spec reset() -> ok.
-spec increament() -> ok.
-spec decreament() -> ok.

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

increment() ->
    gen_server:cast(?SERVER, increment).

decrement() ->
    gen_server:cast(?SERVER, decrement).

get_count() ->
    gen_server:call(?SERVER, get_count).

reset() ->
    gen_server:call(?SERVER, reset).

increament() ->
    increment().

decreament() ->
    decrement().


init([]) ->
    {ok, 0}.

handle_call(get_count, _From, State) ->
    {reply, State, State};
handle_call(reset, _From, _State) ->
    {reply, ok, 0};
handle_call(_Request, _From, State) ->
    {reply, ok, State}.
handle_cast(increment, State) ->
    {noreply, State + 1};

handle_cast(decrement, State) ->
    {noreply, State - 1};
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