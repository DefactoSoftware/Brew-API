use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :brew, Brew.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :brew, Brew.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "brew_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
