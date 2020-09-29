defmodule Aoc2019.Day3 do
  def go() do
    {:ok, contents} = File.read("tmp/3.txt")
    lines = contents |> String.split("\n", trim: true)
    [first|tail] = lines
    [second|_] = tail
    IO.inspect(first |> instructions)
    IO.inspect(second |> instructions)
  end

  def instructions(line) do
    line |> String.split(",", trim: true) |> Enum.map(&to_instruction/1)
  end

  def to_instruction(point) do
    {first, last} = String.split_at(point, 1)
    {first, String.to_integer(last)}
  end

  def points({direction, magnitude}, {x, y}) do
    case direction do
      "R" -> Enum.map(1..magnitude, fn xoffset -> {x + xoffset, y} end)
      "L" -> Enum.map(1..magnitude, fn xoffset -> {x - xoffset, y} end)
      "U" -> Enum.map(1..magnitude, fn yoffset -> {x, y + yoffset} end)
      "D" -> Enum.map(1..magnitude, fn yoffset -> {x, y - yoffset} end)
    end
  end
end
