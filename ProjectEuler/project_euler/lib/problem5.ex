defmodule Problem5 do

  def isCandidate(candidate) do    
    result = Enum.reduce(1..20, 0, fn x, acc ->
      
      acc + rem(candidate, x)
    end)

    if result == 0 do
      :true
    end
  end

  def isCandidate2(candidate, current, max) do
    remainder = rem(candidate, current)

    cond do
      (remainder > 0) ->
        :no
      (current > max) -> 
        :no      
      (current == max and remainder == 0) ->
        :yes
      (remainder == 0 and current < max+1) ->
        isCandidate2(candidate, current+1, max)
    end
    
  end

  def candidateCheckServer(listener) do
    receive do
      {:exit} ->
        #IO.puts "exiting ..."
        exit(:ok)
      {:candidate, number, pump} ->
        if isCandidate2(number, 2, 20) == :yes do # start with 2 we know 1 will div evenly!
          send listener, {:found, number}
        else    
          send pump, {:ready, self()}
          candidateCheckServer(listener)
        end     
    end
  end

  def createProcessQueue(listener) do
    (1..100) |> Enum.map(fn(_) -> spawn(Problem5, :candidateCheckServer, [listener]) end)
  end

  def pump(processQueue, current) do
      receive do
        {:ready, sender} ->
           #IO.puts "ready received"
          send sender, {:candidate, current, self()}
          pump(processQueue, current+1)
        {:exit} ->
          processQueue |> Enum.map(fn(pid) -> send pid, {:exit} end)
       end
  end 

  def listener() do
    processqueue = createProcessQueue(self())
    pumppid = spawn(Problem5, :pump, [processqueue, 21])
    Enum.map(processqueue, fn(pid) -> send pid, {:candidate, 1, pumppid} end) # kick off

    # waits for that one message
    receive do       
      {:found, number} ->
        send pumppid, {:exit}
        number
    end

  end

  def solve() do
    listener()
  end


end
