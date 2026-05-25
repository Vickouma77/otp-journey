-module(mods).

-export([print/1, area/1]).

print(Term) ->
  io:format("The value of Term is: ~w", [Term]).

area({circle, Radius}) ->
  Radius * Radius * math:pi();

area({square, Square}) ->
  Square * Square;

area({rectangle, Height, Width}) ->
  Height * Width.
