defmodule FizzbuzzServer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      FizzbuzzServer.Repo,
      # Start the Telemetry supervisor
      FizzbuzzServerWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: FizzbuzzServer.PubSub},
      # Start the Endpoint (http/https)
      FizzbuzzServerWeb.Endpoint
      # Start a worker by calling: FizzbuzzServer.Worker.start_link(arg)
      # {FizzbuzzServer.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FizzbuzzServer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FizzbuzzServerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
