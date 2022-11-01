defmodule FizzbuzzServerWeb.FavouriteLive.Index do
  alias FizzbuzzServer.{Favourites, Favourites.Favourite, Generator, Pagination}
  use FizzbuzzServerWeb, :live_view
  require Logger

  import FizzbuzzServerWeb.FavouriteLive.Components,
    only: [pagination: 1, number_display: 1]

  @impl true
  def mount(params, _session, socket) do
    {:ok, apply_params(socket, params)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    socket = socket |> apply_params(params) |> update_numbers()
    {:noreply, update_numbers(socket)}
  end

  @impl true
  def handle_event("save", %{"number" => number}, socket) do
    Logger.info "Saving number as favourite. number:#{number}"
    {:ok, _favourite} = Favourites.create_favourite(%{id: String.to_integer(number)})
    {:noreply, update_numbers(socket)}
  end

  @impl true
  def handle_event("remove", %{"number" => number}, socket) do
    Logger.info "Removing number as favourite. number:#{number}"
    {:ok, _favourite} = Favourites.delete_favourite(%Favourite{id: String.to_integer(number)})
    {:noreply, update_numbers(socket)}
  end

  @impl true
  def handle_event("next", _params, socket) do 
    socket = socket |> assign(page: socket.assigns[:page] + 1) |> update_numbers()
    {:noreply, socket}
  end

  @impl true
  def handle_event("back", _params, socket) do 
    current_page = socket.assigns[:page] || 1
    prev_page = max(1, current_page - 1)
    socket = socket |> assign(page: prev_page) |> update_numbers()
    {:noreply, socket}
  end

  def update_numbers(%{assigns: %{page: page, per_page: per_page}} = socket) do
    assign(socket, numbers: Favourites.get_numbers(page: page, per_page: per_page))
  end

  defp apply_params(socket, params) do
    assign(socket, Pagination.parse_params(params))
  end
end
