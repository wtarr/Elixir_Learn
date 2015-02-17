defmodule HelperLibrary do

  def is_palindrome(candidate) do
    candidate_as_string = Integer.to_string(candidate)
    candidate_as_string == String.reverse(candidate_as_string)
  end

  def process_file_to_list!(path, function) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Enum.map(&function.(&1))
  end

end
