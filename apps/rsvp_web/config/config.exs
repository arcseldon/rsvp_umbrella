# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :rsvp_web,
  namespace: RsvpWeb,
  ecto_repos: [Rsvp.Repo]

# Configures the endpoint
config :rsvp_web, RsvpWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "L8VpRGACK3qUXwAM6jWLDNG7T27eX1OroH2DxCqFGjRPojGsQ77qpK5O+4JwmQtm",
  render_errors: [view: RsvpWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RsvpWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :rsvp_web, :generators,
  context_app: :rsvp

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
