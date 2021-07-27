defmodule McEx.Mixfile do
  use Mix.Project

  def project do
    [app: :mc_ex,
      version: "0.0.1",
      elixir: "~> 1.0",
      elixirc_paths: ["lib", "plugins"],
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      #compilers: [:rustler] ++ Mix.compilers,
      deps: deps,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test],
      rustler_crates: []]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger, :gproc],
      mod: {McEx, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:poison, "~> 2.1.0"},
      {:gproc, github: "uwiger/gproc"}, #"~> 0.5.0"},
      {:uuid, "~> 1.1"},
      {:mc_chunk, github: "McEx/McChunk"},
      {:mc_protocol, github: "McEx/McProtocol"},
      {:rustler, "~> 0.21.0"},
      # Dev
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.10", only: :test},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:inch_ex, github: "rrrene/inch_ex", only: [:dev, :test]}
    ]
  end
end
