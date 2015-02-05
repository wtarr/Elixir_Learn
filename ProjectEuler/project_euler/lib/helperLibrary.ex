defmodule HelperLibrary do

  def is_palindrome(candidate) do
    candidate_as_string = Integer.to_string(candidate)
    candidate_as_string == String.reverse(candidate_as_string)
  end

end
