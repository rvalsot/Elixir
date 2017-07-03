# Programming Elixir

My personal resume on The Pragmatic Programmers' book: [Programming Elixir](https://pragprog.com/book/elixir13/programming-elixir-1-3).

## Chapter 1.- The Red Pill

Elixir is a functional language with immutability and in-built concurrency.

In OOP, a class defines behavior and objects hold state. In Functional programming *****.

__Files__

Files in Elixir came in two extensions: `file.ex` to be compiled and `file.exs` to be run as scripts and/or thrown away. This also applies for test files to be used with applications or scripts.

Filename convention is: all lower-case, with underscores to separate words, to run them, we can use the following commands:

``` shell
# Run file
$ elixir my_file.ex
iex> c "my_file.ex"
```


## Chapter 2.- Pattern matching

> Contains:
> 1. Pattern matching
> 2. Matching handles structured data
> 3. Underscore matches

In Elixir, the `=` is a _match operator_ . A pattern on left side is matched if values on the right have the same structure.

Elixir only changes the value of a variable of left side of matcher.

Values can be ignored with the underscore matcher.

Once a variable has been matched, it keeps the same value for the rest of this match, i.e.: `✓ [a, a] = [1, 1]; ✗ [a, a] = [1, 2]`. In further matches, variable's value can be changed.

Elixir can be forced to keep present value at a further match, with caret:
``` elixir
a = 1
^a = 1  # As match uses a's current value, works fine
^a = 2  # As match would change a's value, throws back an error
```

Remember math theory: `a = x + 1`, is an equality, `a` and `x + 1` have the same value.

## Chapter 3.- Immutability

__Immutability__: in a functional program, data cannot be altered once created.

Why to use it? "_Immutable data is known data_". In Elixir a bound between variable & data would be the same until rebind.

Any function that transforms data will return a new copy of it.

## Chapter 4.- Elixir Basics

> Contains:
> 1. Value types
> 2. System types
> 3. Collection types
> 4. Naming, operators, etc

Basic types on Elixir include:

* Value types:
  * __Atoms__ constants whose name represents its value, are preceded by a colon: `:atom`. They're widely used to tag values. Samples include: `:fred, :is?, :var@2, :===, :"func", :"vaca pinta"`.
  * __Floats__: double precision (16 digits of a accuracy), must be written using decimal point and one digit: `number = 1.0` or with `e-p` notation.
  * __Integers__: can be written in decimal, hexadecimal, octal, or binary form, and separated with underscores to improve readability.
  * __Ranges__: are `start.end` who can adopt any value, to iterate, them should be integers.
  * __Regex__: regular expression literals written as `~r{regex}` or `~r{regex}opts`. {page 25}
* System types:
  * __PIDs / ports__: references to remote processes / resources to be written or read.
  * __References__: `make_ref` function creates globally unique references.
* Collection types:
  * __Tuples__: are ordered collections of values, written for a few elements within braces, can be matched: `{status, result, action} = {:ok, "vaca", "next" }`a
  * __Lists__: are linked data structures, can be empty, contain head-tails, they have several operations. Keyword lists are KVP that can be converted to tuples: `[name: "fred", age: 29] → [{:name, "fred"}, {:age, 29}]`, Keyword lists allow repeated keys.
  * __Maps__: are collections of Key-Value-Pairs: `map = %{key => value, key => value}`. It's not required that all keys are of the same type. They do not allow repeated keys. You can access elements by key: `map[key]`, if keys are atoms, you can use dot notation.
  * __Binaries__: are sequences of bits and bytes. They're written as: `bin = << content >>`. Elixir uses them to represent UTF strings.

Functions are also types. Strings and structures are built using this basic types.

Collection types can hold other collections themselves.

__Names, Source Files, Conventions__

Identifiers can be ASCII chars lower and upper case, may have question or exclamation marks.

Modules, records, protocols, and behaviors use `BumpyCase`. All others may use `this_format`. Start with underscore would not report warnings if unused.

__Booleans__
There are three boolean values: `true, false, nil`, they're equals to their atom values: `:true, :false, :nil`.

__Operators__

| Operator | Usage |
|----------|-------|
| `a === b, a !== b`  | Strict equality, strict inequality |
| `a == b, a != b`    | Value equality, value inequality |
| `<=, >=, <, >` | More than or less than operators |
| `a or b, a and b, not a` | Boolean operators, just for `true, false, nil`|
| `a (or) b, a && b, !a` | Relaxed booleans, can take any type arguments |
| `+, -, *, /, div, rem` | Arithmetic operators |
| `<>, ++, --` | Join Operators for lists |
| `in` | In-operator, checks if included in an enum |

## Chapter 5.- Anonymous Functions

> Contains:
> 1. Anonymous Functions
> 2. Pattern matching and arguments
> 3. High-order functions
> 4. Closures
> 5. The & function literal

Functions are considered a basic type, anonymous ones are delcared:
``` elixir
fn
  arg ->  body ...
end
# Sample:
iex> sum = fn(a, b) -> a + b end
iex> sum.(1,2)
3
```

Functions can be invoked, returned, and passed as arguments.

Dot notation distinguishes anonymous from named ones. If functions have no arguments, still need parenthesis to be called.

Remember that arguments passed to a function is a form of pattern-matching.

One function lets you define several implementations, given the arguments passed, keeping the same arity. We can use pattern matching to select which clause to run.

``` elixir
ma_function = fn
  {case_1} -> do_something
  {case_2} -> do_another
end
```

When returning functions, you may bind the result to a variable, and use parenthesis to call it:
``` elixir
func_1 = fn -> (fn ->"Hello folks!" end) end
func_2 = func_1.()
func_2.()
"Hello folks!"
```

Elixir carries the bindings of variables in the scope in which they're defined. This is a _closure_.

Passing functions as arguments sample:
``` elixir
a_function = fn argument ->
  does_something
end

# The 'applier' receives an anonymous function and executes it.
applier = fn(func, value) ->
  func.(value)
end
```

There's the `&` notation, but I decided to skip it as is not as obvious to readers as to makers, leading to hieroglyphic code.

## Chapter 6.- Modules and Named Functions

> Contains:
> 1. Modules, basic units of code
> 2. Defining public and private named functions
> 3. Guard clauses
> 4. Module directives and attributes
> 5. Calling Erlang modules' functions

In Elixir, named functions must be written inside modules:
``` elixir
defmodule Module_name do
  def func_name(arguments) do
    does_something
  end
end

# This can be called with:
Module_name.func_name(arguments)

# References are under function name: func_name/#
```

Modules can be complied with the file containing them or with `iex> c "file_name.exs"` command.

The actual form of the `do...end` entity block is:
``` elixir
def func_name(arguments), do:(
  does_something
)
```





## Todos;

* 35: exercise: functions-1
* 37: exercise: functions-2, 3
* 39: exercise: functions-4
* 45: exercise: Modules and functions -1, 2, 3

`[head | tail]`

List are created with brackets, with coma separation:
``` elixir
list = [1, 2, 3]
```
