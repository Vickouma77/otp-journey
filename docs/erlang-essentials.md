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

##### List comprehensions
A comprehension is a compact notation for describing operations on sets or sequences of items (like lists). They are inspired by mathematical set notation `{x | x ∈ N, x > 0}` and are often more readable and efficient than manual recursion or `lists:map/2` and `lists:filter/2`. The basic anatomy of an Erlang list comprehension is: `[Expression || Generator, Condition1, Condition2, ...]` .A list comprehension consists of three main parts:
- **The Template (`Expression`):** What you want the new list elements to look like.
- **The Generator (`Pattern <- List`):** Where the data is coming from.
- **The Filters (Optional):** Boolean expressions to prune the data.
Example: Doubling Numbers
```erlang
L = [1, 2, 3, 4].
[X * 2 || X <- L].
%% Output: [2, 4, 6, 8]
```
Filters allow you to decide which elements make it into the final list. If the filter evaluates to `true`, the element is kept; if `false`, it is skipped.:
```erlang
L = [1, 2, 3, 4, 5, 6].
[X || X <- L, X rem 2 == 0].
%% Output: [2, 4, 6]
```
***Multiple Generators (The Cartesian Product)*** - You can use multiple generators in a single comprehension. Erlang will iterate through them like nested loops, with the rightmost generator varying fastest.
Example: Combining Suits and Values:
```erlang
Suits = [spades, hearts].
Values = [ace, king].
[{S, V} || S <- Suits, V <- Values].
%% Output: [{spades, ace}, {spades, king}, {hearts, ace}, {hearts, king}]
```
Generators aren't just for variables; you can pattern match directly within them. If an element doesn't match the pattern, it is **silently ignored** (acting as an implicit filter).
```erlang
Users = [{user, "Alice", 25}, {admin, "Bob", 40}, {user, "Charlie", 30}].
[Name || {user, Name, _Age} <- Users].
%% Output: ["Alice", "Charlie"]
%% Note: "Bob" was skipped because the pattern {user, ...} didn't match {admin, ...}.
```
Erlang also supports **`Bitstring/Binary` Comprehensions**. These use `<=` instead of `<-` and double angle brackets.A bitstring comprehension looks much like a list comprehension but is enclosed in <<...>> rather than in [...].

Example: Converting a Binary to a List:
```erlang
Bin = <<1, 2, 3, 4>>.
[X || <<X>> <= Bin].
%% Output: [1, 2, 3, 4]
```
If you have a binary of `RGB` values (3 bytes per pixel), you can process them elegantly:
```erlang
Pixels = <<255, 0, 0, 0, 255, 0>>. % Red and Green pixels
[ {R, G, B} || <<R:8, G:8, B:8>> <= Pixels ].
%% Output: [{255,0,0}, {0,255,0}]
```

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

##### 5.5 Built-in Functions
`BIFs` are functions that for some reason are built-in to the Erlang virtual machine. `BIFs` often implement functionality that is impossible or is too inefficient to implement in Erlang. Some `BIFs` can be called using the function name only but they are by default belonging to the `erlang` module. For example, the call to the `BIF` `trunc` below is equivalent to a call to `erlang:trunc`.
```erlang
2004 / 400 = 5.01
trunc(5.01) = 5
5 * 400 = 2000
```

Only a few `BIFs` can be used in guards, and you cannot use functions you have defined yourself in guards.:
```erlang
75> trunc(5.6).
5
76> round(5.6).
6
77> length([a,b,c,d]).
4
78> float(5).
5.0
79> is_atom(hello).
true
80> is_atom("hello").
false
81> is_tuple({paris, {c, 30}}).
true
82> is_tuple([paris, {c, 30}]).
false
```
Now for some `BIFs` that cannot be used in guards:
```erlang
83> atom_to_list(hello).
"hello"
84> list_to_atom("goodbye").
goodbye
85> integer_to_list(22).
"22"
```
These three `BIFs` do conversions that would be difficult (or impossible) to do in Erlang.


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

 As a special case, if expressions are a stripped-down variant of case expressions, without a specific value to switch on and without patterns. You can use an if expression when you want to have one or more clauses that only depend on what is in the guards.
 ```erlang
 if
    Condition 1 ->
        Action 1;
    Condition 2 ->
        Action 2;
    Condition 3 ->
        Action 3;
    Condition 4 ->
        Action 4
end
 ```
 Notice that there is no `;` before `end`. Conditions do the same as guards, that is, tests that succeed or fail. Erlang starts at the top and tests until it finds a condition that succeeds. Then it evaluates (performs) the action following the condition and ignores all other conditions and actions before the `end`. If no condition matches, a run-time failure occurs. A condition that always succeeds is the atom `true`. This is often used last in an `if`, meaning, do the action following the `true` if all other conditions have failed.
 Example:
 ```erlang
-module(examp).
-export([test_if/2]).

test_if(A, B) ->
    if
        A == 5 ->
            io:format("A == 5~n", []),
            a_equals_5;
        B == 6 ->
            io:format("B == 6~n", []),
            b_equals_6;
        A == 2, B == 3 ->                      %That is A equals 2 and B equals 3
            io:format("A == 2, B == 3~n", []),
            a_equals_2_b_equals_3;
        A == 1 ; B == 7 ->                     %That is A equals 1 or B equals 7
            io:format("A == 1 ; B == 7~n", []),
            a_equals_1_or_b_equals_7
    end.
 ```

