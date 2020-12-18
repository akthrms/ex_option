# ExOption

![Elixir CI](https://github.com/akthrms/ex_option/workflows/Elixir%20CI/badge.svg)

Option library inspired by Rust.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_option` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_option, "~> 0.1.0"}
  ]
end
```

## Basic Usage

```elixir
iex> ExOption.some(2)
...> |> ExOption.map(fn x -> x * 2 end)
...> |> ExOption.unwrap()
4
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ex_option](https://hexdocs.pm/ex_option).
