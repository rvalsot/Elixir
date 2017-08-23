defmodule Identicon do
  @moduledoc """

  """

  @doc """
    The main function is the entry point of our application. Recevies an `input` and performs the needed transformations.
  """
  def main(input) do
    input
    |> hash_input()
    |> pick_color()
    |> build_grid()
    |> filter_odd_squares()
    |> build_pixel_map()
    |> draw_image()
    |> save_image(input)
  end

  # Auxiliary functions ________________________________________________________

  def build_grid(%Identicon.Image{hexadecimal: hexadecimal} = image) do
    grid =
      hexadecimal
      |> Enum.chunk(3)
      |> Enum.map(&mirror_row/1)
      |> List.flatten()
      |> Enum.with_index()

    %Identicon.Image{image | grid: grid}
  end

  def build_pixel_map(%Identicon.Image{grid: grid} = image) do
    pixel_map = Enum.map(grid, fn({_, locator}) ->
      horizontal_position = rem(locator, 5) * 50
      vertical_position = div(locator, 5) * 50

      top_left_position = {horizontal_position, vertical_position}
      bottom_right_position = {horizontal_position + 50, vertical_position + 50}

      {top_left_position, bottom_right_position}
    end)

    %Identicon.Image{image | pixel_map: pixel_map}
  end

  def draw_image(%Identicon.Image{color: color, pixel_map: pixel_map}) do
    image = :egd.create(250, 250)
    fill = :egd.color(color)

    Enum.each(pixel_map, fn({start, stop}) ->
      :egd.filledRectangle(image, start, stop, fill)
    end)

    :egd.render(image)
  end

  def filter_odd_squares(%Identicon.Image{grid: grid} = image) do
    colored = Enum.filter(grid, fn({val, _}) ->
      rem(val, 2) == 0 # Remainder
    end)
    %Identicon.Image{image | grid: colored}
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list()

    %Identicon.Image{hexadecimal: hex}
  end

  def mirror_row(row) do
    # [a, b, c] -> [a, b, c, b, a]
    [first, second | _ ] = row
    row ++ [second, first]
  end

  def pick_color(%Identicon.Image{hexadecimal: [red, green, blue | _ ]} = image) do
    # Pattern match at arguments to our hexadecimal_list from de :hexadecimal at image
    # %Identicon.Image{hexadecimal: [red, green, blue | _ ]} = image

    # tuple beacuse it is to keep a rigorous order of precedence.
    %Identicon.Image{image | color: {red, green, blue}}
  end

  def save_image(image, input) do
    File.write("#{input}.png", image)
  end

end
