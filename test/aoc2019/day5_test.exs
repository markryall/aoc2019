defmodule Aoc2019Test.Day5 do
  use ExUnit.Case

  test "applies opcode" do
    assert Aoc2019.Day5.op(%{0 => 99}, 0) == {:halt, %{0 => 99}}
    assert Aoc2019.Day5.op(%{0 => 1, 1 => 0, 2 => 0, 3 => 0}, 0) == {:continue, %{0 => 2, 1 => 0, 2 => 0, 3 => 0}, 4}
    assert Aoc2019.Day5.op(%{0 => 2, 1 => 0, 2 => 0, 3 => 0}, 0) == {:continue, %{0 => 4, 1 => 0, 2 => 0, 3 => 0}, 4}
  end
end
