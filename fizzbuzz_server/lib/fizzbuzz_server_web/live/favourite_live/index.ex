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
    next_page = socket.assigns[:page] + 1

    path = Routes.favourite_index_path(
      socket, :index, page: next_page, per_page: socket.assigns[:per_page]
    )

    {:noreply, push_patch(socket, to: path)}
  end

  @impl true
  def handle_event("back", _params, socket) do 
    prev_page = max(1, socket.assigns[:page] - 1)

    path = Routes.favourite_index_path(
      socket, :index, page: prev_page, per_page: socket.assigns[:per_page]
    )

    {:noreply, push_patch(socket, to: path)}
  end

  @impl true
  def handle_event("update-per-page", params, socket) do
    path = Routes.favourite_index_path(
      socket, :index, page: socket.assigns[:page], per_page: params["per_page"]
    )

    {:noreply, push_patch(socket, to: path)}
  end

  def update_numbers(%{assigns: %{page: page, per_page: per_page}} = socket) do
    assign(socket, numbers: Favourites.get_numbers(page: page, per_page: per_page))
  end

  defp apply_params(socket, params) do
    socket |> assign(Pagination.parse_params(
      params,
      page: socket.assigns[:page],
      per_page: socket.assigns[:per_page]
    ))
  end
end
