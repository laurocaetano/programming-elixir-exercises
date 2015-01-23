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
