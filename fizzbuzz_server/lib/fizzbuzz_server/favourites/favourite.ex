defmodule FizzbuzzServer.Favourites.Favourite do
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
