defmodule FizzbuzzServer.Pagination do
  @moduledoc """
  Provides pagination-related utility functions.
  """

  require Logger

  @min_page 1
  @start_page 1
  @default_per_page 100

  @doc """
  Given a current page and a per-page value returns the starting number and ending number for
  the given page.
  """
  def pages_to_range(page: page, per_page: per_page) do
    start_number = 1 + per_page * (page - 1)
    end_number = start_number - 1 + per_page
    start_number..end_number
  end

  @doc """
  Takes a map of URL parameters and applies constraints and defaults.
  """
  def parse_params(params, page: page, per_page: per_page) do
    page = ensure_integer(params["page"], page || @start_page)
    per_page = ensure_integer(params["per_page"], per_page || @default_per_page)

    [page: page, per_page: per_page]
  end

  defp ensure_integer(value, _default) when is_integer(value), do: value
  defp ensure_integer(value, default) when is_binary(value) do
    try do
      String.to_integer(value)
    rescue 
      e in ArgumentError ->
        Logger.warn "Invalid integer parameter provided. value:#{value}"
        default
    end
  end
  defp ensure_integer(_value, default), do: default
end
