defmodule Exerkek.MixProject do
  use Mix.Project

  def project do
    [
      app: :exerkek,
      version: "0.0.1",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript_config()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Exerkek.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.4"},
      {:httpoison, "~> 2.0"}
    ]
  end

  # def app_name do
  #   Keyword.get(project(), :app) |> to_string()
  # end

  defp escript_config do
    [
      main_module: Exerkek,
      # escript hangs
      # path: ".escript/" <> app_name(),
      path: ".escript/exerkek",
      strip_beams: true
    ]
  end
end
