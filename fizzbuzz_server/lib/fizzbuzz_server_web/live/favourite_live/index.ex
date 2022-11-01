defmodule FizzbuzzServerWeb.FavouriteLive.Index do
  use FizzbuzzServerWeb, :live_view

  alias FizzbuzzServer.Favourites
  alias FizzbuzzServer.Favourites.Favourite

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :favourite_collection, list_favourite())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Favourite")
    |> assign(:favourite, Favourites.get_favourite!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Favourite")
    |> assign(:favourite, %Favourite{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Favourite")
    |> assign(:favourite, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    favourite = Favourites.get_favourite!(id)
    {:ok, _} = Favourites.delete_favourite(favourite)

    {:noreply, assign(socket, :favourite_collection, list_favourite())}
  end

  defp list_favourite do
    Favourites.list_favourite()
  end
end
