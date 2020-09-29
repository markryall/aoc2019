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

  test "applies instruction to determine new points" do
    assert Aoc2019.Day3.apply_instruction([], {"R", 2}) == [{1, 0}, {2, 0}]
    assert Aoc2019.Day3.apply_instruction([{-2, 0}], {"R", 2}) == [{-2, 0}, {-1, 0}, {0, 0}]
  end

  test "applies instructions to accumulate final points" do
    assert Aoc2019.Day3.apply_instructions([{1, 0}], []) == [{1, 0}]
    assert Aoc2019.Day3.apply_instructions([{-1, 0}, {-2, 0}], [{"R", 2}]) == [{-1, 0}, {-2, 0}, {-1, 0}, {0, 0}]
  end
end
