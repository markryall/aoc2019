defmodule Aoc2019.Day2 do
  def go() do
    {:ok, contents} = File.read("tmp/2.txt")
    contents
    |> String.split([",", "\n"], trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.with_index
    |> Enum.map(fn {a, b} -> {b, a} end)
    |> Map.new
    |> start
  end

  def start(state) do
    {:continue, final_state, _index} = op(%{state | 1 => 12, 2 => 2}, 0)
    IO.inspect(Map.take(final_state, [0, 1, 2, 3]))
  end

  def op(state, position) do
    case state[position] do
      1 -> {:continue, add(state, state[position + 1], state[position + 2], state[position + 3]), position + 4}
      2 -> {:continue, multiply(state, state[position + 1], state[position + 2], state[position + 3]), position + 4}
      99 -> {:halt, state}
    end
  end

  def add(state, op1, op2, result) do
    %{state | result => state[op1] + state[op2]}
  end

  def multiply(state, op1, op2, result) do
    %{state | result => state[op1] * state[op2]}
  end
end
