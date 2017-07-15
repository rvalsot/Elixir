deck = for rank <- '23456789TJQKA', suit <- '♤♡♢♧',
  do: [suit, rank]

deck
|> Enum.shuffle()
|> Enum.take(5)
|> IO.puts()

IO.inspect("#{deck}")
