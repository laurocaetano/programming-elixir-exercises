defmodule ListAndRecursion do
  def all?([], _), do: true

  def all?([head|tail], func) do
    if func.(head) do
      all?(tail, func)
    else
      false
    end
  end
end
