defmodule Aoc2019Test.Day1 do
  use ExUnit.Case

  test "calculates fuel" do
    assert Aoc2019.Day1.fuel(12) == 2
    assert Aoc2019.Day1.fuel(14) == 2
    assert Aoc2019.Day1.fuel(1969) == 654
    assert Aoc2019.Day1.fuel(100756) == 33583
  end

  test "calculates fuel fuel" do
    assert Aoc2019.Day1.fuel_fuel(14) == 2
    assert Aoc2019.Day1.fuel_fuel(1969) == 966
    assert Aoc2019.Day1.fuel_fuel(100756) == 50346
  end
end
