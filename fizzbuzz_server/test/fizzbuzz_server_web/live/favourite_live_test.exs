defmodule FizzbuzzServerWeb.FavouriteLiveTest do
  alias FizzbuzzServer.{Repo, Favourites.Favourite}
  use FizzbuzzServerWeb.ConnCase
  import Phoenix.LiveViewTest

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

  test "rendering absurdly large pages", %{conn: conn} do
    path = Routes.favourite_index_path(conn, :index, page: 999_000_000_000, per_page: 10)
    {:ok, _index_live, html} = live(conn, path)
    assert html =~ "Showing page 999000000000 at 10 per page."
    assert html =~ "Sorry your desire for FizzBuzz has exceeded normal human parameters"
  end

  test "rendering bogus page values", %{conn: conn} do
    path = Routes.favourite_index_path(conn, :index, page: "bogus", per_page: 10)
    {:ok, _index_live, html} = live(conn, path)
    assert html =~ "Showing page 1 at 10 per page."
  end
end
