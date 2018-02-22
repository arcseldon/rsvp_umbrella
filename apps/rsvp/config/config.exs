use Mix.Config

config :rsvp, ecto_repos: [Rsvp.Repo]

import_config "#{Mix.env}.exs"
