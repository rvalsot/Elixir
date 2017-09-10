# Samples of the Chapter 10.- Processing collections
require(Stream)
require(String)
# Auxiliary functions
output = fn(item) ->
  item
  |> Enum.to_list()
  |> IO.inspect()
end

output_n = fn(item) ->
  item
  |> Enum.to_list()
  |> IO.inspect()
  IO.puts("\n")
end

IO.puts("Basic Stream.something() |> Enum.to_list() example:")
Stream.map([1,3,5,7,11], &(&1 + 1))
|> output_n.()

IO.puts("Stream composition")
squares = Stream.map([1,2,3,4,5,6,7,8,9,10], fn(member) -> member * member end)
|> output.()

plus_ones = Stream.map(squares, &(&1 + 1))
|> output.()

Stream.filter(plus_ones, &(rem(&1,2) == 1))
|> output_n.()

# Broken!
# IO.puts("Stream dicitionary's longest word search:")
# IO.puts(File.stream!("/usr/share/dict/words"))
# |> Enum.max_by(&String.length/1)
# |> output_n.()
