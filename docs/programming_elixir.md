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

You can define several clauses for multiple inputs with same arity, giving them different bodies. The order of definitions, is important, from top-down: simpler-to-complex. The multiple implementations should also be written together.

__Guard clauses__

They help us distinguishing between types or tests. They're used with the `when` keyword. (check `guard.exs` in this folder.)

Guard clauses are limited to built-in operators, type-check functions, and some extra functions (page 49).

__Default parameters__

For a function are passed with syntax `parameter \\ value`:
``` elixir
def function_name(parameter \\ value) do
  does_something
end
```
And are present at any invoking of the function.

__Function's Scope__

Private functions are defined with the `defp` keyword instead of `def`, you can have multiple heads, but all need to be either public or private.

__Pipe Operator__

This one links the previous function result as the argument to the following:

``` elixir
last_result = initial_process
  |> medium_process(extra_argument)
  |> last_process
```

Calling: `val |> func(a,b)` for extra arguments, is like `func(val, a, b)`.

#### Modules

They provide the namespaces for things defined by programmer: functions, macros, structures, protocols and other modules.

__Directives__ for modules are lexically scoped: beginning when it's encountered and ending with its enclosing scope end. They are:

* __Alias__: creates an alias for a Module, to shorten typing:
``` elixir
defmodule ModuleName do
  def func_name do
    alias ModuleName, as: AliasName
    do_something
  end
end
```
* __Import__: brings a module's functions/macros into the current scope. Its syntax goes: `import Module_name [, only: | except: ]`, specific imports should go with name and arity: `import List, only: [flatten: 1, duplicate: 2]`. You can combo the only with `:function` or `:macros` atoms to bring just those parts.
* __Require__: if you want to use macros defined in given module. Loads the module before code and use any macros in it.

__Attributes__

Are associated metadata to the modules, they can be defined using: `@attribute_name value` syntax. This works only at top level of the modules. They can be redefined in the same module, functions will take their last version.

Use them only for configuration and/or metadata, not as constants.

#### Erlang Libraries

You can access to any Erlang-written library, just need to remember their special properties.

## Chapter 7.- Lists and Recursion

> Contains:
> 1. Recursive structure of lists
> 2. Traversing and building lists
> 3. Accumulators
> 4. Implementing map and reduce

Lists are composed with the `list = [head | tail]` scheme, inside braces, comma separated. They can be decomposed in a succession of head|tail. Several individual patterns can be the head.

Protip: every list is terminated by an empty list:

Function recursion over list is a proper way to apply the same function to all of list's members. The blueprint of this mapping function is:

``` elixir
def mapper([], _func) do
  []
end
def mapper([head | tail], func) do
  [func.(head) | mapper(tail, func)]
end

# Variation with state keeper: (sum sample)
defmodule ModuleName do
  def mapper(list) do
    _mapper(list, initial_state)
  end

  defp _mapper([], state_keeper) do
    state_keeper
  end
  defp _mapper([head | tail], state_keeper) do
    mapper(tail, head + state_keeper)
  end
end

# Proposed reducer by author:
defmodule ModuleName do
  def reduce([], value, _) do
    value
  end
  def reduce([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end
end
```

The state keeper variation is quite tricky, that's why we call the private function to do heavy lifting.

We need to pass an initial value, the function that takes current value or reduction & next element of the collection, returning the next value of the reduction.

As empty list arguments are passed as: `[]`, single element list ones are denoted with: `[_]`.

__Lists of lists__

(incomplete)

## Chapter 8.- Dictionaries, Maps, HashDicts, Keywords, Sets, and Structs

> Contains:
> 1. 2 1/2 dictionary data types
> 2. General Dictionary API
> 3. Pattern matching and map updating
> 4. Structs
> 5. Nested data structures

__Choosing best dictionary__

* `Keyword` module helps us for more than one entry per key, ensuring ordered elements.
* `map` will help for pattern matching against contents.
* `HashDict` at BEAM will help to work with a lot of entries. (As of Elixir 1.4, they're deprecated)

Keyword lists allows for duplicated keys, but they need to be accessed via `Keyword` module. If not, just firs appearance will be returned.

Pattern matches are the most common operations for maps, via key or value identity.

Maps do not allow you to bind a value to a key during pattern matching.

Map updating can be done with the form: `new_map = %{old_map | key => value, ...}`. To add a new key, you need to use the `Dict.put_new/3` function.

__Struct__

Structs are mappish modules, with keys limited to atoms and without `Dict` or `Access.` They're named given its map type.

`defstruct` sets map's characteristics. Syntax is the same as maps, and access is through dot notation.

You can associate methods to the struct within its module.

They're also useful for polymorphism.

Access protocol can be added with `@derive Access` directive on the module.

__Nested Dictionaries__

Keys can have nested dictionaries associated with them.

``` elixir
put_in/2
update_in/3
```

| Command | Macro | Function |
|---------|-------|----------|
| `get_in` | no | (dict, keys) |
| `put_in` | (path, value) | (dict, keys, value) |
| `update_in` | (path, func)| (dict, keys, func) |
| `get_and_update_in` | (path, func) | (dict, keys, func) |

__Sets__
As of Elixir 1.4, `HashSet` are deprecated, use `MapSet` instead.

## Chapter 10.- Processing Collections - Enum and Stream

> Contains:
> 1. Enum & Stream modules
> 2. Collectable protocol
> 3. Comprehensions

Collections all share: you can iterate through them, and you can add stuff to some.

`Enum` module is the workhorse of collections. `Stream` performs lazy operations: next value is calculated only when needed.

__Enum__

Some tasks that can be done include: iterate, filter, combine, split, convert, concatenate.

Enum is heavy on resources, because each call is self contained and returns a collection.

__Stream__

They are lazy versions of Enum, that get concerned with the current value, instead of returning the whole collection.




















## Todos:

* 35: functions-1
* 37: functions-2, 3
* 39: functions-4
* 45: Modules and functions-1, 2, 3
* 47: Modules and functions-4, 5
* 52: Modules and functions-6
* 59: Modules and functions-7
* 68: Lists and recursion-0
* 69: Lists and recursion-1, 2, 3
* 72: Lists and recursion-4
* 92: Lists and recursion-5, 6
