defmodule FizzbuzzServerWeb.FavouriteController do
  use FizzbuzzServerWeb, :controller
  alias FizzbuzzServer.{Pagination, Favourites, Favourites.Favourite}

  action_fallback FizzbuzzServerWeb.FallbackController

  @default_page 1
  @default_per_page 100

  def index(conn, params) do
    payload = params
      |> Pagination.parse_params(page: @default_page, per_page: @default_per_page)
      |> Favourites.get_numbers()
      |> Enum.map(fn {number, result, favourite} ->
        %{number: number, result: "#{result}", favourite: favourite}
      end)

    render(conn, "index.json", numbers: payload)
  end

  def create(conn, %{"favourite" => number}) do
    with {:ok, %Favourite{} = favourite} <- Favourites.create_favourite(%{id: number}) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.favourite_path(conn, :show, favourite))
      |> render("show.json", favourite: favourite)
    end
  end

  def delete(conn, %{"id" => id}) do
    favourite = Favourites.get_favourite!(id)

    with {:ok, %Favourite{}} <- Favourites.delete_favourite(favourite) do
      send_resp(conn, :no_content, "")
    end
  end
end
