defmodule CalculatorUsingProcessesTest do
  use ExUnit.Case

  test "adder only works" do
  	pid = spawn(Adder, :loop, [])
  	send pid, {self(), 1, 2}
  	receive do
  		{:ok, sum} ->
  			assert sum == 3
  		after 1000 ->
  			assert false 
  	end 	
  end

  test "subtractor only works" do
  	pid = spawn(Subtractor, :loop, [])
  	send pid, {self(), 3, 1}
  	receive do
  		{:ok, sum} ->
  			assert sum == 2
  		after 1000 ->
  			assert false 
  	end 	
  end

  test "adder via handler works" do
    pid = Calculator.create
    send pid, {:add, self(), 1, 2}    
    receive do
  		{:ok, sum} ->
  			assert sum == 3
  		after 1000 ->
  			assert false 
  	end
  end

  test "subtractor via handler works" do
    pid = Calculator.create
    send pid, {:subtract, self(), 3, 1}    
    receive do
  		{:ok, sum} ->
  			assert sum == 2
  		after 1000 ->
  			assert false 
  	end
  end
end