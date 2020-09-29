defmodule Aoc2019.Day4 do
  def go() do
    Enum.map(183564..657474, fn n -> n end)
    |> Enum.filter(&valid/1)
    |> Enum.count
    |> IO.inspect
  end

  def valid(n) do
    codepoints = n |> Integer.to_string |> String.codepoints
    codepoints == Enum.sort(codepoints) && Enum.count(Enum.into(codepoints, MapSet.new)) < 6
  end
end
