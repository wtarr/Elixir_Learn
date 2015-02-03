defmodule Problem14 do

  def find_longest_chain(start) do
    find_longest_chain(start, 0, start)
  end

  def find_longest_chain(1, count, producer) do
    %{:len => count + 1, :producer => producer}
  end

  def find_longest_chain(n, count, producer) do
    if rem(n, 2) == 0 do
      n = div(n, 2)
    else
      n = (3 * n) + 1
    end
    find_longest_chain(n, count + 1, producer)
  end

  def solve() do
    Enum.reduce(1..1_000_000, %{:len => 0, :producer => 0}, fn(x, acc) ->
      res = find_longest_chain x
      if res[:len] > acc[:len] do
        %{:len => res[:len], :producer => res[:producer]}
      else
        %{:len => acc[:len], :producer => acc[:producer]}
      end
      end)
  end

end
