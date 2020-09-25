defmodule Aoc2019Test.Day1 do
  use ExUnit.Case

  test "calculates fuel" do
    assert Aoc2019.Day1.fuel(12) == 2
    assert Aoc2019.Day1.fuel(14) == 2
    assert Aoc2019.Day1.fuel(1969) == 654
    assert Aoc2019.Day1.fuel(100756) == 33583
  end
end
