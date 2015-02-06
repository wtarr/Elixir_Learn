defmodule StateServer do

  def state(value) do
    receive do
      {sender, :update, newvalue} ->
        state(newvalue)
      {sender, :get} ->
        send sender, {:ok, value}
        state(value)
      {sender, :exit} ->
        IO.puts("exiting ...")
    end
  end

  def start(initialValue) when is_integer(initialValue) do
    spawn(__MODULE__, :state, [initialValue])
  end

  def get(pid) do
    send pid, {self, :get}
    receive do
      {:ok, value} -> IO.puts "received #{value}"
    after 1000 ->
      IO.puts "received nothing"
    end
  end

  def update(pid, value) when is_integer(value) do
    send pid, {self, :update, value}
    get(pid)
  end

  def exit(pid) do
    send pid, {self, :exit}
  end
  
end
