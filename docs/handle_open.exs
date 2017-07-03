handle_open = fn
  {:ok, file} ->
    "First line: \n #{IO.read(file, :line)}"
  {_, error} ->
    "Error: #{:file.format_error(error)}"
end

IO.puts(handle_open.(File.open("programming_elixir.md")))
IO.puts(handle_open.(File.open("crazy_cow")))
