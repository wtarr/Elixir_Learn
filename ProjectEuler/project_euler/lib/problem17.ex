defmodule Problem17 do

  def process(line) do
    String.replace(line, "-", "") |> String.length
  end

  def readFile() do
    listWithIndex = HelperLibrary.process_file_to_list!('numbers.dat', &process/1)
    |> Enum.with_index

    # add to dictionary, increment index + 1 and use as key (optional, else just remember its 0 based)

    # todo

    # 1..1000
    # if less than 100
    #   take from dictionary
    # if gt or eq 100 and lt 1000
    #   first digit (hundred) on right will be 1 to 9 + "AND"(3) + second two digits via dict look up
    # if eq 1000
      # 12
    # add all together
    # profit??

  end
end
