use Mix.Config

# Configure your database
config :rsvp, Rsvp.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "developing",
  password: "demosapp1!",
  database: "rsvp_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
