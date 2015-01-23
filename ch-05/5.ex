sum = fn (a, b) -> a + b end
IO.puts sum.(1, 2)

greet = fn -> IO.puts "Hello" end
greet.()

f1 = fn a, b -> a * b end
IO.puts f1.(5, 6)

list_concat = fn (list_1, list_2) -> list_1 ++ list_2 end
list_concat.([:a, :b], [:c, :d])

sum = fn (a, b, c) -> a + b + c end
IO.puts sum.(1, 2, 3)

pair_tuple_to_list = fn (tuple) -> [elem(tuple, 0), elem(tuple, 1)] end
pair_tuple_to_list.({1234, 5678})

handle_open = fn
  {:ok, file} -> "First line: #{IO.read(file, :line)}"
  {_, error} -> "Error: #{:file.format_error(error)}"
end

IO.puts handle_open.(File.open("README.md"))
IO.puts handle_open.(File.open("Inexistent_file"))

fizz_buzz = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
  (_, _, a) -> a
end

IO.puts fizz_buzz.(0, 0, 1)
IO.puts fizz_buzz.(0, 1, 1)
IO.puts fizz_buzz.(1, 1, 1)

call_fizz_buzz_with_rem = fn (n) -> fizz_buzz.(rem(n, 3), rem(n, 5), n) end

IO.puts call_fizz_buzz_with_rem.(10)
IO.puts call_fizz_buzz_with_rem.(11)
IO.puts call_fizz_buzz_with_rem.(12)
IO.puts call_fizz_buzz_with_rem.(13)
IO.puts call_fizz_buzz_with_rem.(14)
IO.puts call_fizz_buzz_with_rem.(15)
IO.puts call_fizz_buzz_with_rem.(16)

prefix = fn (a) ->
  fn (b) ->
    "#{a} #{b}"
  end
end

IO.puts prefix.("Elixir").("Rocks")

times_2 = fn (a) -> a * 2 end

apply = fn (fun, value) -> fun.(value) end

IO.puts apply.(times_2, 10)

list = [1, 2, 3, 4, 5, 6, 7]
Enum.map list, fn elem -> elem * 2 end

speak = &(IO.puts(&1))
speak.("Hello")

Enum.map [1, 2, 3, 4], &(&1 + 2)
Enum.map [1, 2, 3, 4], &(IO.inspect &1)
