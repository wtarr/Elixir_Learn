defmodule ProjectEulerTest do
  use ExUnit.Case, async: true

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

  test "Palindrome tester" do
    assert HelperLibrary.is_palindrome(12321) == true
  end

test "Test Problem 4 using Tasks" do
  result = Problem4Async.solve
  assert result == 906609
end

end
