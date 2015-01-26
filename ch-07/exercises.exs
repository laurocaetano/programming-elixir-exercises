defmodule Exercises do
  def len([]), do: 0
  def len([_ | tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([head | tail]), do: [head * head | square(tail)]

  def add_1([]), do: []
  def add_1([head | tail]), do: [head + 1 | add_1(tail)]

  def map([], _), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]

  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)

  def reduce(list, func), do: List.foldr(list, 0, func)

  def mapsum(list, func) do
    reduce(map(list, func), &(&1 + &2))
  end

  def max(list) do
    search_max(list, 0)
  end

  defp search_max([], max), do: max
  defp search_max([head | tail], current_max) when current_max > head, do: search_max(tail, current_max)
  defp search_max([head | tail], current_max) when current_max < head, do: search_max(tail, head)
end
