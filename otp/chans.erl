-module(chans).
-export([start/0]).
-export([alloc/0, free/1]).
-export([init/0]).

start() ->
    spawn(ch1, init, []).

alloc() ->
    ch1 ! {self(), alloc},
    receive
        {ch1, Res} ->
            Res
    end.

free(Ch) ->
    ch1 ! {free, Ch},
    ok.

init() ->
    register(ch1, self()),
    Chs = channels(),
    loop(Chs).

loop(Chs) ->
    receive
        {From, alloc} ->
            {Ch, Chs2} = alloc(Chs),
            From ! {ch1, Ch},
            loop(Chs2);
        {free, Ch} ->
            Chs2 = free(Ch, Chs),
            loop(Chs2)
    end.

channels() ->
    % create an initial pool of channels
    N = 10,
    lists:map(fun(_) -> spawn(fun channel/0) end, lists:seq(1, N)).

channel() ->
    receive
        _Msg ->
            % channels are simple message mailboxes; ignore messages
            channel()
    end.

alloc([Ch|Rest]) ->
    {Ch, Rest};
alloc([]) ->
    % no free channels, create a new one
    Ch = spawn(fun channel/0),
    {Ch, []}.

free(Ch, Chs) ->
    % return channel to pool
    [Ch | Chs].