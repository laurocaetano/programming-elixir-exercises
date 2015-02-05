defmodule Client do
  def start do
    pid = spawn_link(__MODULE__, :receiver, [])
    Ticker.register(pid)
  end

  def receiver do
    receive do
      {:tick} ->
        IO.puts "tock in client"
        receiver
    end
  end
end
