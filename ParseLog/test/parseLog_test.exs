defmodule ParseLogTest do
  use ExUnit.Case

  test "Correct missing guid is returned" do
  	# {:ok, bin} = File.cwd()
  	# IO.puts(bin)    
    res = CompareFileGuids.main
    IO.puts(res)
    assert res == ["125"]
  end


end
