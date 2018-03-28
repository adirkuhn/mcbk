# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mcbk,
  ecto_repos: [Mcbk.Repo]

# Configures the endpoint
config :mcbk, Mcbk.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dzIwt4q2WJd9OomHisSbEJzkLAa8LXXkS9eEzEUA0k3dKowljwl4QeMdpdB8CcM0",
  render_errors: [view: Mcbk.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Mcbk.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
