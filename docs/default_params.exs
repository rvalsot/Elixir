defmodule Example do
  def func(p1, p2 \\ "bowman", p3 \\ "crossbowman") do
    IO.inspect([p1, p2, p3])
  end
end

Example.func(1,2,3)
Example.func("arbalest", "monkey", "ram")
Example.func("this", "is", "the", "potatoe")