# 7. Funs
Funs (functional objects) in Erlang are anonymous functions, or closures, that can be defined in-place and passed as arguments to other functions, facilitating higher-order programming. They are used for abstracting common code patterns—like `lists:map/2` or `lists:foreach/2`—and are defined using the `fun (Args) -> Body end` syntax, or by referencing existing functions using `fun FunctionName/Arity`.  Funs can:  assign functions to variables, pass functions as arguments, return functions from other functions, store functions inside data structures, create closures. They are essential for: higher order functions, list processing, callbacks, concurrent behavior construction.
#### 7.1 Funs as aliases for existing functions
```erlang
%% Create alias
fun existing_function/1

%% Or bind it to a variable
F = fun existing_function/1

%% Or pass directly to another function
another_function(fun existing_function/1)
```
*High-order functions* => These are functions that fun as input, or return fun as a result, they are used for for all sorts of things that delegates, adapters, commands, strategies. e.t.c

#### 7.2 Anonymous Functions
The syntax starts with the keyword `fun`, followed by the argument list, the arrow `->`, the body, and finally the keyword `end`.
```erlang
% Defining a simple fun that adds two numbers
Add = fun(X, Y) -> X + Y end.

% Calling the fun
Result = Add(5, 10). % Result is 15
```
Example:
```erlang
Area = fun({circle, Radius}) ->
				Radius * Radius * math:pi;
		   ({square, Side}) ->
			     Side * Side;
		    ({rectangle, Height, Width}) ->
			     Height * Width
		end
```
#### 7.3 Closures
The word closure is often used interchangeably with `fun` or `lambda expression`, but more specifically it refers to the common and extremely useful case when you’re accessing variables within `fun ... end` that are bound outside the fun. The fun value will then also encapsulate the current values of those variables. Erlang closures are anonymous functions (`fun`) that capture and retain variables from their surrounding scope at the time of creation, even when executed elsewhere. They enable passing logic with specific data contexts, allowing variables from the outer scope to be "enclosed" and utilized later, frequently used with `spawn/1` for concurrency.
**Key Aspects of Erlang Closures:**
- **Capturing Scope:** A `fun` can read variables defined in its parent function.
- **Immutable Variables:** Since Erlang variables are immutable, the value captured is the value at the moment the `fun` is defined.
- **Usage:** Commonly used in higher-order functions like `lists:map/2` or `lists:foldl/3` to pass custom logic.
- **Process Spawning:** Essential for passing state to a new lightweight process, e.g., `spawn(fun() -> do_work(State) end)`.

```erlang
-module(closure_example).
-export([start/0]).

start() ->
    Greeting = "Hello",
    % The anonymous function captures 'Greeting'
    SayHello = fun(Name) -> io:format("~s, ~s!~n", [Greeting, Name]) end,
    
    % Pass the closure to another function
    do_something(SayHello).

do_something(Function) ->
    % 'Greeting' is still accessible here, despite being out of scope
    Function("World").
% Output: Hello, World!
```
Common pitfalls: 
- Shadowing warning - If you define a variable inside the `fun` that has the same name as an enclosed variable, you may trigger compiler warnings.
- Misuse - While powerful, using closures for complex state management can make code harder to reason about; passing explicit parameters is often preferred.

