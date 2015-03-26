defmodule Issues.Integration.FetchTest do
  use ExUnit.Case, async: true
  import ExUnit.CaptureIO

  test "gets user information from github" do
    assert capture_io(fn ->
      Issues.CLI.process({{"elixir-lang", "elixir", 3}})
    end) ==
    ~s{numb | created_at           | title                             \n} <>
    ~s{-----+----------------------+-----------------------------------\n} <>
    ~s{3043 | 2015-02-02T17:43:26Z | Added man page for iex/elixir     \n} <>
    ~s{3096 | 2015-02-17T15:35:14Z | Module resolution at compile time \n} <>
    ~s{3100 | 2015-02-19T15:58:34Z | Move logger flushing to Kernel CLI\n}
  end
end
