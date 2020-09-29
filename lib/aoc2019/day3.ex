defmodule Aoc2019.Day3 do
  def go() do
    {:ok, contents} = File.read("tmp/3.txt")
    lines = contents |> String.split("\n", trim: true)
    IO.inspect(solve2(Enum.at(lines, 0), Enum.at(lines, 1)))
  end

  def solve(first, second) do
    first_points = first |> instructions |> apply_instructions
    second_points = second |> instructions |> apply_instructions
    MapSet.intersection(Enum.into(first_points, MapSet.new), Enum.into(second_points, MapSet.new))
    |> Enum.map(fn {x, y} -> abs(x) + abs(y) end)
    |> Enum.filter(fn x -> x > 0 end)
    |> Enum.min
  end

  def solve2(first, second) do
    first_points = first |> instructions |> apply_instructions
    second_points = second |> instructions |> apply_instructions
    MapSet.intersection(Enum.into(first_points, MapSet.new), Enum.into(second_points, MapSet.new))
    |> Enum.map(fn point -> calculate_steps(point, first_points, second_points) end)
    |> Enum.filter(fn x -> x > 0 end)
    |> Enum.min
  end

  def calculate_steps(point, first, second) do
    Enum.find_index(first, fn item -> item == point end) + Enum.find_index(second, fn item -> item == point end) + 2
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

  def apply_instruction([], instruction) do
    points(instruction, {0, 0})
  end

  def apply_instruction(points, instruction) do
    points ++ points(instruction, List.last(points))
  end

  def apply_instructions(instructions) do
    apply_instructions([], instructions)
  end

  def apply_instructions(points, []) do
    points
  end

  def apply_instructions(points, [instruction|rest]) do
    apply_instructions(apply_instruction(points, instruction), rest)
  end
end
