defmodule Issues.Mixfile do
  use Mix.Project

  def project do
    [app: :issues,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps,
     escript: [main_module: Issues.CLI],
     test_paths: test_paths(Mix.env),
     preferred_cli_env: ["test.all": :test],
     aliases: aliases]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger, :httpoison]]
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
        {:httpoison, "~> 0.4"},
        {:jsx, "~> 2.0"}
    ]
  end

  defp aliases do
    [
      "test.all": [&test_all/1],
      issues: [&issues/1]
    ]
  end

  defp issues(args) do
    Mix.Task.run "escript.build"
    System.cmd("#{System.cwd}/issues", args,
               into: IO.binstream(:stdio, :line),
               env: [{"MIX_ENV", "integration"}])
  end

  defp test_paths(:integration), do: ["integration_tests/cases"]
  defp test_paths(_), do: ["test"]

  def test_all(args) do
    args = if IO.ANSI.enabled?, do: ["--color"|args], else: ["--no-color"|args]

    IO.puts "Running unit tests"
    Mix.Task.run "test", args

    IO.puts "Running integration tests"
    System.cmd("mix", ["test"|args],
               into: IO.binstream(:stdio, :line),
               env: [{"MIX_ENV", "integration"}])
  end
end
