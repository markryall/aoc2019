defmodule Aoc2019.Day1 do
  def go() do
    {:ok, contents} = File.read("tmp/1.txt")
    contents
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(&Aoc2019.Day1.fuel_fuel/1)
    |> Enum.sum
    |> IO.inspect
  end

  def fuel_fuel(mass) do
    fuel = fuel(mass)
    case fuel do
      n when n <= 0 -> 0
      _ -> fuel + fuel_fuel(fuel)
    end
  end

  def fuel(mass) do
    floor(mass/3)-2
  end
end
