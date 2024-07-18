defmodule Cumbuquia.MixProject do
  use Mix.Project

  def project do
    [
      app: :cumbuquia,
      version: "0.1.0",
      elixir: "~> 1.17",
      escript: [main_module: Cumbuquia],
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false}
    ]
  end
end
