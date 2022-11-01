defmodule FizzbuzzServerWeb.FavouriteLive.Components do
  use FizzbuzzServerWeb, :component

  def pagination(assigns) do
    ~H"""
    <header>
      <div class="pagination">
        <button phx-click="back" class="back-button">
          Back
        </button>

        <%= page_status(assigns) %>

        <button phx-click="next" class="next-button">
          Next
        </button>
      </div>

      <.per_page_form per_page={@per_page} />
    </header>
    """
  end

  def per_page_form(assigns) do
    ~H"""
    <form phx-change="update-per-page" id="per-page">
      <% options = [10, 50, 100, 200, 500, 1000] %>

      <select name="per_page">
        <%= for n <- options do %>
          <option value={n} selected={@per_page == n}><%= n %></option>
        <% end %>
      </select>

      Per page
    </form>
    """
  end

  def page_status(assigns) do
    ~H"""
    <span class="current-page">
      Showing page <%= @page %> at <%= @per_page %> per page.
    </span>
    """
  end

  def number_display(assigns) do
    favourite_class = if assigns.favourite, do: "favourite", else: ""

    ~H"""
    <div id={"number-display-#{@number}"} class={"number-display #{favourite_class}"}>
      <span class="number"><%= @number %></span>
      <span class="result"><%= @result %></span>

      <%= if @favourite do %>
        <button class="remove-button" phx-click="remove" phx-value-number={@number}>
          Remove
        </button>
      <% else %>
        <button class="save-button" phx-click="save" phx-value-number={@number}>
          Save
        </button>
      <% end %>
    </div>
    """
  end
end
