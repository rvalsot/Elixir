characters = [
  %{name: "Aragorn", weapon: "Narsil"},
  %{name: "Boromir", weapon: "Sword"},
  %{name: "Frodo",   weapon: "The one ring"},
  %{name: "Gandalf", weapon: "Stock"},
  %{name: "Gimli",   weapon: "Axe"},
  %{name: "Legolas", weapon: "Bow"},
  %{name: "Merry",   weapon: "Rock"},
  %{name: "Pippin",  weapon: "Rock"},
  %{name: "Samwise", weapon: "Pan"}
]

for person = %{weapon: weapon} <- characters,
  weapon == "Rock",
  do: IO.inspect(person)
