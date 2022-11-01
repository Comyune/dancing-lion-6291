defmodule FizzbuzzServerWeb.FavouriteView do
  use FizzbuzzServerWeb, :view
  alias FizzbuzzServer.Generator

  def render("index.json", %{numbers: numbers}) do
    %{numbers: numbers}
  end

  def render("show.json", %{favourite: %{id: id}}) do
    %{number: id, result: Generator.call(id), favourite: true}
  end

  def render("delete.json", %{favourite: %{id: id}}) do
    %{
      number: id,
      result: Generator.call(id),
      favourite: true,
      deleted: true
    }
  end
end
