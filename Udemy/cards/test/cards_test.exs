defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "greets the world" do
    assert Cards.hello() == "Welcome to Cards module"
  end

  test "size of the deck" do
    deck = Cards.create_deck()
    assert length(deck) == 40
  end

  test "Cards.shuffle_deck() randomizes the locations of the cards" do
    deck = Cards.create_deck()
    refute deck == Cards.shuffle_deck(deck)
  end
end
