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

  test "Problem 4 returns 906609" do
    result = Problem4.solve
    assert result == 906609
  end

  test "Problem 14 producer under a million that produces longest chain is 837799" do
    result = Problem14.solve
    assert result[:producer] == 837799
  end


end
