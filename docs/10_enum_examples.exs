# Samples of the Chapter 10.- Processing collections
output = fn (item) ->
  item
  |> IO.inspect()
  IO.puts("\n")
end

IO.puts("Convert collection to a list:")
list = Enum.to_list(1..5)
|> output.()

IO.puts("Concatenate two collections:")
Enum.concat([1,2,3,4], [5,6,7])
|> output.()
Enum.concat([1,2,3], ["a", "c"])
|> output.()

IO.puts("Create collections whose elements are some function:")
Enum.map(list, fn member ->
  member * 10
end)
|> output.()
Enum.map(list, fn member ->
  String.duplicate("i", member)
end)
|> output.()
