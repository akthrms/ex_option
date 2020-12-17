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
end
