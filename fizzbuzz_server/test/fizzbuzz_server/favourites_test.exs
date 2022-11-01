defmodule FizzbuzzServer.FavouritesTest do
  use FizzbuzzServer.DataCase
  alias FizzbuzzServer.Favourites

  describe "favourite" do
    alias FizzbuzzServer.Favourites.Favourite
    import FizzbuzzServer.FavouritesFixtures

    @invalid_attrs %{id: "bogus"}

    test "list_favourite/0 returns all favourite" do
      favourite = favourite_fixture()
      assert Favourites.list_favourite() == [favourite]
    end

    test "get_favourite!/1 returns the favourite with given id" do
      favourite = favourite_fixture()
      assert Favourites.get_favourite!(favourite.id) == favourite
    end

    test "create_favourite/1 with arbitrary id creates a favourite" do
      valid_attrs = %{id: 123}

      assert {:ok, %Favourite{} = favourite} = Favourites.create_favourite(valid_attrs)
    end

    test "create_favourite/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Favourites.create_favourite(@invalid_attrs)
    end

    test "update_favourite/2 with valid data updates the favourite" do
      favourite = favourite_fixture()
      update_attrs = %{}

      assert {:ok, %Favourite{} = favourite} = Favourites.update_favourite(favourite, update_attrs)
    end

    test "update_favourite/2 with invalid data returns error changeset" do
      favourite = favourite_fixture()
      assert {:error, %Ecto.Changeset{}} = Favourites.update_favourite(favourite, @invalid_attrs)
      assert favourite == Favourites.get_favourite!(favourite.id)
    end

    test "delete_favourite/1 deletes the favourite" do
      favourite = favourite_fixture()
      assert {:ok, %Favourite{}} = Favourites.delete_favourite(favourite)
      assert_raise Ecto.NoResultsError, fn -> Favourites.get_favourite!(favourite.id) end
    end

    test "change_favourite/1 returns a favourite changeset" do
      favourite = favourite_fixture()
      assert %Ecto.Changeset{} = Favourites.change_favourite(favourite)
    end
  end
end
