defmodule Problem5 do

  def isCandidate(candidate) do

    result = Enum.reduce(1..20, 0, fn x, acc ->
      acc + rem(candidate, x)
    end)

    if result == 0 do
      true
    else
      false
    end

  end

end
