# Programming Elixir

# # Page 38, sample 1
# fn1 = fn ->
#   fn ->
#     IO.puts("Hello")
#   end
# end

# Page 38, sample 2

greeter = fn name ->
  (
    fn ->
      IO.puts("Hello #{name}")
    end
  )
end


juanpijamas_geeter = greeter.("Juan pijamas")

juanpijamas_geeter.()
