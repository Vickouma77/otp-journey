-module(convert).
-export([format_temps/1]).

%%Convert a list of city temperatures to Celsius.
%%Input is a list of tuples like: 
%%  {CityName, {f, Fahrenheit}} or already-converted entries.
format_temps(List_of_cities) ->
  convert_list_to_c(List_of_cities).

%%Convert entries in a list to Celsius.
%%Recursive case:
%%  Convert Fahrenheit entry, then continue with Rest.
convert_list_to_c([{Name, {f, F}} | Rest]) ->
  Converted_city = {Name, {c, (F - 32) * 5 / 9}},
  [Converted_city | convert_list_to_c(Rest)];

%%Recursive case:
%%  Keep non-Fahrenheit entries as-is, then continue with Rest.
convert_list_to_c([City | Rest]) ->
  [City | convert_list_to_c(Rest)];

%%Base case:
%%  Converting an empty list returns an empty list.
convert_list_to_c([]) ->
  [].
