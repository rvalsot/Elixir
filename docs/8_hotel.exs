people = [
  %{name: "Aragorn", height: 1.98},
  %{name: "Boromir", height: 1.96},
  %{name: "Legolas", height: 1.85},
  %{name: "Merry", height: 1.27},
]


defmodule HotelRooms do
  def book(%{name: name, height: height})
  when height > 1.90 do
    IO.puts("Need numenorean bed for #{name}")
  end

  def book(%{name: name, height: height})
  when height < 1.30 do
    IO.puts("Need a hobbit bed for #{name}")
  end

  def book(person) do
    IO.puts("Need regular bed for #{person.name}")
  end

end

people
|> Enum.each(&HotelRooms.book/1)
