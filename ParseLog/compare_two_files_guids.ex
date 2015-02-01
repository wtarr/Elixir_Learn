defmodule CompareFileGuids do

  def main do
    mapHasMore = loadFileIntoMap("hasmore.data")
    mapHasLess = loadFileIntoMap("hasless.data")
    s1 = Enum.into(Map.keys(mapHasMore), HashSet.new)
    s2 = Enum.into(Map.keys(mapHasLess), HashSet.new)
    Set.difference(s1, s2) |> Set.to_list
  end

  def loadFileIntoMap(filename) do
   {_result, device} = load(filename)
   linesAsCleanListOfTuples = get_list_of_lines(device)
   build_map_of_guids_from_list(linesAsCleanListOfTuples, Map.new)
  end

  def load(filename) do
    File.open(filename, [:read, :utf8])
  end

  def get_list_of_lines(device) do
    process_line_by_line(device, [])
  end

  def process_line_by_line(file, lines) do
    line = IO.read(file, :line)
    case line do
      :eof ->
        File.close(file)
        lines
      _ ->
        linesPlus1 = line |> String.strip |> process_line lines
        process_line_by_line(file, linesPlus1)
    end
  end

  def process_line(line, lines) do
    [Enum.map(String.split(line, "|"), fn(x) -> String.lstrip x |> String.rstrip end) |> List.to_tuple] ++ lines
  end

  # exit clause
  def build_map_of_guids_from_list([], map) do
    map
  end

  # has items
  def build_map_of_guids_from_list([head|tail], map) do
    build_map_of_guids_from_list(tail, Map.put(map, elem(head, 1), head))
  end

  def get_data_between_brackets(tuple) do
    {timestamp, guid, logdata} = tuple
    Regex.run(~r/\{([^)]+)\}/, logdata) |> List.last
  end

  #Enum.map(String.split("12 | 123 | {stuff}", "|"), fn(x) -> String.lstrip x |> String.rstrip end)
  #["12", "123", "{stuff}"]
end
