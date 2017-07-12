lista_1 = Enum.to_list(1..5)

IO.puts("Enum creates a list from 1..5: list = #{inspect(lista_1)} ")

lista_2 = [1, 2]
lista_3 = [3, 4]

lista_4 = Enum.concat(lista_2, lista_3)
IO.puts("Enum concatenates:
  lista_2: #{inspect(lista_2)}
  lista_3: #{inspect(lista_3)}
  to create:
  lista_4: #{inspect(lista_4)}")

lista_5 = [2, 4, 8, 16]
lista_6 = Enum.map(lista_5, fn element -> element * element end)

IO.puts("Enum maps a list to second power:
  #{inspect(lista_5)}
  #{inspect(lista_6)}")
