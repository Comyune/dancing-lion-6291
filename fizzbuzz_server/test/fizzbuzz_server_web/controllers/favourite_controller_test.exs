defmodule FizzbuzzServerWeb.FavouriteControllerTest do
  use FizzbuzzServerWeb.ConnCase
  import FizzbuzzServer.FavouritesFixtures
  alias FizzbuzzServer.Favourites

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all numbers with their FizzBuzz values", %{conn: conn} do
      %{id: 2} |> Favourites.create_favourite()
      path = Routes.favourite_path(conn, :index, [page: 1, per_page: 5])
      conn = get(conn, path)

      assert json_response(conn, 200) == %{"numbers" => [
        %{"number" => 1, "result" => "1",    "favourite" => false},
        %{"number" => 2, "result" => "2",    "favourite" => true},
        %{"number" => 3, "result" => "Fizz", "favourite" => false},
        %{"number" => 4, "result" => "4",    "favourite" => false},
        %{"number" => 5, "result" => "Buzz", "favourite" => false}
      ]}
    end
  end

  describe "create favourite" do
    test "renders favourite when data is valid", %{conn: conn} do
      conn = post(conn, Routes.favourite_path(conn, :create), favourite: 123)
      assert %{"number" => 123, "result" => "Fizz", "favourite" => true} = json_response(conn, 201)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.favourite_path(conn, :create), favourite: "bogus")
      assert json_response(conn, 422) == "Unprocessable Entity"
    end
  end

  describe "delete favourite" do
    setup [:create_favourite]

    test "deletes chosen favourite", %{conn: conn, favourite: favourite} do
      path = Routes.favourite_path(conn, :delete, favourite.id)
      conn = delete(conn, path)

      assert json_response(conn, 200) == %{
        "deleted" => true,
        "number" => favourite.id,
        "result" => "#{favourite.id}",
        "favourite" => true,
      }
    end
  end

  defp create_favourite(_) do
    favourite = favourite_fixture()
    %{favourite: favourite}
  end
end
