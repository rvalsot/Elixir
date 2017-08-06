defmodule Chat.Server do
  use GenServer

  def star_link do
    GenServer.start_link(__MODULE__, [], name: :chat_room)
  end

  # get_messages(pid) for multiple processes instead of :chat_room
  def get_messages do
    GenServer.call(:chat_room, :get_messages)
  end

  def add_message(messages) do
    GenServer.cast(:chat_room, {:add_message, messages})
  end

  # server side / callback functions

  def init(messages) do
    {:ok, messages}
  end

  def handle_call(:get_messages, _from, messages) do
    {:reply, messages, messages}
  end

  def handle_cast({:add_message, message}, messages) do
    {:noreply, [message | messages]}
  end

end
