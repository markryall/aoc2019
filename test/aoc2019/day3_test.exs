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

  test "solution" do
    assert Aoc2019.Day3.solve(
      "R75,D30,R83,U83,L12,D49,R71,U7,L72",
      "U62,R66,U55,R34,D71,R55,D58,R83"
    ) == 159
    assert Aoc2019.Day3.solve(
      "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51",
      "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7"
    ) == 135
  end
end