# 8.Exceptions, try, and catch
Exception an alternative way of returning from a function, with the difference that it keeps going back to the caller, and to the caller’s caller, and so on, until either someone catches it or it reaches the initial call of the process (in which case the process dies).
In Erlang, exception handling is **not the primary control-flow mechanism**. The language leans hard into the “**let it crash**” philosophy from the OTP ecosystem. Instead of wrapping everything in defensive `try/catch`, Erlang assumes processes are lightweight and disposable. If one fails, a supervisor restarts it.
Erlang has three kinds of Exceptions:
	- `error` Runtime errors; Division by zero, pattern matching failure, calling undefined functions, Bad arguments.
	- `exit`  process termination signals. isn’t considered unexpected, so it isn’t reported to the error logger.
	- `throw` Non-local control transfer, this is not an error, It’s a mechanism for abruptly transferring control, similar to a controlled jump. This kind of exception is for user-defined purposes.
Summary:

| Class   | Meaning             | Typical use               |
| ------- | ------------------- | ------------------------- |
| `error` | Runtime failure     | Bugs / invalid operations |
| `exit`  | Process termination | Crash / shutdown          |
| `throw` | Control flow escape | Internal logic            |

### 8.1 Throwing (raising) exceptions
For each of the exception classes, there is a corresponding built-in function to throw (or raise) such an exception:
```erlang
throw(SomeTerm)
exit(Reason)
erlang:error(Reason)
```
Because `throw` and `exit` are common, they’re auto-imported: you don’t need to prefix them with `erlang`:. In normal code, you typically don’t need to raise error exceptions (but it can be a good thing to do if you’re writing a library and want to throw errors like `badarg`, like Erlang’s standard library functions).
As a special case, if a process calls exit(normal), and the exception isn’t caught, that process terminates as if it had finished the job it was spawned to do. This means that other (linked) processes won’t regard it as an abnormal termination (as they will for all other exit reasons).
### 8.2 Using try...catch
Introduced to replace the older, clunkier `catch` expression, the `try` block is the robust way to handle exceptions. It allows you to separate the "happy path" from the error handling logic.
```erlang
try Expression of
    SuccessfulPattern -> 
        %% Logic if Expression returns a value
        Result
catch
    Class:Reason:StackTrace -> 
        %% Logic if an exception occurs
        handle_error(Class, Reason)
after
    %% Cleanup code (runs regardless of success/failure)
    close_socket(Socket)
end.
```
- **`Class:`** This is where you specify `error`, `exit`, or `throw`. If omitted, it defaults to `throw`.
- **`StackTrace`:** In modern Erlang (OTP 21+), you can explicitly bind the stack trace to a variable for logging.
- **`After:`** This is your `finally` block. Great for closing file descriptors or database connections.

# 9. Records
Erlang records provide a way to define structured data with named fields, acting like a lightweight "struct" (similar to C structs or records in Pascal). They are syntactic sugar over plain tuples— the compiler translates all record operations into equivalent tuple operations at compile time. This means records have no runtime overhead compared to tuples but offer much better readability and maintainability.
A record is defined as:
```erlang
-record(name_of_record, {
	field_name1 = default1, 
	field_name2 = default2, 
	field_name3 = default3, 
	......
}).
```
example:
```erlang
-record(person, {
    name,           % defaults to → undefined
    age = 0,        % Default value
    email = undefined,
    active = true
}).
```
- Field names are atoms.
- You can specify default values with `= Default.`
- Fields without defaults get the atom `undefined` if not provided.
- The record name (person) becomes the first element of the underlying tuple.

Creating Records (Done in a macro-like transformation) , has the following syntax:
```erlang
P1 = #person{name = "Alice", age = 30}.
% Equivalent to: {person, "Alice", 30, undefined, true}
P2 = #person{}.  % All defaults: {person, undefined, 0, undefined, true}
P3 = #person{name = "Bob", email = "bob@example.com"}.
```
Accessing fields:
```erlang
Name = P1#person.name.     % "Alice"
Age  = P1#person.age.      % 30
```
Updating records (records are immutable so updating creates a new record):
```erlang
P4 = P1#person{age = 31, active = false}.
% #person{name="Alice", age=31, email=undefined, active=false}
```
You can update multiple fields at once. Unmentioned fields keep their values.
Pattern matching:
```erlang
print_person(#person{name = N, age = A, active = true}) ->
    io:format("~s is ~p years old and active~n", [N, A]);
print_person(#person{name = N}) ->
    io:format("~s (inactive)~n", [N]).
```

