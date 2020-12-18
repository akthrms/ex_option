# ExOption

![Elixir CI](https://github.com/akthrms/ex_option/workflows/Elixir%20CI/badge.svg)

Option library inspired by Rust.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed by adding `ex_option` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_option, "~> 0.1.0"}
  ]
end
```

## Usage

```elixir
iex> some_message = ExOption.some("Hello")
{:some, "Hello"}

iex> none_message = ExOption.none()
{:none}

iex> some_message
...> |> ExOption.map(fn x -> x <> " World!" end)
...> |> ExOption.unwrap()
"Hello World!"

iex> none_message
...> |> ExOption.map(fn x -> x <> " World!" end)
...> |> ExOption.unwrap_or("Good Bye!")
"Good Bye!"
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc) and published on [HexDocs](https://hexdocs.pm).

Once published, the docs can be found at [https://hexdocs.pm/ex_option](https://hexdocs.pm/ex_option).
