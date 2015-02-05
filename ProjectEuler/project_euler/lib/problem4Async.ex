defmodule Problem4Async do

  def calculate(begin) do
    Enum.reduce(100..999, 0, fn(x, acc) ->
          candidate = x * begin
          if HelperLibrary.is_palindrome(candidate) do
            if candidate > acc do
              candidate
            else
              acc
            end
          else
            acc
          end
        end)
  end

  def start() do
    results = 100..999
      |> Enum.map(&(Task.async(fn -> Problem4Async.calculate &1 end)))
      |> Enum.map(&Task.await/1)

      result = Enum.reduce(results, 0, fn(x, acc) ->
        if x > acc do
          x
        else
          acc
        end
      end)

      result
  end

  def solve() do
    start()
  end

end
