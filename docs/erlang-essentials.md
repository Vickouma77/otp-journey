# Erlang Shell
The Erlang shell is an interactive REPL(Read, Evaluate, Print, Loop).  It enables execution of Erlang expressions, test code, spawn processes, inspect state, compile modules, debug interactively.  starts in :
```Bash
erl
```

```erlang
Erlang/OTP 28 [...]
Eshell V28
1>
```
Everything in Erlang is an expression. The expressions are evaluated and values are returned.
```erlang
1> 2 + 3.
5
```
The period matters.
Erlang shell runs in two modes: 
- **Normal mode** ; which commands can be edited and expressions evaluated
- **Job Control Mode (JCL)**;  Jobs can be started, killed, detached or connected.

##### Erlang Shell Commands Cheat Sheet
| Command                             | Description                                | Example                                     |
| ----------------------------------- | ------------------------------------------ | ------------------------------------------- |
| `erl`                               | Starts the Erlang shell                    | `erl`                                       |
| `q().`                              | Quits the shell                            | `q().`                                      |
| `init:stop().`                      | Gracefully shuts down Erlang VM            | `init:stop().`                              |
| `h().`                              | Displays shell help                        | `h().`                                      |
| `h(Module).`                        | Shows module help                          | `h(lists).`                                 |
| `h(Module, Function).`              | Shows help for specific function           | `h(lists, map).`                            |
| `f().`                              | Clears all variable bindings               | `f().`                                      |
| `f(Var).`                           | Clears specific variable binding           | `f(X).`                                     |
| `v(N).`                             | Retrieves result of shell command number N | `v(2).`                                     |
| `pwd().`                            | Prints current working directory           | `pwd().`                                    |
| `cd(Path).`                         | Changes directory                          | `cd("/home/user/project").`                 |
| `ls().`                             | Lists files in current directory           | `ls().`                                     |
| `c(Module).`                        | Compiles and loads module                  | `c(math).`                                  |
| `l(Module).`                        | Reloads compiled module                    | `l(math).`                                  |
| `nl(Module).`                       | Reloads module from disk                   | `nl(math).`                                 |
| `m().`                              | Lists loaded modules                       | `m().`                                      |
| `code:all_loaded().`                | Lists all loaded modules                   | `code:all_loaded().`                        |
| `code:is_loaded(Module).`           | Checks if module is loaded                 | `code:is_loaded(math).`                     |
| `rr(Module).`                       | Loads record definitions from module       | `rr(user).`                                 |
| `rr("file.hrl").`                   | Loads records from header file             | `rr("include/user.hrl").`                   |
| `b().`                              | Shows all variable bindings                | `b().`                                      |
| `bt(Pid).`                          | Prints stack trace of process              | `bt(Pid).`                                  |
| `flush().`                          | Displays and clears mailbox messages       | `flush().`                                  |
| `self().`                           | Returns current process ID                 | `self().`                                   |
| `processes().`                      | Lists all running processes                | `processes().`                              |
| `process_info(Pid).`                | Displays process info                      | `process_info(Pid).`                        |
| `i().`                              | Lists process information summary          | `i().`                                      |
| `i(Pid).`                           | Shows detailed process info                | `i(Pid).`                                   |
| `memory().`                         | Displays VM memory usage                   | `memory().`                                 |
| `erlang:memory().`                  | Detailed memory stats                      | `erlang:memory().`                          |
| `node().`                           | Returns current node name                  | `node().`                                   |
| `nodes().`                          | Lists connected nodes                      | `nodes().`                                  |
| `net_adm:ping(Node).`               | Tests connection to another node           | `net_adm:ping('node2@host').`               |
| `application:which_applications().` | Lists running applications                 | `application:which_applications().`         |
| `observer:start().`                 | Opens graphical system monitor             | `observer:start().`                         |
| `timer:tc(Fun).`                    | Times execution of function                | `timer:tc(fun() -> lists:seq(1,1000) end).` |
| `spawn(Fun).`                       | Creates new process                        | `spawn(fun() -> io:format("Hi") end).`      |
| `Pid ! Msg`                         | Sends message to process                   | `Pid ! hello.`                              |
| `flush().`                          | Reads received messages                    | `flush().`                                  |
| `Ctrl + G`                          | Opens user switch command mode             | Press in shell                              |
| `a` (after Ctrl+G)                  | Aborts current shell                       | `a`                                         |
| `c` (after Ctrl+G)                  | Continue shell                             | `c`                                         |
| `i` (after Ctrl+G)                  | Interrupt shell                            | `i`                                         |
| `k` (after Ctrl+G)                  | Kill shell process                         | `k`                                         |
| `q` (after Ctrl+G)                  | Quit Erlang VM                             | `q`                                         |

