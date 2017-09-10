output = fn(argument) ->
  argument
  |> IO.inspect()
  IO.puts("\n")
end

IO.puts("Repeatedly:")
Stream.repeatedly(&:random.uniform/0)
|> Enum.take(4)
|> output.()

IO.puts("Iterate:")
Stream.iterate(1, fn member ->
  member + member
end)
|> Enum.take(10)
|> output.()

IO.puts("Unfold:")
Stream.unfold({0,1}, fn{f1, f2} ->
  {f1, {f2, f1 + f2}}
end)
|> Enum.take(10)
|> output.()

IO.puts("Resource:")
Stream.resource(
  fn -> File.open("vaquita.txt") end,
  fn file ->
    case IO.read(file, :line) do
      line when is_binary(line) -> {[line], file}
      _ -> {:halt, file}
    end
  end ,
  fn file -> File.close!(file) end)
