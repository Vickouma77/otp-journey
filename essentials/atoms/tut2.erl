-module(tut2).
-export([convert/1]).

convert(Length) ->
  case Length of
    {centimeter, X} ->
      {inch, X / 2.54};
    {inch, Y} ->
      {centimeter, Y * 2.54}
  end.
