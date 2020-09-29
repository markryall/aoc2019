defmodule Aoc2019Test.Day3 do
  use ExUnit.Case

  test "breaks comma delimited string into a list of instructions" do
    assert Aoc2019.Day3.instructions("R1") == [{"R", 1}]
    assert Aoc2019.Day3.instructions("R1,L1") == [{"R", 1}, {"L", 1}]
  end

  test "calculates path from initial point and instruction" do
    assert Aoc2019.Day3.points({"R", 1}, {0, 0}) == [{1, 0}]
    assert Aoc2019.Day3.points({"R", 2}, {0, 0}) == [{1, 0}, {2, 0}]
    assert Aoc2019.Day3.points({"L", 1}, {0, 0}) == [{-1, 0}]
    assert Aoc2019.Day3.points({"L", 2}, {0, 0}) == [{-1, 0}, {-2, 0}]
    assert Aoc2019.Day3.points({"U", 1}, {0, 0}) == [{0, 1}]
    assert Aoc2019.Day3.points({"U", 2}, {0, 0}) == [{0, 1}, {0, 2}]
    assert Aoc2019.Day3.points({"D", 1}, {0, 0}) == [{0, -1}]
    assert Aoc2019.Day3.points({"D", 2}, {0, 0}) == [{0, -1}, {0, -2}]
  end
end
