[1, 2, 3, 4, 5]
|> Enum.map(fn element ->
  element * element
end)
|> Enum.with_index()
|> Enum.map(fn {value, index} ->
  value + index
end)
|> IO.inspect()

# Longest line

IO.puts(File.read!("/usr/share/dict/words"))
|> String.split()
|> Enum.max_by(String.length()) 
