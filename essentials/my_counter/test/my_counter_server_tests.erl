-module(my_counter_server_tests).

-include_lib("eunit/include/eunit.hrl").

counter_lifecycle_test_() ->
    {setup,
     fun start_app/0,
     fun stop_app/1,
     fun() ->
         ?assertEqual(0, my_counter_server:get_count()),
         ?assertEqual(ok, my_counter_server:increment()),
         ?assertEqual(1, my_counter_server:get_count()),
         ?assertEqual(ok, my_counter_server:decrement()),
         ?assertEqual(0, my_counter_server:get_count()),
         ?assertEqual(ok, my_counter_server:increament()),
         ?assertEqual(1, my_counter_server:get_count()),
         ?assertEqual(ok, my_counter_server:reset()),
         ?assertEqual(0, my_counter_server:get_count())
     end}.

start_app() ->
    {ok, _} = application:ensure_all_started(my_counter),
    ok.

stop_app(_) ->
    application:stop(my_counter),
    ok.