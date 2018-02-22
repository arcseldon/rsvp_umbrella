use Mix.Config

# Configure your database
config :rsvp, Rsvp.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true

# import_config "prod.secret.exs"