# 2.Data Types in Erlang
Data in Erlang is usually referred to as ***terms*** ,built-in data types include:
- Numbers (***integers, floats***)
- Binaries/Bitstrings
- Atoms
- Tuples
- List(***and strings***)
- Unique identifiers(***pid, ports, reference***)
### 2.1. Numbers and Arithmetic
Erlang has two numerical data types **integers** and **floats** . Conversion is done automatically by most of the arithmetic operations, so there is no need for any type coercion.
Integers in Erlang can be of arbitrary size, they can be written in any base between 2 and 36 (0-9. A-Z/a-z). Floats are handled by ***64-bit IEEE 754-1985*** representation (double precision), There are no single precision floating-point in Erlang.

Normal infix notation is used for common arithmetic operators:
```
+, -, *
```
for divisions 2 options exists:
```erlang
%% yields a floating point number; 4 / 2 ---> 2.0
%% div ->  7 div 2 ----> 3
```
The remainder of an integer division is given by the ```rem``` operator. There are some additional integer operators for `bitwise` operations: `N bsl K` shifts the integer, N K steps to the left, and `bsr` performs a corresponding arithmetic right shift. The `bitwise` logic operators are named `band`,` bor`,` bxor`, and `bnot`. For example,` X band (bnot Y)` masks away those bits from `X` that are set in `Y`.

### 2.2.Binaries and bitstrings
In Erlang, **binaries** and **bitstrings** are low-level data types used for working with raw binary data efficiently — things like network packets, file contents, protocol messages, cryptographic data, and serialization.
***Bitstrings*** is a simple sequence of bits, this means it contains any number of bits not necessarily divisible by 8.
```erlang
%1 = value and 3 = store it using 3 bits. 
%001 will be the binary representation.
<<1:3>>
```
***Binary*** is a bitstring whose size is a multiple of 8 bits (1 byte). Every binary is bitstring and not every bitstring is a binary. Or a binary is -- `bitstring where bit_size mod 8 = 0`
The relationship:
```bash
bitstring
   └── binary
```

### 2.3.Atoms
**Atoms** are one of Erlang’s core data types. An atom is a **constant whose value is its own name**. Think of them as symbolic labels or named constants. Atom are mainly used as identifiers. They are stored in the table and referred to by the table index, and they have a length of 255 characters. 
```erlang
ok
error
hello
connected
user_created
```
Each of these items are atoms.Unlike variables , atoms are not placeholders for values.
example:
```erlang
Status = ok.  %Status is a value, while ok is an atom.
```
How atoms are written:
##### Unquoted atoms - must start with lower-case.
```erlang
ok
error
true
false
node_down
```

##### Quoted atoms - 
if atom contains spaces, uppercase letters, special characters. You must quote it using a single quote:
```erlang
'Hello'
'user disconnected'
'HTTP/2'
'Some Atom'
```
Erlang has predefined atoms:
```erlang
true
false
undefined
ok
error
```
Atoms are stored in the **VM’s global atom table**. Once atoms are created, it stays there, it is not garbage collected. 

### 2.4.Tuples
A tuple is a fixed-length ordered sequence of other Erlang terms.Tuples are written within curly braces:
```erlang
{1, 2, 3, 4}
{one, two, three, four}
{from, "Russia", "with love"}
{complex, {nested, "structue", {here}}}
{}
```
A standard convention in Erlang is to label tuples to indicate what type of data they contain, by using an `atom` as the first element, as in `{size, 42}`, or `{position, 5, 2}`. These are called `tagged tuples`.Tuples are the main way of constructing compound data structures or returning
multiple values in Erlang

### 2.5.Lists
Lists are used to hold an arbitrary number of items. They’re written within square brackets, and in the simplest form they look like this:
```erlang
[]
[1, 2, 3]
[one, two, three]
[[1, 2, 3], [4, 5, 6]]
[{tomorrow, "buy cheese"}, 
 {soon, "fix trap door"}, 
 {later, "repair moon rocket"}
]
```
An empty list is called a `nil` .What you can do with lists that you can’t do as easily and efficiently with tuples is create a new, longer list from an existing list in such a way that the old list is a part of the new one. This is signaled with `| character (a vertical bar)`. For example: `[ 1 | [] ]`
This combines the empty list on the right of the `|` with the additional element 1 on the left, yielding the list `[1]`. `[2 | [1]]` will yield `[2, 1]` . Lists of arbitrary length can use the `++` operator to append. `[1, 2, 3, 4]++[5, 6, 7, 8]` yields the list `[1, 2, 3, 4, 5, 6, 7, 8]`

