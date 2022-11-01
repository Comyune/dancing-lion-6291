defmodule FizzbuzzServer.Generator do
  @moduledoc """
  Generates a FizzBuzz response for a given input.
  """

  @doc """
  Generates the FizzBuzz result for an integer.
  """
  def call(input) when not is_integer(input), do: {:error, :input_must_be_an_integer}
  def call(input) when rem(input, 3) == 0 and rem(input, 5) == 0, do: "FizzBuzz"
  def call(input) when rem(input, 5) == 0, do: "Buzz"
  def call(input) when rem(input, 3) == 0, do: "Fizz"
  def call(input), do: "#{input}"
end
