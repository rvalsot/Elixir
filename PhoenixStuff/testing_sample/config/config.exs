# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :testing_sample,
  namespace: TestingSample, #? Should this go here?
  ecto_repos: [TestingSample.Repo]

# Configures the endpoint
config :testing_sample, TestingSampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ew+fVpSLN3ZHmQVzaY+G7vOKRf33/qmqomO+85ou6YhPGmmj2t15K3OEkDn95Np8",
  render_errors: [view: TestingSampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TestingSample.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :testing_sample, Riot,
  adapter: Riot.ApiAdapter

config :quantum, cron: [
  "@daily": 
]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