# 10. `Preprocessing` and include files
Erlang has a `preprocessor` similar to the one used in `C and C++`, which means it’s a token-level `preprocessor`. It works on the sequence of tokens produced by splitting the source file into separate words and symbols, rather than on the characters of the text. This makes it easier to reason about but also limits what it can do. The `preprocessor` always runs as part of the compilation process and performs three important tasks:` macro expansion`, `file inclusion`, and `conditional compilation`.In Erlang, **`preprocessing`** is the step that happens _before compilation_ where the source code is transformed. It’s handled by the Erlang `preprocessor` (`epp`).
#### 10.1 Defining and using macros
You can define a macro with or without parameters using the define directive, as in the following examples:
```erlang
-define(PI, 3.14).
-define(pair(X, Y), {X, Y}).
```
Macro names can be written as Erlang variables or atoms, but it’s traditional to use all uppercase for constants and mostly lowercase for other macros. To expand a macro at some point in the source code (following its definition), you must prefix it with a question mark:
```erlang
circumference(Radius) -> Radius * 2 * ?PI.  
%% circumference(Radius) -> Radius * 2 * 3.14.

pair_of_pairs(A, B, C, D) -> ?pair( ?pair(A, B), ?pair(C, D) ).
%% pair_of_pairs(A, B, C, D) -> { {A, B}, {C, D} }.
```
#### 10.2 `Undefining` a macro
The `undef` directive can be used to remove a macro definition (if there is one). For example, after the following lines:
```erlang
-define(foo, false).
-undef(foo).
-define(foo, true).
```

#### 10.4 Include Files
An Erlang source code file can include another file by using an `include directive`, which has the following form: `-include("filename.hrl")`. The text of the included file is read by the `preprocessor` and is inserted at the point of the include directive. Such files generally contain only declarations, not functions; and because they’re typically included at the top of the source file for the module, they’re known as header files. By convention, an Erlang header file has the file name extension `.hrl.`
To locate a file specified by a directive such as `-include("some_file.hrl")`., the Erlang compiler searches in the current directory for the file called `some_file.hrl`, and also in any other directories that are listed in the include path. You can add directories to the include path by using the `–I flag` to `erlc`, or by an option `{i,Directory}` to the c(...) shell function, as in:
```erlang
1> c("src/my_module", [ {i, "../include/"} ]).
```
If your code depends on a header file that is part of some other Erlang application or library, you have to know where that application is installed so you can add its header file directory to the include path. In addition, the install path may contain a version number, so if you upgraded that application, you might need to update the include path as well. Erlang has a special include directive for avoiding most of this trouble: `include_lib`. For example:
```erlang
-include_lib("kernel/include/file.hrl").
-include_lib("stdlib/include/assert.hrl").
-include_lib("myapp/include/my_records.hrl").
```

#### 10.5 Conditional compilation
Conditional compilation means that certain parts of the program may be skipped by the compiler, depending on some condition. This is often used to create different versions of the program, such as a special version for debugging. The following `preprocessor` directives control which parts of the code may be skipped, and when:
```erlang
-ifdef(MacroName).
-ifndef(MacroName).
-else.
-endif.
```
As the names indicate, `ifdef` and `ifndef` test whether a macro is defined or isn’t defined. For each `ifdef` or `ifndef`, there must be a corresponding `endif` to end the conditional section. Optionally, a conditional section may be divided in two halves by an else. For example, the following code exports the function foo/1 only if the `DEBUG` macro is defined (to any value):
```erlang
-ifdef(DEBUG).
-export([foo/1]).
-endif.
```
To control this from the command line or from your build system, you can define a macro by giving an option `{d,MacroName,Value}` to the shell `c function`, or you can pass the option `Dname=value` to the `erlc` command. Because the macro value doesn’t matter here, true is usually used. Because Erlang’s parser works on one period-terminated declaration (called a form) at a time, you can’t use conditional compilation in the middle of a function definition, because the period after the `ifdef` would be read as the end of the function. Instead, you can conditionally define a macro, and use the macro within the function, like this:
```erlang
-ifdef(DEBUG).
-define(show(X), io:format("The value of X is: ~w.~n", [X])).
-else.
-define(show(X), ok).
-endif.
foo(A) ->
	?show(A),
	...
```
If this is compiled with DEBUG defined, the foo function prints the value of A on the console before it continues with whatever the function is supposed to do. If not, the first thing in the function will be the atom `ok`, which is a constant; and because it isn’t used for anything, the compiler will optimize it away as if it hadn’t been there.

|Directive|Purpose|
|---|---|
|`-define`|Define macro|
|`-undef`|Remove macro|
|`-ifdef`|Compile if macro exists|
|`-ifndef`|Compile if macro doesn't exist|
|`-else`|Alternative branch|
|`-endif`|End condition|
|`-include`|Include file|
|`-include_lib`|Include library file|

# 11. Processes











