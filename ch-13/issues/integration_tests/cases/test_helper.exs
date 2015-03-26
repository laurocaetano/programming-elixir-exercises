Logger.configure(level: :info)
ExUnit.start async: true
Code.require_file "fetch_issues_from_github.exs", __DIR__
