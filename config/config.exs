# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :hello_phoenix, HelloPhoenix.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "hello_phoenix_repo",
  username: "user",
  password: "pass",
  hostname: "localhost"


# General application configuration
config :hello_phoenix,
  ecto_repos: [HelloPhoenix.Repo]

# Configures the endpoint
config :hello_phoenix, HelloPhoenix.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/LsQky0ZBlCCLri416/uo0hVIfxbrzMySRk4QE9vuBYlJCVs8kUEhr759dlSp6Ct",
  render_errors: [view: HelloPhoenix.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HelloPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