##### The structure of a list
Basically, lists are created from the empty list (nil) and so called `list cells` which add one element at a time on top of an existing list, building a `singly linked` list in memory. Each such cell uses only two words of memory: one for the value (or a pointer to the value), known as the `head`, and one to the pointer of to the rest of the list, called the `tail`. List cells are sometimes called `cons cells` from `(list constructor)`, he action of adding a `cons cell` is known as ***consing*** 
### 2.6.Strings
A double-quoted string in Erlang is merely an alternative way of writing a list of character codes.  For example, these:
```erlang
"abcd"
"Hello!"
" \t\r\n"
""
```
are exactly equivalent to:
```erlang
[97,98,99,100]
[72,101,108,108,111,33]
[32,9,13,10]
[]
```
which can also be written:
```erlang
[$a, $b, $c, $d]
[$H, $e, $l, $l, $o, $!]
[$\ , $\t, $\r, $\n]
[]
```

### 2.7. Pids, ports, and references
##### (a). Pids(Process Identifier)
Erlang supports programming with processes; for any code to run, an Erlang process must be running it. Every process has a unique process identifier often referred to as `pid` . `Pids` are special characters and should be thought of as opaque objects. But when the shell prints them, they show up in the form `<0.35.0>` that is, as three integers enclosed in angle brackets.The function `self()` always gives you the pid of the process that is currently running (the one that called `self()`).
##### (b).Port Identifiers
A port is much like a process, except that it can also communicate with the world outside Erlang (and can’t do much else—in particular, it can’t run any code). Hence, port identifiers are closely related to `pids`, and the shell prints them on the form #Port<0.472>.
##### (c).References
Often called `refs`. They are created with the function `make_ref()` and printed in the shell in the form of #Ref`<0.0.0.39>`. Reference are used as unique one-off labels or cookies.

### 2.8.Functions as data: funs
Erlang is said to be a `functional` programming language, and an expected feature of such a language is that it should be able to handle functions as data that is, pass a function as input to another function, return a function as the result of another function, put a function in a data structure and pick it up later, and so on.Of course, you must also be able to call a function that you’ve gotten that way. In Erlang, such a `function-as-data` object is called a fun (or sometimes a `lambda expression or closure`).

### 2.9. Comparing Terms
The different data types in Erlang have one thing in common: they can all be compared and ordered, using built-in operators like `<, >`, and  `==`. The normal orderings on numbers of course hold, so that `1 < 2` and `3.14 > 3` and so on, and atoms and strings (as well as any other lists) and tuples are ordered `lexicographically`, so that` 'abacus' < 'abba'`, `"zzz" > "zzy"`, `[1,2,3] > [1,2,2,1]`, and `{fred,baker,42} < {fred,cook,18}`. So far, it all seems pretty normal; but on top of that, you also have an ordering between values of different types, so that, for example, `42 < 'aardvark'`,` [1,2,3] > {1,2,3}`, and` 'abc' < "abc"`. That is, all numbers come before all atoms, all tuples come before all lists, and all atoms come before all tuples and lists (`strings are lists, remember?`). The important thing to know is that you can compare any two terms for order, and you’ll  get the same result always. In particular, if you sort a list of various terms of different types (a list of mixed numbers, strings, atoms, tuples, ...) by using the standard library function `lists:sort(...)`, you’ll always get a properly sorted list as a result, where all the numbers come first, then all atoms, and so on. You can try it in the shell: for example:
```erlang
1> lists:sort([b,3,a,"z",1,c,"x",2.5,"y"]).
```
There are two kinds of operators for equality comparisons in Erlang. The first one is the `exact equality`, written` =:=`, which returns true only if both sides are exactly the same. For example, `42 =:= 42`. The negative form `(exact inequality)` is written `=/=`, as,  for example  `1 =/= 2`.
Exact equality is the preferred kind of equals operator when you’re comparing terms in general - it is also used in pattern matching. But it means that integers and floating-point numbers are considered to be different, even if they’re as similar as could be. For instance, `2 =:= 2.0` returns `false`. If you’re comparing numbers in general (or perhaps tuples containing numbers, like vectors) in a mathematical way, you should instead use the arithmetic equality operator, written  `==`. This compares numbers by coercing integers to floating point as necessary. Hence, `2 == 2.0` returns `true`.

