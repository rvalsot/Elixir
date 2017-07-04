defmodule Sum do
  def values(dict) do
    dict
    |> Map.values
    |> Enum.sum
  end

end

# Sum a HashDict
my_hd = [one: 1, two: 2, three: 3]
|> Enum.into(Map.new)
IO.puts("Sum of duplist -> map: #{inspect(my_hd)} is: \n #{Sum.values(my_hd)}")

# Sum a Map
map = %{ four: 4, five: 5, six: 6 }
IO.puts("The second map sum is: #{Sum.values(map)}")

kw_list = [name: "Niara", species: "hedgehog", loves: "bugs"]

mapped_list = Enum.into(kw_list, Map.new())

IO.puts("From mapped list: #{mapped_list[:name]} is a #{mapped_list[:species]}, and loves to eat: #{mapped_list[:loves]}")
IO.puts("\n")

mapped_list = Map.drop(mapped_list, [:species])
mapped_list = Map.put(mapped_list, :also_likes, "grashoppers")

other_map = %{sport: "mouse wheel"}

combinated_map = Map.merge(mapped_list, other_map)

IO.puts("Combinated map: #{inspect(combinated_map)}")
