defmodule Identicon.Image do

  @doc """
    `Identicon.Image` will store our hexadecimal sequence from the `hash_input(input)` function.
  """
  defstruct color: nil, hexadecimal: nil, grid: nil, pixel_map: nil
  # Use this as %Identicon.Image{hex: []}
end
