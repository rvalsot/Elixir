greeter = fn name ->
  (fn -> IO.puts("Tsstststs #{name}") end)
end

niara_greeter = greeter.("niara")

niara_greeter.()
