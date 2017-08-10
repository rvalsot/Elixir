defmodule Gencounter.ProducerConsumer do
  use GenStage

  require Integer

  def start_link do
    GenStage.start_link(__MODULE__, :state, name: __MODULE__)
  end

  def init(state) do
    {:producer_consumer, state, subscribe_to: [Gencounter.Producer]}
  end

  # We are counting to infinte, and filtering the even numbers to be published
  def handle_events(events, _from, state) do
    numbers = events
      |> Enum.filter(&Integer.is_even/1)

    {:noreply, numbers, state}
  end


end
