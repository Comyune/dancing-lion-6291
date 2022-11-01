defmodule FizzbuzzServer.Favourites.Favourite do
  @moduledoc """
  This module represents the user's favourite numbers for persistance.
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "favourite" do
    timestamps()
  end

  @doc false
  def changeset(favourite, attrs) do
    favourite
    |> cast(attrs, [:id])
    |> validate_required([:id])
  end
end
