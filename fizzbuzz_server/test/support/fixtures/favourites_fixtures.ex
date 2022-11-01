defmodule FizzbuzzServer.FavouritesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FizzbuzzServer.Favourites` context.
  """

  @doc """
  Generate a favourite.
  """
  def favourite_fixture(attrs \\ %{}) do
    {:ok, favourite} =
      attrs
      |> Enum.into(%{id: 1})
      |> FizzbuzzServer.Favourites.create_favourite()

    favourite
  end
end
