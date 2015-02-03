defmodule Problem1 do
  defp pass(x) do
    if rem(x, 5) == 0 or rem(x, 3) == 0 do
       x
    end
  end
  
  def solve() do
    Enum.filter(1..999, &pass/1)|> Enum.sum
  end
end
