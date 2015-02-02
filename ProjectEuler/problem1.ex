defmodule Problem1 do
  def solve() do
    Enum.filter(1..999,
    fn(x) ->
      if rem(x, 5) == 0 or rem(x, 3) == 0 do
         x
      end
    end)|> Enum.sum
  end
end
