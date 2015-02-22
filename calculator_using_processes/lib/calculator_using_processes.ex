defmodule Calculator do
	def create do
		add = spawn(Adder, :loop, [])
		sub = spawn(Subtractor, :loop, [])		
		spawn_link(__MODULE__, :handler, [add, sub])
	end

	def handler(add, sub) do
		receive do
			{:add, sender, n1, n2} ->
				send add, {self(), n1, n2}
				rec(sender)	
				handler(add, sub)										
			{:subtract, sender, n1, n2} ->
				send sub, {self(), n1, n2}
				rec(sender)
				handler(add, sub)			
			_ ->
				:error 
		end
	end

	defp rec(sender) do
		receive do
			{:ok, sum} ->
				send sender, {:ok, sum}
			after 1000 ->
				:nil
		end	
	end
end

defmodule Adder do
	def loop do 
		receive do
			{sender, n1, n2} ->
				sum = n1 + n2
				send sender, {:ok, sum}
				loop
			_ ->
				:error
		end
	end	
end

defmodule Subtractor do
	def loop do
		receive do
			{sender, n1, n2} ->
				sum = n1 - n2
				send sender, {:ok, sum}
				loop
			_ ->
				:error
		end
	end
end