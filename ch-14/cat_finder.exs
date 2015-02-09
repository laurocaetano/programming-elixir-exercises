# Take this scheduler code and update it to let you run a function that finds
# the number of times the word “cat” appears in each file in a given directory.
# Run one server process per file. The function File.ls! returns the names of
# files in a directory, and File.read! reads the contents of a file as a binary.
# Can you write it as a more generalized scheduler?

# Run your code on a directory with a reasonable number of files (maybe around 100)
# so you can experiment with the effects of concurrency.

# Text files sample at http://www.textfiles.com/100/

defmodule WordCounter do
  def find(scheduler, file, word) do
    send(scheduler, {self, {file, count_word(file, word)}})

    receive do
      {:shutdown} -> exit(:normal)
    end
  end

  defp count_word(file, word) do
    File.stream!(file)
      |> Stream.flat_map(&(String.split(&1, " ", trim: true)))
      |> Enum.to_list
      |> Enum.count(&(&1 == word))
  end
end

defmodule Scheduler do
  def schedule(module, func, files, args) do
    Enum.map(files, &(spawn_link(module, func, [self, &1, args])))
      |> collect_results([])
  end

  def collect_results([], results) do
    results
  end

  def collect_results(processes, results) do
    receive do
      {child_pid, calculated_value} ->
        send(child_pid, {:shutdown})
        collect_results(List.delete(processes, child_pid), [calculated_value|results])
    end
  end
end

File.cd("/tmp/text")
files = Enum.filter(File.ls!, &(!File.dir?(&1)))

Scheduler.schedule(WordCounter, :find, files, "cat")
  |> Enum.map(fn ({file, occurrences}) -> IO.puts "File: #{file} | Occurences: #{occurrences}" end)
