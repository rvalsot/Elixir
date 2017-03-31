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

__Basic Types__

| Type          | Example     | Notes |
| ------------- | ----------- | ----- |
| Integer       | `1911`      | Notations for binary, octal & hex are supported        |
| Float         | `92.4`      | Require dot in declaration `1.x`; `e` number supported |
| Boolean       | `true`      | Booleans `true` and `false` are atoms.                 |
| Atom / Symbol | `:atom`     | They're constants whose name is their value.           |
| String        | `Hedgehog`  | Are UTF-8 coded, they're placed between double quotes. |
| List          | `[1,2,3]`   | May contain any value
| Tuple         | `{1,2,3}`   |

Other notes:
* _Floats_ in Elixir are `64bit` double precision.
* Type check can be done with functions: `is_binary/1`, `is_boolean/1`, `is_float/1`, `is_integer/1`, `is_number/1`.
* _Strings_ are, internally, binaries. Single-quoted are char lists.
* _Lists_ are {container, pointer} groups, while _tuples_ are an unified chunk of memory.

__Lists__

Can be added or subtracted using operator `++/2` and `--/2`.
* List support pattern matching.

__Tuples__

* Check element in position n: `elem(tuple, n)`
* Check tuple size: `tuple_size(tuple)`
* Place element in a given index n: `put_elem/3`, this will return a new tuple, because immutability.
* Tuples support pattern matching


__Processes Types__

`Port`, `Reference`, `PID`.

__Matching__

Instead of simple assignment, if possible, left and right sided of the operator `=` will be bounded. i.e.:

``` bash  
iex > a = 1
iex > 1 = a
iex > 2 = a
** Match error
```

Pattern Matching assignment can occur with tuples or lists:

``` elixir
# On tuples, a = 1, b = 2, c = 3
{a, b, c} = {1, 2, 3}

# On lists, r = red, g = green, b = blue
[r, g, b] = [red, green, blue]
```

Pin operator assignment `^`

* Underscore assignment `_` is used in case of non important values. You can never read from an underscore value.

## Operators

__Booleans__

* Logic operators `and`, `or`, `not` expect booleans in their use.
* `or` and `and` are short circuit operators that will execute right side only if the left side is not enough to determine result.
* `||`, `&&`, and `!` operators will accept any argument. They will evaluate to true all values except `false` and `nil`.

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

## Functions

Are identified by their name and arity (number of arguments taken). They can be checked with `is_function/1`, and their arity with `is_function/2`.

__Anonymous Functions__

Dot operator `.` makes a distinction when calling anonymous functions.
They are scope-aware.

## Control Flow

__Case__

If none of the cases is matched, an error will rise.

## Bro-tips:

* `size` references are for constant time operations, while `length` for linear-time ones.
