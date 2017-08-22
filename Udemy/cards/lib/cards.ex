defmodule Cards do
  @moduledoc """
    Cards module provides methods for creating and handling a deck of cards.

  """


  def hello do
    "Welcome to Cards module"
  end

  @doc """
    Returns a list of strings representing a deck of playing cards.
  """
  def create_deck do
    valores = [1, 2, 3, 4, 5, 6, 7, "Caballero", "Obispo", "Rey"]
    palos = ["Espadas", "Copas", "Oros", "Bastos"]

    for valor <- valores, palo <- palos do
        "#{valor} de #{palo}"
    end
  end

  @doc """
  ## Examples

      iex> deck = Cards.create_deck()
      iex> {hand, _deck} = Cards.deal(deck, 1)
      iex> hand
      ["1 de Espadas"]


  """
  def deal(deck, hand_size \\ 5) do
    Enum.split(deck, hand_size)
  end

  def shuffle_deck (deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  @doc """
    `save` function stores the deck into a
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load_deck(filename) do
    # {status, binary} = File.read(filename)
    # case status do
    #   :ok ->
    #     :erlang.binary_to_term(binary)
    #   :error ->
    #     "Error while loading file, does it exists?"
    # end

    case File.read(filename) do
      {:ok, binary} ->
        :erlang.binary_to_term(binary)
      {:error, reason} ->
        "Error while loading file: #{reason}"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle_deck()
    |> Cards.deal(hand_size)
  end

end
