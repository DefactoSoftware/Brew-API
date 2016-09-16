# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :brew, Brew.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "GxAqwDDQPuGCtd3FyPj/gYY2NGZB7PDnVKb/cM7Wi8uoyxk7+JbJGDKeauR2t6Pa",
  render_errors: [accepts: ~w(json)],
  pubsub: [name: Brew.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :graphql_relay,
  schema_module: Brew.Schema,
  schema_json_path: "#{Path.dirname(__DIR__)}/priv/graphql"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

