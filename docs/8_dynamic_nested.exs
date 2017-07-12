nested = %{
  aragorn: %{
    personal: %{
      first_name: "Aragorn",
      last_name: "son of Arathorn"
    },
    role: "king"
  },
  legolas: %{
    personal: %{
      first_name: "Legolas",
      last_name: "son of Thranduil"
    },
    role: "prince of silvan elves"
  }
}

IO.inspect(get_in(nested, [:aragorn]))
IO.inspect(get_in(nested, [:legolas, :role]))
IO.inspect(get_in(nested, [:legolas, :personal, :first_name]))

# Could not put because do not exists already
# put_in(nested, [:gimli, :personal, :last_name], "son of Gloin")

IO.inspect(nested)
