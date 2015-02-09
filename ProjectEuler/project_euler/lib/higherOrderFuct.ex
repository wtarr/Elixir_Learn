defmodule HigherOrderFunction do
  def sum(a, b) do
    a + b
  end

  def someaction() do
   callFunc3(1, 2, &sum/2)
  end

  def callFunc3(a, b, funct) do
    funct.(a, b)
  end
end
