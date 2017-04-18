# This script is based on Programming Elixir book, page 36.

# handle_open = fn
#   {:ok, file} -> "Read data #{IO.read(file, :line)}"
#   {_, error}  -> "Error: #{:file.format_error(error)}"
# end
#
# IO.puts(handle_open.(File.open("/home/rvalsot/Elixir/OtherSamples/exercises/todo.md")))
# IO.puts(handle_open.(File.open("vaca")))


# Exercise functions - 2

FizzBuzzz = fn
  {0, 0, "fizzbuss"} -> IO.puts("fizzbuss")
  {0, 1, "fizz"}
end 
