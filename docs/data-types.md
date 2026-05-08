# Data Types in Erlang
Data in Erlang is usually referred to as ***terms*** ,built-in data types include:
- Numbers (***integers, floats***)
- Binaries/Bitstrings
- Atoms
- Tuples
- List(***and strings***)
- Unique identifiers(***pid, ports, reference***)
### 1. Numbers and Arithmetic
Erlang has two numerical data types **integers** and **floats** . Conversion is done automatically by most of the arithmetic operations, so there is no need for any type coercion.
Integers in Erlang can be of arbitrary size, they can be written in any base between 2 and 36 (0-9. A-Z/a-z). Floats are handled by ***64-bit IEEE 754-1985*** representation (double precision), There are no single precision floating-point in Erlang.

Normal infix notation is used for common arithmetic operators:
```
+, -, *
```
for divisions 2 options exists:
```
/ -> yields a floating point number; 4 / 2 ---> 2.0
div ->  7 div 2 ----> 3
```
The remainder of an integer division is given by the ```rem``` operator. There are some additional integer operators for `bitwise` operations: `N bsl K` shifts the integer, N K steps to the left, and `bsr` performs a corresponding arithmetic right shift. The `bitwise` logic operators are named `band`,` bor`,` bxor`, and `bnot`. For example,` X band (bnot Y)` masks away those bits from `X` that are set in `Y`.

### Binaries and bitstrings

