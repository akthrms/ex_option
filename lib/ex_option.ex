defmodule ExOption do
  @moduledoc """
  Documentation for `ExOption`.
  """

  @type option :: {:some, any} | {:none}

  @spec none :: option
  @doc """
  No value.
  """
  def none(), do: {:none}

  @spec some(any) :: option
  @doc """
  Some value.
  """
  def some(value), do: {:some, value}

  @spec some?(option) :: boolean
  @doc """
  Returns true if the option is a some value.

  ## Examples

      iex> ExOption.some(2) |> ExOption.some?()
      true
      iex> ExOption.none() |> ExOption.some?()
      false
  """
  def some?({:some, _}), do: true

  def some?({:none}), do: false

  @spec none?(option) :: boolean
  @doc """
  Returns true if the option is a none value.

  ## Examples

      iex> ExOption.some(2) |> ExOption.none?()
      false
      iex> ExOption.none() |> ExOption.none?()
      true
  """
  def none?({:none}), do: true

  def none?({:some, _}), do: false

  @spec unwrap(option) :: any
  @doc """
  Returns the contained some value.
  Errors if the value equals none.

  ## Examples

      iex> ExOption.some("air") |> ExOption.unwrap()
      "air"

      iex> ExOption.none() |> ExOption.unwrap()
      ** (ArgumentError) the value is none
  """
  def unwrap({:some, value}), do: value

  def unwrap({:none}), do: raise(ArgumentError, "the value is none")

  @spec unwrap_or(option, any) :: any
  @doc """
  Returns the contained some value or a provided default.

  ## Examples

      iex> ExOption.some("car") |> ExOption.unwrap_or("bike")
      "car"
      iex> ExOption.none() |> ExOption.unwrap_or("bike")
      "bike"
  """
  def unwrap_or({:some, value}, _), do: value

  def unwrap_or({:none}, default), do: default

  @spec map(option, fun) :: option
  @doc """
  Maps an option T to option U by applying a function to a contained value.

  ## Examples

      iex> ExOption.some("Hello, World!") |> ExOption.map(&String.length/1)
      {:some, 13}
  """
  def map({:some, value}, fun), do: fun.(value) |> some()

  def map({:none}, _), do: none()

  @spec map_or(option, any, fun) :: any
  @doc """
  Applies a function to the contained value (if any), or returns the provided default (if not).

  ## Examples

      iex> ExOption.some("foo") |> ExOption.map_or(42, &String.length/1)
      3
      iex> ExOption.none() |> ExOption.map_or(42, &String.length/1)
      42
  """
  def map_or({:some, value}, _, fun), do: fun.(value)

  def map_or({:none}, default, _), do: default
end
