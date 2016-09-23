use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :brew, Brew.Endpoint,
  secret_key_base: System.get_env("SECRET_KEY_BASE")

# Configure your database
config :brew, Brew.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("POSTGRESS_USERNAME"),
  password: System.get_env("POSTGRESS_PASSWORD"),
  database: "brew_prod",
  pool_size: 20
