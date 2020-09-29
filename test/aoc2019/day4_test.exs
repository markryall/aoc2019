defmodule Aoc2019Test.Day4 do
  use ExUnit.Case

  test "valid" do
    assert Aoc2019.Day4.valid(111111) == true
    assert Aoc2019.Day4.valid(223450) == false
    assert Aoc2019.Day4.valid(123789) == false
    assert Aoc2019.Day4.valid(112233) == true
    assert Aoc2019.Day4.valid2(123444) == false
    assert Aoc2019.Day4.valid2(111122) == true
  end

  test "valid2" do
    assert Aoc2019.Day4.valid2(111111) == true
    assert Aoc2019.Day4.valid2(223450) == false
    assert Aoc2019.Day4.valid2(123789) == false
    assert Aoc2019.Day4.valid2(112233) == true
    assert Aoc2019.Day4.valid2(123444) == false
    assert Aoc2019.Day4.valid2(111122) == true
    assert Aoc2019.Day4.valid2(111222) == false
  end
end
