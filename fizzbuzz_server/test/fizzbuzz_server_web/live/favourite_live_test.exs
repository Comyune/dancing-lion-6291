defmodule FizzbuzzServerWeb.FavouriteLiveTest do
  alias FizzbuzzServer.{Repo, Favourites.Favourite}
  use FizzbuzzServerWeb.ConnCase

  import Phoenix.LiveViewTest

  setup do
    Repo.delete_all(Favourite)
    :ok
  end

  test "saves favourites, updates the buttons, and deletes", %{conn: conn} do
    {:ok, index_live, _html} = live(conn, Routes.favourite_index_path(conn, :index))

    index_live
      |> element("#number-display-5 button", "Save")
      |> render_click()

    index_live
      |> element("#number-display-3 button", "Save")
      |> render_click()

    index_live
      |> element("#number-display-3 button", "Remove")
      |> render_click()

    favourites = Repo.all(Favourite)
    assert length(favourites) == 1
    assert List.first(favourites).id == 5
  end

  test "can traverse back and forth across pages", %{conn: conn} do
    {:ok, index_live, html} = live(conn, Routes.favourite_index_path(conn, :index))

    assert html =~ "Showing page 1 at 10 per page."

    html = index_live
      |> element(".pagination .next-button")
      |> render_click()

    assert html =~ "Showing page 2 at 10 per page."
  end
end
