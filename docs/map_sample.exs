lista = [1, 2, 3, 4, 5, 6]

Enum.map(lista, fn elem ->
    IO.puts(elem * 2)
  end
)


Enum.map(lista, fn elem ->
    IO.puts(elem < 4)
  end
)
