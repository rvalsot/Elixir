# streammed = Stream.map([1,2,4,5], fn element ->
#   element * 3 + 2
# end)
#
# IO.inspect(streammed)

# s = Stream.map([1,2,3,4,7], fn element -> (element + 1) end)
# IO.inspect(s)

# squares = Stream.map([1,2,3,4,5], fn member ->
#   member * member
# end)
#
# IO.inspect(squares)

[1,2,3,4,5,6,7]
|> Stream.map(fn member -> member * member end)
|> Stream.map(fn member -> member + 1 end)
|> Stream.filter(fn x -> rem(x, 2) == 1 end)
|> Enum.to_list()
|> IO.inspect()    
