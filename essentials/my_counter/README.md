my_counter
=====

An OTP application

Build
-----

    $ rebar3 compile

Usage
-----

Start the app in a shell and use the stable API:

    1> application:ensure_all_started(my_counter).
    2> my_counter_server:increment().
    ok
    3> my_counter_server:get_count().
    1
    4> my_counter_server:reset().
    ok
