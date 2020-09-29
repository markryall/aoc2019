defmodule Aoc2019Test.Day4 do
  use ExUnit.Case

  test "valid/invalid" do
    assert Aoc2019.Day4.valid(111111) == true
    assert Aoc2019.Day4.valid(223450) == false
    assert Aoc2019.Day4.valid(123789) == false
  end
end
