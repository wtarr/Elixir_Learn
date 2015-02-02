defmodule Problem2 do
  # expect 4613732

  # tail rec fibonacci inspired from:
  # http://stackoverflow.com/a/14294705/4408786
  def fib_tr(max) do
    fib_tr(max, 0, 1, 1, 0)
  end

  defp fib_tr(max, counter, prev, current, sum) do
    nextInSeq = prev + current
    if (current < max) do
      if rem(nextInSeq, 2) == 0 do
        sum = sum + nextInSeq
      end
      fib_tr(max, counter+1, current, nextInSeq, sum)
    else
      sum
    end
  end

  def run() do
    fib_tr 4_000_000
  end
end
