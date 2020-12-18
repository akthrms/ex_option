defmodule ExOption.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_option,
      description: "Option library inspired by Rust.",
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: [
        maintainers: ["akthrms"],
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/akthrms/ex_option"}
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.22", only: :dev, runtime: false}
    ]
  end
end
