defmodule Cards do

  # Checks if a card exists in a deck
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  # Creates a new deck
  def create_deck do
    values = ["♟", "♞", "♝", "♛", "♚", "A"]
    suits  = ["♠", "♥", "♦", "♣"]

    for suit <- suits, value <- values do
        "#{value} of #{suit}"
    end

  end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

  # Creates a hand  for the user
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  # Loads a file with content, parses readable to string
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "Error found, check for reasons"
    end

  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  # Shuffles a deck
  def shuffle(deck) do
    Enum.shuffle(deck)
  end


end
