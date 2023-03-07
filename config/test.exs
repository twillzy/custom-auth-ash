import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :custom_auth, CustomAuth.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "custom_auth_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :custom_auth, CustomAuthWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "DoqhOL//shlK9tUHX08w9NFdUjLc0tIAKblxT7s4qZQMQZc6DnLKCgJz0GWaymoo",
  server: false

# In test we don't send emails.
config :custom_auth, CustomAuth.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
