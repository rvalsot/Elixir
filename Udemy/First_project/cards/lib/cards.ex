defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello
      :world

  """
  def hello do
    "Hellow Holy Cow"
  end

  def create_deck do
    values = ["♔", "♕", "♖", "♗", "♘", "♙"]
    suits = ["Copas", "Bastos", "Monedas", "Espadas"]

    for suit <- suits do
      suit
    end

  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

end
