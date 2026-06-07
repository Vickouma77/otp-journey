-module(math).
-export([start/0]).

%% Basic Recursions.
factorial(0) -> 1;
factorial(N) when N > 0 -> N * factorial(N-1).

%% Tail recusrions - large numbers.
factorial_tail(N) -> factorial_tail(N, 1).
factorial_tail(0, Acc) -> Acc;
factorial_tail(N, Acc) -> factorial_tail(N-1, N*Acc).

%% Fibonacci
fib(0) -> 0;
fib(1) -> 1;
fib(N) -> fib(N-1) + fib(N-2).

%% Tail recursive Fibonacci.
fib_tail(N) -> fib_tail(N, 0, 1).
fib_tail(0, A, _) -> A;
fib_tail(N, A, B) -> fib_tail(N-1, B, A+B).

%% Sum of digits
sum_digits(0) -> 0;
sum_digits(N) -> (N rem 10) + sum_digits(N div 10).

start() ->
    io:format("Factorial(5): ~p~n", [factorial(5)]),
    io:format("Factorial tail(10): ~p~n", [factorial_tail(10)]),
    io:format("Fib(10) ~p~n", [fib(10)]),
    io:format("Fib tail(30) ~p~n", [fib_tail(30)]),
    io:format("Sum digits 12345 ~p~n", [sum_digits(12345)]).
