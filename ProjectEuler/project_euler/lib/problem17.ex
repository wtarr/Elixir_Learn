defmodule Problem17 do
  
  def solve() do

    file = open("F:\\Documents\\GitHub\\Elixir_Learn\\ProjectEuler\\project_euler\\lib\\numbers.dat")

    listWithIndex = build_list file, [], 1

    lookup = build_lookup_dictionary listWithIndex

    result = Enum.reduce( 1..1000, 0, fn x, acc -> resolve lookup, x, acc end )  

    result

  end

  def resolve(lookup, x, acc) do
    cond do
      (x < 100) ->
        handleLessThan100 lookup, acc, x
      ((x >= 100) and (x < 1000) and (rem(x, 100) == 0)) -> # 100, 200 ...
        handleHundreds lookup, acc, x
      (x > 100 and x < 1000 and (rem(x, 100) != 0)) -> # 101, 202, 303 ...
        handleHundredsOther lookup, acc, x
      (x == 1000) ->
        acc + String.length("onethousand")
    end
  end

  def findLength(line) do
    p1 = line |> String.strip |> String.replace "-", "" 
    p1 = p1 |> String.replace " ", ""
    p1 |> String.length
  end

  def build_lookup_dictionary list do
    Enum.reduce(list, HashDict.new(), fn(x, dict) -> 
      {k, v} = x
      dict = HashDict.put(dict, k, v)
      dict
    end
    )
  end

  def handleLessThan100(lookup, acc, x) do
    {_, v} = HashDict.fetch(lookup, x)        
    acc = acc + v
    acc
  end

  def handleHundreds(lookup, acc, x) do
    hundred = div(x, 100)
    {_, h} = HashDict.fetch(lookup, hundred)
    acc = acc + h + String.length("hundred")
    acc
  end

  def handleHundredsOther(lookup, acc, x) do
    hundred = div(x, 100)
    ten = x - (hundred * 100)
    {_, h} = HashDict.fetch(lookup, hundred)
    {_, t} = HashDict.fetch(lookup, ten)
    acc = acc + h + String.length("hundred") + String.length("and") + t
    acc
  end

  def open(filename) do
    {result, device} = File.open(filename, [:read, :utf8])
    if result == :error do
      IO.puts "error loading file"
    else
      device
    end
  end

  def build_list(file, lines, linenumber) do
    line = IO.read(file, :line)
    case line do
      :eof ->
        File.close(file)
        lines
      _ ->
        #IO.puts "#{line}"
        length = findLength line
        lines = [{linenumber, length}] ++ lines
        build_list file, lines, linenumber + 1
    end
  end  
end



