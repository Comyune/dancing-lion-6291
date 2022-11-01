defmodule FizzbuzzServerWeb.FavouriteLive.Components do
  use FizzbuzzServerWeb, :component

  def pagination(assigns) do
    ~H"""
    <div class="pagination">
      <button phx-click="back">Back</button>
      <%= page_browser(assigns) %>
      <button phx-click="next">Next</button>


      <select phx-change="update-per-page">
        <option>50</option>
        <option>100</option>
        <option>200</option>
        <option>500</option>
        <option>1000</option>
      </select>
    </div>
    """
  end

  def page_browser(assigns) do
    ~H"""
    <span>1</span>
    <span>2</span>
    <span>3</span>
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