### 2.10 Maps
Maps are a set of key to value associations. These associations are encapsulated with `#{` and `}`. To create an association from `"key"` to `value 42`:
```erlang
> #{ "key" => 42 }.
#{"key" => 42}
```

If tuples are fixed-position containers and lists are sequential collections, **maps are Erlang’s key-value associative data structure**. Maps were added relatively late (OTP 17), so older Erlang code often leans heavily on `records` and `proplists`. Modern Erlang uses maps constantly. Maps are not ordered collections, any terms are allowed as key,  maps are immutable updating creates a new map.

Map uses `#{}`, key-value separator `=>`,  accessing value:
```erlang
>1 M = #{name => "Jane"}.
#{name = "Jane"}
>2 maps:get(name, M).
"Jane"
```
Updating: Add
```erlang
>1 M1 = #{name => "John"}.
#{name => "John"}
>2 M2 = M1#{age => 25}.
#{name => "John", age => 25}
```
Updating: Replacing
```erlang
>3 M3 = M2#{age => 26}.
#{name => "John", age => 26}
```
For strict updates only use `:=` ; This only updates if the key exists. Pattern Matching also works with maps:
```erlang
>4 #{name := Name, age := Age} = #{name => "John", age => 26}.
#{name => "John",age => 26}
```

### Core commands to remember

| Operation     | Syntax                    |
| ------------- | ------------------------- |
| Create        | `#{a => 1}`               |
| Access        | `M#{a}`                   |
| Safe get      | `maps:get(a, M, Default)` |
| Add/update    | `M#{a => 2}`              |
| Strict update | `M#{a := 2}`              |
| Remove        | `maps:remove(a, M)`       |
| Keys          | `maps:keys(M)`            |
| Values        | `maps:values(M)`          |
| Merge         | `maps:merge(M1,M2)`       |
| Size          | `map_size(M)`             |


# 3.Modules and Functions
Erlang has modules, which are containers for program code. Each module has a unique name, which is specified as an atom.
`tut.erl`
```erlang
-module(tut).
-export([double/1]).

double(X) ->
    2 * X.
```
Compile the program:
```erlang
3> c(tut).
{ok,tut}
```

The `{ok,tut}` means that the compilation is OK. If it says `error` it means that there is some mistake in the text that you entered. Additional error messages gives an idea to what is wrong so you can modify the text and then try to compile the program again.
run:
```erlang
>4 tut:double(10).
20
```
The first line of code is the module name don't forget the full stop(.)
```erlang
-module(tut).
```
The second line says that the module `tut` contains a function called `double`, which takes one argument (`X`)
```erlang
-export([double/1]).
```

Calling a function from another module in this form `lists:rverse([1, 2, 3, 4])` is called `remote call`, as opposed to a `local call` which is  calling a function in the same module.
The number of arguments a function takes is called `arity`; a function that takes zero argument is `nullary fucntion`, one argument is `unary function`, two arguments `binary function`, three arguments `ternary function`. The full name of a function must always include the arity (written with a slash as separator). `double/1`.
Like any other programming language, Erlang comes with a standard library of useful functions. These are spread over a large number of modules, but some standard library modules are more commonly used than others. In particular, the module named `erlang` contains functions that are central to the entire Erlang system, which everything else builds on. Another useful module that you’ve seen already is the `lists` module. The `io` module handles basic text input and output. The `dict` module provides hash-based associative arrays (dictionaries), the `array` module provides extensible integer-indexed arrays, and so forth. Some functions are involved with things that are so low-level that the functions are an intrinsic part of the language and the runtime system. These are commonly referred to as `built-in functions (BIFs)`, and like the Erlang runtime system, they’re implemented in the C programming language. All functions in the `erlang` module are `BIF`.

# 4. Variables and Pattern matching
Erlang variables begin with an uppercase letter, lowercase letters are reserved for atoms.:
```erlang
Z
Name
ShoeSize
ThisIsAVeryLongVariableName
```
You can also begin a variable with an underscore character. In that case, the second character is by convention usually an uppercase character:
```erlang
_Something
_X
_this_my_look_like_an_atom_but_is_really_a_variable
```
There is a small difference in functionality here: the compiler normally warns you if you assign a value to a variable and then don’t use that variable for anything. This catches a lot of silly mistakes, so don’t turn off that warning. Instead, when you want to use a variable for something to make the program more readable, you can use one that starts with an underscore.
Erlang variables are strictly single assignment, when a variable is bound to a value - that variable will hold that value throughout its entire `scope`.The simplest form of assignment in Erlang is through the `=` operator. This is a `match operator`.
Pattern matching serves the following important purposes:
- Choosing control flow branches
- Performing variable assignments(binding)
- Decomposing data structures(selecting and extracting parts)
# 5. Function and Clauses
Functions and clauses are where Erlang’s design really starts to click. They lean heavily on:
* Pattern Matching
* Multiple clauses
* Guards
* Recursions instead of loops

