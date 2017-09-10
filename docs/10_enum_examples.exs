# Samples of the Chapter 10.- Processing collections
require(Integer)
# Auxiliary functions
output = fn(item) ->
  item
  |> IO.inspect()
end

output_n = fn(item) ->
  item
  |> IO.inspect()
  IO.puts("\n")
end

lista = [1,2,3,4,5,6,7,8,10]
string_lista = ["Niara", "Snif snif", "Hedgehog", "Pig nose"]

IO.puts("Convert collection to a list:")
Enum.to_list(1..5)
|> output_n.()

IO.puts("Concatenate two collections:")
Enum.concat([1,2,3,4], [5,6,7])
|> output.()
Enum.concat([1,2,3], ["a", "c"])
|> output_n.()

IO.puts("Create collections whose elements are some function:")
Enum.map([1,2,3,4,5], fn(member) ->
  member * 10
end)
|> output.()
IO.puts("Some number-based mapping")
Enum.map([1,2,3,4,5], &String.duplicate("*", &1))
|> output_n.()

IO.puts("Select elements by position or criteria:")
IO.puts("Position →")
Enum.at(lista, 2)
|> output.()
Enum.at(lista, 20)
|> output.()
Enum.at(lista, 20, :out_of_reach)
|> output.()
IO.puts("Filter elements →")
Enum.filter(lista, fn(member) ->
  member > 5
end)
|> output.()
Enum.filter(lista, fn(member) -> Integer.is_odd(member) end)
|> output.()
Enum.reject(lista, &Integer.is_odd/1)
|> output.()

IO.puts("Sort and compare elements:")
Enum.sort(string_lista)
|> output.()
Enum.sort(string_lista, fn(member_1, member_2) ->
  String.length(member_1) <= String.length(member_2)
end)
|> output.()
Enum.max(lista, "NAN")
|> output.()
# Enum.max_by(string_lista, "Niara", "NAN")
# |> output_n.()

IO.puts("Split a collection:")
Enum.take(lista, 3)
|> output.()
Enum.take_every(lista, 3)
|> output.()
Enum.take_while(lista, &(&1 < 4))
|> output.()
Enum.split(lista, 4)
|> output.()
Enum.split_while(lista, &(&1 > 7))
|> output_n.()

IO.puts("Join a collection:")
Enum.join(lista)
|> output.()
Enum.join(lista, ",")
|> output_n.()

IO.puts("Predicate operations:")
Enum.all?(lista, &(&1 < 1))
|> output.()
Enum.any?(lista, &(&1 > 6))
|> output.()
Enum.member?(lista, "Duck")
|> output.()
Enum.empty?(lista)
|> output_n.()

IO.puts("Merge collections:")
Enum.zip([1,2,3,4], ["a", "b", "c", "d"])
|> output.()
Enum.with_index(string_lista, 1)
|> output_n.()

IO.puts("Folding of elements into a single value:")
Enum.reduce(lista, &(&1 + &2))
|> output.()
Enum.reduce(string_lista, fn(word, longest) ->
  if String.length(word) > longest do
    String.length(word)
  else
    longest
  end
end)
|> output.()
Enum.reduce(string_lista, 0, fn(word, longest) ->
  if String.length(word) > longest do
    String.length(word)
  else
    longest
  end
end)
|> output_n.()

IO.puts("Deal a hand of 5 cards")
deck = for rank <- '23456789TJQKA', suit <- 'CDHS' do
  [suit, rank]
end
deck
|> Enum.shuffle()
|> Enum.take(5)
|> output.()
deck
|> Enum.shuffle()
|> Enum.chunk(5)
|> output.()
