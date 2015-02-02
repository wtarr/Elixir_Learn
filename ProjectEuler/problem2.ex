defmodule Problem2 do
  # expect 4613732

  # tail rec fibonacci inspired from:
  # http://stackoverflow.com/a/14294705/4408786
  defp fib_tr(max) do
    fib_tr(max, 1, 1, 0)
  end

  defp fib_tr(max, prev, current, sum) do    
    if (current < max) do
      nextInSeq = prev + current
      if rem(nextInSeq, 2) == 0 do
        sum = sum + nextInSeq
      end
      fib_tr(max, current, nextInSeq, sum)
    else
      sum
    end
  end

  def run() do
    fib_tr 4_000_000
  end
end
