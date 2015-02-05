defmodule Problem4 do
  def solve() do
    Enum.reduce(100..999, 0, fn(x, outer) ->
      test = Enum.reduce(100..999, 0, fn(y, inner) ->
        candidate = x * y
        if HelperLibrary.is_palindrome(candidate) do
          if candidate > inner do
            candidate
          else
            inner
          end
        else
          inner
        end
      end)

      if test > outer do
        test
      else
        outer
      end

    end)
  end
end
