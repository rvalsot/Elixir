defmodule Calculator do
  @moduledoc """
  Documentation for Calculator.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Calculator.hello
      :world

  """
  # Spawns a separtes process for ou program to live in
  def start do
    spawn(fn ->
      loop(0)
    end)
  end


  defp loop(current_value) do
    new_value = receive do
      {:value, client_id} -> send(client_id, {:response, current_value})
      current_value

      {:addition, value} -> current_value + value
      {:subtraction, value} -> current_value - value
      {:multiplication, value} -> current_value * value
      {:division, value} -> current_value / value

      invalid_request -> IO.puts("Invalid request #{inspect invalid_request}")
      current_value # return
    end
    loop(new_value)
  end

  def value(server_id) do
    send(server_id, {:value, self()}) #self sends the state of the fucntion
    receive do
      {:response, value} -> value
    end
  end

  # Returned

  def addition(server_id, value) do
    send(server_id, {:addition, value})
    value(server_id)
  end

  def subtraction(server_id, value) do
    send(server_id, {:subtraction, value})
    value(server_id)
  end

  def multiplication(server_id, value) do
    send(server_id, {:multiplication, value})
    value(server_id)
  end

  def division(server_id, value) do
    send(server_id, {:division, value})
    value(server_id)
  end


end
