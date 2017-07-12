groups = [
  %{group: "Silvan Elves", kingdom: "Mirkwood"},
  %{group: "Black Uruks", kingdom: "Minas Morgul"},
  %{group: "Shapeshifters", kingdom: "Beorn's town"},
  %{group: "Dunedain", kingdom: "Cardolan"},
  %{group: "Ents", kingdom: "Forest of Farngon" },
  %{group: "Black Numenoreans", kingdom: "Umbar"}
]

kingdoms_filter = fn (:get, collection, next_fn) ->
  for row <- collection do
    if String.contains?(row.kingdom, "u") do
      next_fn.(row)
    end
  end
end

IO.inspect(get_in(groups, [kingdoms_filter, :group]))
