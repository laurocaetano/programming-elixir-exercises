defmodule Times do
  defmacro times_n(n) do
    func = :"times_#{n}"

    quote do
      def unquote(func)(arg), do: arg * unquote(n)
    end
  end
end

defmodule Test do
  require Times

  Times.times_n(3)
  Times.times_n(4)

  def test do
    IO.puts Test.times_3(4)
    IO.puts Test.times_4(5)
  end
end
