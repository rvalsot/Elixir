# Partial application pattern sample:
# ======================================

# Instead of a common process of:
name = "Niara"
IO.puts("Hi #{name}")

# Make it a function, apply partial application and reuse:
greeting = fn name ->
  IO.puts("Hi #{name}")
end
greeting.("Niara")
greeting.(:atom)
["Hedgehog"]

# Use list with partial application
