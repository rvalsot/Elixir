defmodule Gencounter.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: Gencounter.Worker.start_link(arg)
      # {Gencounter.Worker, arg},
      # starts counting at 0
      worker(Gencounter.Producer, [0]),
      worker(Gencounter.ProducerConsumer, []),
      worker(Gencounter.Consumer, []),
    ]

    # For some reason, I need to define the worker form to worker/2 args
    # def child_spec do
    #   import Supervisor.Spec, warn: false
    #   worker(Gencounter, [])
    # end

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Gencounter.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
