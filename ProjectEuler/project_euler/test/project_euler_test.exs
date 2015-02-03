defmodule ProjectEulerTest do
  use ExUnit.Case

  test "Problem 1 returns 233168" do
    result = Problem1.solve
    assert result == 233168
  end

  test "Problem 2 returns 4613732" do
    result = Problem2.solve
    assert result == 4613732
  end


end
