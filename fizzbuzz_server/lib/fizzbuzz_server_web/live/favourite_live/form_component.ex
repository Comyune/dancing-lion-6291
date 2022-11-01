defmodule FizzbuzzServerWeb.FavouriteLive.FormComponent do
  use FizzbuzzServerWeb, :live_component

  alias FizzbuzzServer.Favourites

  @impl true
  def update(%{favourite: favourite} = assigns, socket) do
    changeset = Favourites.change_favourite(favourite)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"favourite" => favourite_params}, socket) do
    changeset =
      socket.assigns.favourite
      |> Favourites.change_favourite(favourite_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"favourite" => favourite_params}, socket) do
    save_favourite(socket, socket.assigns.action, favourite_params)
  end

  defp save_favourite(socket, :edit, favourite_params) do
    case Favourites.update_favourite(socket.assigns.favourite, favourite_params) do
      {:ok, _favourite} ->
        {:noreply,
         socket
         |> put_flash(:info, "Favourite updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_favourite(socket, :new, favourite_params) do
    case Favourites.create_favourite(favourite_params) do
      {:ok, _favourite} ->
        {:noreply,
         socket
         |> put_flash(:info, "Favourite created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
