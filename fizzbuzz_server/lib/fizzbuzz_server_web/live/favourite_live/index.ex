defmodule FizzbuzzServerWeb.FavouriteLive.Index do
  alias FizzbuzzServer.{Favourites, Favourites.Favourite, Generator}
  use FizzbuzzServerWeb, :live_view
  require Logger
  import FizzbuzzServerWeb.FavouriteLive.Components,
    only: [pagination: 1, number_display: 1]

  @start_page 1
  @default_per_page 10
  @maximum_number 100_000_000_000

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, page: @start_page, per_page: @default_per_page)}
  end

  @impl true
  def handle_params(_params, _url, socket) do
    {:noreply, assign(socket, numbers: build_numbers(socket))}
  end

  @impl true
  def handle_event("save", %{"number" => number}, socket) do
    Logger.info "Saving number as favourite. number:#{number}"
    {:ok, _favourite} = Favourites.create_favourite(%{id: String.to_integer(number)})
    {:noreply, assign(socket, numbers: build_numbers(socket))}
  end

  @impl true
  def handle_event("remove", %{"number" => number}, socket) do
    Logger.info "Removing number as favourite. number:#{number}"
    {:ok, _favourite} = Favourites.delete_favourite(%Favourite{id: String.to_integer(number)})
    {:noreply, assign(socket, numbers: build_numbers(socket))}
  end

  # Private

  defp build_numbers(socket) do
    %{page: page, per_page: per_page} = socket.assigns

    start_number = page + per_page * (page - 1)
    end_number = start_number + per_page
    favourites = Favourites.between(start_number, end_number)

    for i <- start_number..end_number do
      {i, Generator.call(i), Enum.member?(favourites, i)}
    end
  end
end
