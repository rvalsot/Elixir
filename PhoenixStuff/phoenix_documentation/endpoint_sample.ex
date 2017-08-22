defmodule Hello.Application do
  use Application
  def start(_type, _args) do
    # ...

    children = [
      supervisor(HelloWeb.Endpoint, [])
    ]

    options = [
      strategy: :one_for_one
      name: Hello.Supervisor
    ]

    Supervisor.start_link(children, options)

  end

end
