# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :recruitme_api,
  ecto_repos: [RecruitmeApi.Repo]

# Configures the endpoint
config :recruitme_api, RecruitmeApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QLZfzMwcaSfdnqJPrpFeBBQiNsU973y3rLe6mrM3kS7wCqbcXngIJBl2XcNB3zhH",
  render_errors: [view: RecruitmeApi.ErrorView, accepts: ~w(json)],
  pubsub: [name: RecruitmeApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
