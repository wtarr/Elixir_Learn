defmodule Problem4 do
  def greater(a, b) do
    if a > b do
      a
    else
      b
    end
  end

  def solve() do
    Enum.reduce(100..999, 0, fn(x, outer) ->
      test = Enum.reduce(100..999, 0, fn(y, inner) ->
        candidate = x * y
        if HelperLibrary.is_palindrome(candidate) do
          greater(candidate, inner)
        else
          inner
        end
      end)
      greater(test, outer)
    end)
  end
end
