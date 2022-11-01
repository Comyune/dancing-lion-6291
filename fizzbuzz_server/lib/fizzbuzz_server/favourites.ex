defmodule FizzbuzzServer.Favourites do
  @moduledoc """
  The Favourites context.
  """

  @maximum_number 100_000_000_000 # Numbers above this value will not be processed.

  alias FizzbuzzServer.{Generator, Repo, Favourites.Favourite}
  alias FizzbuzzServer.Pagination
  require Logger
  import Ecto.Query, warn: false

  @doc """
  Returns the list of favourite.

  ## Examples
      iex> list_favourites()
      [%Favourite{}, ...]
  """
  def list_favourites do
    Repo.all(Favourite)
  end

  @doc """
  Gets a single favourite.
  Raises `Ecto.NoResultsError` if the Favourite does not exist.

  ## Examples
      iex> get_favourite!(123)
      %Favourite{}
      iex> get_favourite!(456)
      ** (Ecto.NoResultsError)
  """
  def get_favourite!(id), do: Repo.get!(Favourite, id)

  @doc """
  Creates a favourite.

  ## Examples
      iex> create_favourite(%{field: value})
      {:ok, %Favourite{}}
      iex> create_favourite(%{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def create_favourite(attrs \\ %{}) do
    %Favourite{}
    |> Favourite.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a favourite.

  ## Examples
      iex> update_favourite(favourite, %{field: new_value})
      {:ok, %Favourite{}}
      iex> update_favourite(favourite, %{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def update_favourite(%Favourite{} = favourite, attrs) do
    favourite
    |> Favourite.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a favourite.

  ## Examples
      iex> delete_favourite(favourite)
      {:ok, %Favourite{}}
      iex> delete_favourite(favourite)
      {:error, %Ecto.Changeset{}}
  """
  def delete_favourite(%Favourite{} = favourite) do
    Repo.delete(favourite)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking favourite changes.

  ## Examples
      iex> change_favourite(favourite)
      %Ecto.Changeset{data: %Favourite{}}
  """
  def change_favourite(%Favourite{} = favourite, attrs \\ %{}) do
    Favourite.changeset(favourite, attrs)
  end

  @doc "Returns all numbers saved between 2 numbers inclusive."
  def between(start_number..end_number) do
    query = from f in Favourite,
      select: f.id,
      where: f.id >= ^start_number and f.id <= ^end_number

    Repo.all(query)
  end

  @doc """
  Given a page number and a per-page value, returns a list of 3 element tuples representing the
  FizzBuzz result and favourite status for the series of numbers occurring on that page.
  This function will filter out all numbers above the set @maximum_number.
  """
  def get_numbers(page: page, per_page: per_page) do
    range = Pagination.pages_to_range(page: page, per_page: per_page)
    favourites = between(range)

    for i <- range do
      if i <= @maximum_number, do: {i, Generator.call(i), Enum.member?(favourites, i)}
    end |> Enum.reject(&is_nil/1)
  end
end
