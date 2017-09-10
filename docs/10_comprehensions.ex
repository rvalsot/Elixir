require(Integer)

IO.puts("Normal comprehension:")
for x <- [1,2,3,4,5,6,7,8] do
  x * x
end
|> IO.inspect()

IO.puts("Comprehension with filtering:")
for x <- [1, 2, 3, 4, 5], x != 4, do: x * x
|> IO.inspect()

IO.puts("DOuble")
for x <- [1,2,3,4], y <- [4,5,6,7], Integer.is_even(x), Integer.is_even(y), do: x * y
|> IO.inspect()
