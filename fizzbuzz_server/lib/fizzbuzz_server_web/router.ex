defmodule FizzbuzzServerWeb.Router do
  use FizzbuzzServerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {FizzbuzzServerWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FizzbuzzServerWeb do
    pipe_through :browser
    live "/", FavouriteLive.Index, :index
  end

  scope "/api", FizzbuzzServerWeb do
    pipe_through :api
    resources "/", FavouriteController, except: [:new, :edit]
  end

  # Enables LiveDashboard only for development
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: FizzbuzzServerWeb.Telemetry
    end
  end
end
