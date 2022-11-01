defmodule FizzbuzzServerWeb.FavouriteView do
  use FizzbuzzServerWeb, :view
  alias FizzbuzzServer.Generator

  def render("index.json", %{numbers: numbers}) do
    %{numbers: numbers}
  end

  def render("show.json", conn) do
    number = conn[:favourite].id
    %{number: number, result: Generator.call(number), favourite: true}
  end
end
