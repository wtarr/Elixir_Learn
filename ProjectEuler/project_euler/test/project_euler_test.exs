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

test "Test Higher order function" do
  result = HigherOrderFunction.someaction()
  assert result == 3
end

test "P17 lookup between 1 - 99" do
  lookup = HashDict.new
  lookup = HashDict.put(lookup, 1, 3)
  lookup
  num = Problem17.handleLessThan100(lookup, 0, 1)
  assert num == 3
end

test "P17 lookup hundred 100" do
  sut = String.length "onehundred"
  lookup = HashDict.new
  lookup = HashDict.put(lookup, 1,  String.length "one")
  assert Problem17.handleHundreds(lookup, 0, 100) == sut
end

test "P17 lookup between 101 - 199" do

  sut = String.length "onehundredandninetynine"
  lookup = HashDict.new
  lookup = HashDict.put(lookup, 1,  String.length "one")
  lookup = HashDict.put(lookup, 99,  String.length "ninetynine")
  lookup
  num = Problem17.handleHundredsOther(lookup, 0, 199)
  assert num == sut
end

test "P17 test process line and find length of line" do
  len = Problem17.findLength "one-hun"
  assert len == 6
end

test "P17 test line extraction/cleanup and returned length" do
  length = Problem17.findLength "one-hundred and ninety nine\n"

  assert length == 23
end

test "P17 test building lookup dict from tuple list" do
  list = [ {1, 10}, {2, 20}, {3, 30} ]
  lookup = Problem17.build_lookup_dictionary list
  {_, val} = HashDict.fetch(lookup, 2)
  assert val == 20
end

test "File is loading correct number of lines to the list" do
  file = Problem17.open("F:\\Documents\\GitHub\\Elixir_Learn\\ProjectEuler\\project_euler\\lib\\numbers.dat")
  list = Problem17.build_list file, [], 1
  assert length(list) == 100
end

test "Problem 17 Solve gives 21124" do
  assert Problem17.solve == 21124
end

test "Problem 5 - test possible candidate tester" do
  candidate = 2520
  result = Enum.reduce(1..10, 0, fn x, acc ->
    acc + rem(candidate, x)
  end)
  assert result == 0
end


end
