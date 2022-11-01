defmodule FizzbuzzServer.Repo.Migrations.CreateFavourite do
  use Ecto.Migration

  @primary_key {:id, :id, autogenerate: false}
  def change do
    create table(:favourite) do
      timestamps()
    end
  end
end
