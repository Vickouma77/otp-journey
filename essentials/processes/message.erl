-module(message).

-export([start/0, ping/2, pong/0]).

-spec start() -> pid().
-spec ping(non_neg_integer(), pid()) -> ok.
-spec pong() -> ok.

ping(0, PongPid) when is_pid(PongPid) ->
  PongPid ! finished,
  io:format("ping finished ~n", []);

ping(N, PongPid) when is_integer(N), N > 0, is_pid(PongPid) ->
  PongPid ! {ping, self()},
  receive
    pong ->
      io:format("ping received pong~n", [])
  after 2000 ->
      io:format("ping timed out waiting for pong~n", []),
      ok
  end,
  ping(N - 1, PongPid);

ping(_, _) ->
  erlang:error(badarg).

pong() ->
  receive
    finished ->
      io:format("pong finished~n", []),
      ok;
    {ping, PingPid} when is_pid(PingPid) ->
      io:format("pong received ping~n", []),
      PingPid ! pong,
      pong()
  after 5000 ->
      io:format("pong timed out waiting for ping~n", []),
      ok
  end.

start() ->
  PongPid = spawn(message, pong, []),
  spawn(message, ping, [3, PongPid]).
