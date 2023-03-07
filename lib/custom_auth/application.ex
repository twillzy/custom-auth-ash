defmodule CustomAuth.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      CustomAuthWeb.Telemetry,
      # Start the Ecto repository
      CustomAuth.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: CustomAuth.PubSub},
      # Start Finch
      {Finch, name: CustomAuth.Finch},
      # Start the Endpoint (http/https)
      CustomAuthWeb.Endpoint,
      # Start a worker by calling: CustomAuth.Worker.start_link(arg)
      # {CustomAuth.Worker, arg}
      {AshAuthentication.Supervisor, otp_app: :custom_auth}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CustomAuth.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CustomAuthWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
