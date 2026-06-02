-module(person).
-include("person.hrl").
-export([new/2, get_name/1, celebrate_birthday/1]).

new(Name, Age) ->
  #person{name = Name, age = Age}.

get_name(#person{name = Name}) ->
  Name.

celebrate_birthday(P = #person{age = Age}) ->
  P#person{age = Age + 1}.
