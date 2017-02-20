# Control Flow Structures

# Case

case {1,2,3} do
  {4,5,6} ->
    IO.puts("This clause is for {4,5,6}")
  {1, x, 3} ->
   IO.puts("This clause will match {1,x,3} and bind x to 2")
  _ ->
    IO.puts("Underscore clause always matches")
end

# Case with Pattern Matching

x = 1
y = 10

case 10 do
  ^x ->
    IO.puts("Will not match")
  ^y ->
    IO.puts("^y matched")
  _ ->
    IO.puts("Underscore matched")
end

# Casing + Conditioning

case {1,2,3} do
  {1,z,3} when z > 0 ->
    IO.puts("Will match")
  _ ->
    IO.puts("Undercored matched 3")
end

function_case = fn
  x, y when x > 0 -> x + y
end
