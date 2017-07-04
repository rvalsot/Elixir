# ListModule contains a recursion that sums, calling a background private function that does the heavy lifting.
defmodule ListModule do
  # Public
  def sum(list) do
    _sum(list,0)
  end

  # Private
  defp _sum([], total) do
    total
  end
  defp _sum([head | tail], total) do
    _sum(tail, head + total)
  end
end

myList = [1, 2, 3, 4, 5]

sumResult = ListModule.sum(myList)

IO.puts("List: #{inspect(myList)}, sum is: \n #{sumResult}")