This is the core of everything: `process behavior`, `OTP call backs`, `message handling`.
The standard library function `io:format(...)` is the normal way of writing text to the standard `output stream` in Erlang. It takes two arguments: the first is a format string, and the second is a list of terms to be printed.:
```erlang
print(Term) ->
  io:format("The value of Term is: ~p.~n", [Term]).
```
The escape code `~p` in the format string means to pretty-print an Erlang term. The escape code `~n` means “insert a line break,” so you get a new line after the message. The escape code `~w` means “print an Erlang term in its raw form” without fancy line breaking and without printing lists as double-quoted strings even if they contain only printable character codes.
##### 5.1 What is a Function
A function is named block of logic. The general form of a function is:
```erlang
name(Arguments) ->
  expression.
```
example:
```erlang
add(A, B) ->
  A + B.
```
Function call:
```erlang
add(3, 7) % 16
```

`Arity` means the number of arguments or operands in a function, operator or relation takes in logic, mathematics and computer science. So the function above is referred to as : `add/2`. `Arity` matters because:
```erlang
%% foo/1 and foo/2 ==> both are valid
foo(X)
foo(X, Y)
```
are two different functions. In short, Erlang identifies functions by **Name + Arity** . Everything returns a value -- Functions always return the value of the last expression. No explicit return value as the last expression is always the return value.
##### 5.2 What is a Clause
A clause is one version of a function, a function can have multiple clauses. Example:
```erlang
%% This is one function describe/1 with
%% three clauses
describe(0) ->
  zero;
describe(1) ->
  one;
describe(N) -> 
  many.
```
Erlang checks clauses top to bottom, the first matching clause wins. Clause order matters A lot.
Instead of writing conditionals inside functions, Erlang often expresses logic through clause patterns.
```erlang
handle({ok, Data}) -> 
  Data;
handle({error, Reason}) ->
  Reason.
```
Matching Atoms; the act like enum variants:
```erlang
status(ok) ->
  success;
status(error) ->
  failed.
```

##### 5.3 Guards
Sometimes patterns aren't enough so we introduce `when condition`. Guards refine clause matching.
```erlang
classify(N) when N < 0 ->
  negative;
classify(0) ->
  0;
classify(N) when N > 0 ->
  positive;
```
Common Guard Functions which live in the `erlang module`:
```erlang
is_integer(X)
is_atom(X)
is_list(X)
is_binary(X)
is_map(X)
```
example:
```erlang
describe(X) when is_integer(X) ->
   integer;
describe(X) when is_atom(X) ->
   atom.
```
Boolean logic:
```erlang
andalso
orelse
```
example:
```erlang
valid(X) when is_integer(X) andalso X > 0 ->
    true.
```

##### 5.4 Anonymous Functions
unnamed functions
```erlang
fun(Args) -> Expr end
```
example:
```erlang
Double = fun(X) -> X * 2 end.
```

# 6. Cases and Expressions
A `case` expression evaluates a value and matches it against clauses.
```erlang
case Expression of
    Pattern1 ->
        Result1;

    Pattern2 ->
        Result2
end.
```
It means:  Evaluate `Expression` ,Compare result against patterns, Execute first matching clause, Return its value
example:
```erlang
case 2 of
    1 -> one;
    2 -> two;
    3 -> three
end.   %Result -> 2
```
Erlang cases are not statements, they return values and therefore you can  bind them.:
```erlang
Result =
    case 5 of
        5 -> matched;
        _ -> no_match
    end.
```
They can also be used directly:
```erlang
io:format("~p~n",
    [case X of
        0 -> zero;
        _ -> nonzero
     end]).
```
Tuple matching:
```erlang
case {ok, "data"} of
    {ok, Value} ->
        Value;

    {error, Reason} ->
        Reason
end.
```
List matching:
```erlang
case [1,2,3] of
    [] ->
        empty;

    [H|T] ->
        {head, H, tail, T}
end. %{head,1,tail,[2,3]}
``` 









