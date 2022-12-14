defmodule FizzbuzzServerWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.
  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use FizzbuzzServerWeb, :controller

  # This clause is an example of how to handle resources that cannot be found.
  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(FizzbuzzServerWeb.ErrorView)
    |> render(:"404")
  end

  def call(conn, {:error, _error}) do
    conn
    |> put_status(422)
    |> put_view(FizzbuzzServerWeb.ErrorView)
    |> render(:"422")
  end
end
