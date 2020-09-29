defmodule Aoc2019.Day4 do
  def go() do
    Enum.map(183564..657474, fn n -> n end)
    |> Enum.filter(&valid2/1)
    |> Enum.count
    |> IO.inspect
  end

  def valid(n) do
    codepoints = n |> Integer.to_string |> String.codepoints
    codepoints == Enum.sort(codepoints) && Enum.count(Enum.into(codepoints, MapSet.new)) < 6
  end

  def valid2(n) do
    codepoints = n |> Integer.to_string |> String.codepoints
    distribution = codepoints |> Enum.reduce(%{}, fn char, acc -> Map.update(acc, char, 1, &(&1 + 1)) end)
    pairs = Map.values(distribution) |> Enum.filter(fn count -> count == 2 end)
    codepoints == Enum.sort(codepoints) && Enum.count(pairs) > 0
  end
end
