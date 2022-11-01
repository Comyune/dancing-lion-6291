defmodule FizzbuzzServerWeb.FavouriteLiveTest do
  use FizzbuzzServerWeb.ConnCase

  import Phoenix.LiveViewTest
  import FizzbuzzServer.FavouritesFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  defp create_favourite(_) do
    favourite = favourite_fixture()
    %{favourite: favourite}
  end

  describe "Index" do
    setup [:create_favourite]

    test "lists all favourite", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, Routes.favourite_index_path(conn, :index))

      assert html =~ "Listing Favourite"
    end

    test "saves new favourite", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.favourite_index_path(conn, :index))

      assert index_live |> element("a", "New Favourite") |> render_click() =~
               "New Favourite"

      assert_patch(index_live, Routes.favourite_index_path(conn, :new))

      assert index_live
             |> form("#favourite-form", favourite: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#favourite-form", favourite: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.favourite_index_path(conn, :index))

      assert html =~ "Favourite created successfully"
    end

    test "updates favourite in listing", %{conn: conn, favourite: favourite} do
      {:ok, index_live, _html} = live(conn, Routes.favourite_index_path(conn, :index))

      assert index_live |> element("#favourite-#{favourite.id} a", "Edit") |> render_click() =~
               "Edit Favourite"

      assert_patch(index_live, Routes.favourite_index_path(conn, :edit, favourite))

      assert index_live
             |> form("#favourite-form", favourite: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#favourite-form", favourite: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.favourite_index_path(conn, :index))

      assert html =~ "Favourite updated successfully"
    end

    test "deletes favourite in listing", %{conn: conn, favourite: favourite} do
      {:ok, index_live, _html} = live(conn, Routes.favourite_index_path(conn, :index))

      assert index_live |> element("#favourite-#{favourite.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#favourite-#{favourite.id}")
    end
  end
end
