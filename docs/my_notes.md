# Elixir


## Terminal

__Interactive Elixir__

Accessed via `iex` in Terminal.

* `iex > i something` will return information about the item.
* `iex > h` provides a group of helper functions. About a specific function, use `iex > h(func/1)` to get a description; module-level documentation is accessed via `iex > h(Module)` & `iex > h(Module.func/1)`.

You can use `iex` to:

* Compile / execute projects
* Log into remote machines
* Access already running Elixir applications.

__Script Running__

You can run scripts in terminal via:
``` bash
$ elixir file_name.exs
```

Files with `.ex` extension are intended to be compiled to byte code, while `.exs` are more for scripting languages (interpreted at source).

__Compilation__

* `iex > c "file_name.exs"` help us compile and returns `[]` with return value and modules listed.

## Types

A naming style guide is available [here](https://github.com/niftyn8/elixir_style_guide ,)

__Matching__

Instead of simple assignment, Elixir uses _pattern matching_, a pattern in the left side of the operator `=` is matched if the value on the right have the same structure and if each term in the pattern can be matched to the corresponding term in the values.

Classification
* Value types:
  * Arbitrary-sized integers
  * Floating-point numbers
  * Atoms
  * Ranges
  * Regular expressions
* System Types: resources underlying in the Erlang VM
  * PID and Ports
  * References
* Collection Types:
  * Tuples
  * Lists
  * Maps
  * Binaries
* Functions


__Basic Types__

| Type          | Example     | Notes |
| ------------- | ----------- | ----- |
| Integer       | `1911`      | Notations for binary, octal & hex are supported        |
| Float         | `92.4`      | Require dot in declaration `1.x`; `e` number supported |
| Boolean       | `true`      | Booleans `true` and `false` are atoms.                 |
| Atom / Symbol | `:atom`     | They're constants whose name is their value.           |
| String        | `Hedgehog`  | Are UTF-8 coded, they're placed between double quotes. |
| List          | `[1,2,3]`   | May contain any value
| Tuple         | `{1,2,3}`   | |

Other notes:
* _Floats_ in Elixir are `64bit` double precision.
* Type check can be done with functions: `is_binary/1`, `is_boolean/1`, `is_float/1`, `is_integer/1`, `is_number/1`.
* _Strings_ are, internally, binaries. Single-quoted are char lists.
* _Lists_ are {container, pointer} groups, while _tuples_ are an unified chunk of memory.
* _Integers_ can be written with underscores for large numbers: i.e.: `1_000`.

__Ranges__

They're represented as `start..end`, can have any value, to iterate over them, the extremes must be integers.

__Regular Expressions__

They're written as `~r{regexp}` or `~r{regexp}opts`. Any non alphanumerical character can be a delimiter. [Programming Elixir, p25 for references of functionalities]

__Lists__

Notes:
* Are composed of head|tail
* Can be added or subtracted using operator `++/2` and `--/2`. Membership is through `a in [a, b, c]`
* Can hold any value, including more collections.
* List support pattern matching.
* Key value pairs are converted into two-value tuples lists:
```
[name: "niara", species: "hedgehog", likes: "worms"]
#Goes to:
[{:name, "niara"}, {:species, "hedgehog"}, {:likes, "worms"}]
```

* Use associative lists for CLI parameters and passing around options.

__Tuples__

* Check element in position n: `elem(tuple, n)`
* Check tuple size: `tuple_size(tuple)`
* Place element in a given index n: `put_elem/3`, this will return a new tuple, because immutability.
* Tuples support pattern matching, i.e.:
``` elixir
{status, operationNo, action} = {:ok, 42, "next"}
```
* Commonly, functions return a tuple with status atom `:ok` or `:error` and function value.
* Keyword lists can be created as follows:
``` elixir
[animal: "cow", animal: "hen"]  # entry
[{:animal, "cow"}, "{}"]        # transformation
```

__Maps__

They're collection of key/value pairs, the structure goes as follows:
``` elixir
# Model: map = %{key => value, key => value}, Sample:
farm = %{"Cow" => "Milk", "Hen" => "Egg", "Swan" => "Feather"}
```

* Keys can have any value and may not be of the same type. Tuple key are allowed.
* Maps allow only unique keys.
* Use them when you want an associative array.

Elements are extracted using the `[]` notation:
``` elixir
map[key] # outputs:
Value
```
If Keys are atoms, you can use dot notation.

__Binaries__

Elixir support sequences of bits and bytes, binary literals are enclosed between `<<x>>`.
* They're used to represent UTF strings.

__Underscore__

This special variable (`_`) will discard any value of the other side of the pattern match.

__Processes Types__

`Port`, `Reference`, `PID`.

* PID: refers to a local or remote process. Currently running process is called `self`.
* Port: reference to a resource (internal or external to the application) that it will be reading or writing.
* References" are globally unique ✗


Pattern Matching assignment can occur with tuples or lists:

``` elixir
# On tuples, a = 1, b = 2, c = 3
{a, b, c} = {1, 2, 3}

# On lists, r = red, g = green, b = blue
[r, g, b] = [red, green, blue]
```

Pin operator assignment `^`

* Underscore assignment `_` is used in case of non important values. You can never read from an underscore value.

### Immutability

Premises
* Because of immutability `[head | tail]` will pass to the new element, the values, that will not change, instead of copying them.
* Any function that transforms data will return a new copy of it.


## Operators

__Booleans__

* Logic operators `and`, `or`, `not` expect booleans in their use.
* `or` and `and` are short circuit operators that will execute right side only if the left side is not enough to determine result.
* `||`, `&&`, and `!` operators will accept any argument. They will evaluate to true all values except `false` and `nil`.
* `in` tests if something is included in an enum

[__Comparison__](hexdocs.pm/elixir/master/operators.html)

| Operator    | Description |
| ----------- | ----------- |
| `==`        | Equal to... |
| `!=`        | Not equal to... |
| `===`       | Equal to..., differentiates integers and floats     |
| `!===`      | Not equal to..., differentiates integers and floats |
| `<=`, `>=`  | Lesser or Equal than..., Greater or Equal than...   |
| `<`, `>`    | Lesser than..., Greater than...                     |

Sorting between different data types should consider:
> `number < atom < reference < function < port < pid < tuple < map < list < bitstring`

__Lists__

``` elixir
# Concatenation
[1,2,3,4] ++ [5,6]

# Removal
[1,2,3] -- [2]

# Binary join
bin1 <> bin2
```

__Number__

| Operation | Operator | Notes |
| --------- | -------- | ----- |
| Addition  | `+`      |
| Subtraction | `-` |
| Multiplication | `*` |
| Division | `/` | For integer division: use `div/2` |
| Modulus  | | For integer modulus use `rem/2` |

__Strings__

``` elixir
# Concatenation
"vaquita" <> " " <> "pinta"
```

__String interpolation__
Refers to the contents of `#{...}`, which are evaluated and the result substituted back in.

## Functions

* Are identified by their name and arity (number of arguments taken). They can be checked with `is_function/1`, and their arity with `is_function/2`.
* Are created using the `fn` keyword.
* One function, given its input, can choose between multiple bodies.
* Functions can return functions 

__Anonymous Functions__

 Their basic structure is:
``` elixir
# Declaration
func_name = fn (arguments) -> body end
# Usage
func_name.(arguments)
```

Dot operator `.` makes a distinction when calling anonymous functions. If function requires no arguments, still need to use parenthesis when calling it.
They are scope-aware.

## Control Flow

__Case__

If none of the cases is matched, an error will rise.

## Bro-tips:

* `size` references are for constant time operations, while `length` for linear-time ones.
