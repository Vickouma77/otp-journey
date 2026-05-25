-module(ex).

-export([make/0]).

-record(rec, {a, b = val()}).


make() ->
  #rec{}.

val() -> 
  3.
