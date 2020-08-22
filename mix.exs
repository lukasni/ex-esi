defmodule ExEsi.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_esi,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :hackney],
      mod: {ExEsi, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      # {:gen_stage, "~> 0.14.0"}
      {:hackney, "~> 1.15", optional: true},
      {:finch, ">= 0.3.0", optional: true},
      {:jason, "~> 1.1", optional: true},
      {:timex, "~> 3.5"}
    ]
  end
end
